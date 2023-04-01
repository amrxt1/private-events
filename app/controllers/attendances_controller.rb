class AttendancesController < ApplicationController
    before_action :authenticate_user!

    def new
        self.create
    end
    def create
        @event = Event.find(params[:event_id])
        if @event.attendees << current_user
            redirect_to root_url
        else
            redirect_to events_path
        end
    end

end
