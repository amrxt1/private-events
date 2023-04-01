class EventsController < ApplicationController
    def index
        @events = Event.order(date: :desc)
    end

    def new
        @event = Event.new
    end

    def create
        @event = Event.new(event_params)
        @event.creator = current_user
        
        if @event.save
            redirect_to root_url
        else
            render :new
        end
    end

    def show
        @event = Event.find(params[:id])
    end
    private
    def event_params
        params.require(:event).permit(:location, :date, :name, :description)
    end
end
