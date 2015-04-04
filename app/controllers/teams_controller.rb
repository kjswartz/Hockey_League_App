class TeamsController < ApplicationController
  before_action :set_team
  before_action :team_owner, only: [:edit, :update]
  before_action :league_select, only: [:new, :edit, :update, :create]

  def show
    @event = Event.new
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
      params.require(:team).permit(:name, :league_id, :owner, :active, user_ids: [])
    end
end
