class TeamsController < ApplicationController
  before_action :set_team
  before_action :team_owner, only: [:edit, :update]
  before_action :league_select, only: [:new, :edit, :update, :create]

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def subscribe
    UserMailer.request_team_access_email(current_user, @team).deliver_later
    redirect_to @team
  end

  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    def set_team
      @team = Team.find(params[:id])
      # @team_owner = true if current_user.try(:email) == @team.owner
      # @team_member = true if @team.users.find_by(id: current_user)
    end

    def team_owner
      redirect_to root_path, alert: "Permission not configured." if @team_owner.nil?
    end

    # def team_owner
    #   @team_owner = true if current_user[:email] == @team.owner
    # end
    #
    # def team_member
    #   @team_member = true if @team.users.find_by(id: current_user)
    # end

    def league_select
      @league_select = League.all.collect { |l| [l.skill, l.id] }
    end

    def team_params
      params.require(:team).permit(:name, :league_id, :user_ids, :owner, :active)
    end
end
