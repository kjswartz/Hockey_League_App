class EventsController < ApplicationController

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "Game Added!"
      redirect_to root_url
    else
      flash[:notice] = "Unable to add game."
      redirect_to root_url
    end
  end
  
end
