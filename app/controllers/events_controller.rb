class EventsController < ApplicationController
  before_action :set_team

  def create
    @event = Event.new(event_params)
    @event.stop_date = @event.start_date if @event.stop_date.blank?

    respond_to do |format|
      if @event.save
        format.html { redirect_to [@team.league, @team], notice: 'Event was successfully created.' }
      else
        format.html { redirect_to [@team.league, @team] }
      end
    end
  end

  def edit
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

  def destroy
    Event.find_by(user: current_user, team_id: params[:team_id]).destroy
    redirect_to league_team_path(@team.league, @team)
  end

  private
    def set_team
      @team = Team.find_by(id: params[:team_id])
    end

    def event_params
      params.require(:event).permit(:team_id, :user_id, :start_date, :stop_date, :description, team_ids: [])
    end

end
