class CatRentalRequest<ApplicationRecord
    STATUSES=['PENDING','APPROVED', 'DENIED']
    validates :start_date,:end_date,:status, presence: true
    validates :status, inclusion: STATUSES
    validate :does_not_overlap_approved_request

    def does_not_overlap_approved_request
        unless overlapping_approved_requests.empty?
            errors[:status]<<"Overlapping approved request"
        end
    end

    belongs_to :cat,
    class_name: "Cat",
    foreign_key: :cat_id,
    primary_key: :id

    def overlapping_requests
        CatRentalRequest.where.not(id: self.id).where(cat_id: self.cat_id).where.not('cat_rental_requests.start_date > ? OR cat_rental_requests.end_date < ?', self.end_date,self.start_date)
    end

    def overlapping_approved_requests
        overlapping_requests.where(status: '\'APPROVED\'')
    end

    def approve!
        raise "Not Pending" unless self.status='PENDING'
        transaction do
            self.status='APPROVED'
            self.save!

            overlapping_pending_requests.each do |request|
                request.update!(status: 'DENIED' )
            end

        end
    end

    def deny!
         self.status='DENIED'
            self.save!
    end

    def overlapping_pending_requests
       overlapping_requests.where(status: '\'PENDING\'')
    end

end
