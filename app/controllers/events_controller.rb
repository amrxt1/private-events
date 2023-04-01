class EventsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :show]

    def index
        @events_future, @events_past, @today = [], [], []
        @events = Event.all
        @events.filter do |e|
            if e.date > Date.today 
                (@events_future.push(e))
            elsif e.date == Date.today
                @today.push e
            else
                (@events_past.push(e))
            end
        end
    end

    def new
        @event = Event.new
    end

    def create
        @event = Event.new(event_params)
        @event.creator = current_user
        
        if @event.save
            redirect_to events_url
        else
            render :new, status: :unprocessable_entity
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
