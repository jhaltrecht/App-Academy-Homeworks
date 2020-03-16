class CatRentalRequestsController < ApplicationController
    def new
        @cat_rental_requests=CatRentalRequest.new
        render :new
    end

    def create
        @cat_rental_requests=CatRentalRequest.new(cat_rental_requests_params)
        if @cat_rental_requests.save!
            redirect_to cat_url(@cat_rental_requests.cat)
        else @cat_rental_requests.errors.full_messages
        end
    end

    def cat_rental_requests_params
        params.require(:cat_rental_request).permit(:cat_id,:start_date,:end_date,:status)
    end

    def approve
        @cat_rental_requests=CatRentalRequest.find(params[:id])
        @cat_rental_requests.approve!
        redirect_to cat_url(@cat_rental_requests.cat)
    end

    def deny
        @cat_rental_requests=CatRentalRequest.find(params[:id])
        @cat_rental_requests.deny!
        redirect_to cat_url(@cat_rental_requests.cat)

    end
end