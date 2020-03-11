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
        CatRentalRequest.select("cat_rental_requests.*")
        .where.not(id: self.id).where(cat_id: self.cat_id).where.not(start_date.between?(self.start_date,self.end_date),end_date.between?(self.start_date,self.end_date))
    end

    def overlapping_approved_requests
        overlapping_requests.where(status='\'APPROVED\'')
    end

end
