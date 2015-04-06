class TeamsController < ApplicationController
  before_action :set_team
  before_action :team_owner, only: [:edit, :update]
  before_action :league_select, only: [:new, :edit, :update, :create]

  def will_attend
    GameAttendance.find_or_create_by(user: current_user, game_id: params[:game_id], team: @team)
    redirect_to league_team_path(@team.league, @team)
  end

  def not_attend
    GameAttendance.find_by(user: current_user, game_id: params[:game_id], team: @team).destroy
    redirect_to league_team_path(@team.league, @team)
  end

  def show
    @event = @team.events.new(user_id: current_user.try(:id))
    @events = @team.events.where(team_id: @team)
  end

  def new
  end

  def edit
  end

  def subscribe
    UserMailer.request_team_access_email(current_user, @team).deliver_later
    redirect_to [@team.league, @team]
  end

  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to [@team.league, @team], notice: 'Team was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    def set_team
      @team = Team.find(params[:id])
      @owner = User.find_by(email: @team.owner)
    end

    def team_owner
      redirect_to root_path, alert: "Permission not configured." if !current_user.team_owner?(@team)
    end

    def league_select
      @league_select = League.all.collect { |l| [l.skill, l.id] }
    end

    def team_params
      params.require(:team).permit(:name, :game_id, :league_id, :owner, :active, user_ids: [], game_ids: [])
    end
end
