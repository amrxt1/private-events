class UsersController < ApplicationController
    def show
        @events = current_user.created_events
        @attended_events = current_user.attended_events()
        @past, @future = [], []
        @attended_events.each do |e|
            e.date > Date.today ? (@future.push(e)) : (@past.push(e))
        end
    end
end
  