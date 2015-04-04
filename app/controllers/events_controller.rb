class EventsController < ApplicationController
  before_action :set_team

  def new
  end

  def create
    @event = Event.new(event_params)
    @event.team_id = @team.id
    @event.user_id = current_user.id

    respond_to do |format|
      if @event.save
        format.html { redirect_to [@team.league, @team], notice: 'Event was successfully created.' }
        # format.json { render :show, status: :created, location: @team }
      else
        format.html { redirect_to [@team.league, @team] }
        # format.html { render :new }
        # format.json { render json: @event }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to [@team.league, @team], notice: 'Event was successfully updated.' }
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
      params.require(:event).permit(:team_id, :user_id, :start_date, :stop_date, :description)
    end

end
