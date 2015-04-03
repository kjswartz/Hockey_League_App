class EventsController < ApplicationController

  def new
  end

  def index
  end

  def edit
  end

  def show
  end

  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to '/', notice: 'Event was successfully created.' }
      else
        flash[:error] = "We were unable to add this event. #{@event.errors.full_messages.join('. ')}"
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @team, notice: 'Event was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private

    def event_params
      params.require(:event).permit(:team_id, :opponent_id, :game_time)
    end

end
