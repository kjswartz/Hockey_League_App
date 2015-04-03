class EventsController < ApplicationController
  before_action :set_team

  def new
  end

  def create
    @event = @team.events.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @team, notice: 'Event was successfully created.' }
        # format.json { render :show, status: :created, location: @team }
      else
        format.html { redirect_to @team }
        # format.html { render :new }
        # format.json { render json: @event }
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
    def set_team
      @team = Team.find_by(id: params[:team_id])
    end

    def event_params
      params.require(:event).permit(:team_id, :opponent_id, :game_time)
    end

end
