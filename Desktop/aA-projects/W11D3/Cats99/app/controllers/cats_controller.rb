class CatsController < ApplicationController
    def index
        @cats=Cat.all
        render :index
    end

    def show

    end

    def new

    end

    def edit

    end
end
