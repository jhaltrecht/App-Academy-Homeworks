class CatsRentalRequestsController < ApplicationController
    def new
        @cat_rental_requests=CatsRentalRequests.new
        render :new
    end
end
