class TeamsController < ApplicationController
  before_action :set_team, except: [:new, :create]
  before_action :set_league, except: [:subscribe]
  before_action :team_owner, only: [:edit, :update]
  before_action :league_select, only: [:edit, :update, :create]
  before_action :set_events, only: [:show]

  def will_attend
    GameAttendance.find_or_create_by(user: current_user, game_id: params[:game_id], team: @team)
    if request.referer.include? 'users'
      redirect_to current_user
    else
      redirect_to league_team_path(@team.league, @team)
    end
  end

  def not_attend
    GameAttendance.find_by(user: current_user, game_id: params[:game_id], team: @team).destroy
    if request.referer.include? 'users'
      redirect_to current_user
    else
      redirect_to league_team_path(@team.league, @team)
    end
  end

  def show
  end

  def new
    @team = @league.teams.new
  end

  def edit
  end

  def subscribe
    UserMailer.request_team_access_email(current_user, @team).deliver_later
    redirect_to [@team.league, @team], alert: 'The Team captain has been alerted of your desire to join.'
  end

  def create
    @team = Team.new(team_params)
    @team.users << current_user

    respond_to do |format|
      if @team.save
        # UserMailer.welcome_email(@user).deliver_later
        format.html { redirect_to @team.league, notice: 'Team created and pending League Admin Approval.' }
      else
        flash[:error] = "We were unable to create team. #{@team.errors.full_messages.join('. ')}"
        format.html { render :new }
      end
    end
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
      @team_weekly_games = @team.games.weekly_games
      @team_current_games = @team.games.current_games
      @team_prior_games = @team.games.prior_games
    end

    def set_league
      @league = League.find(params[:league_id])
    end

    def set_events
      @event = @team.events.new(user_id: current_user.try(:id))
      @events = @team.events.where(team_id: @team)
      @current_events = @events.current.order('start_date asc')
    end

    def team_owner
      redirect_to root_path, alert: "Permission not configured." if current_user.blank? || !current_user.team_owner?(@team)
    end

    def league_select
      @league_select = League.all.collect { |l| [l.skill, l.id] }
    end

    def team_params
      params.require(:team).permit(:name, :game_id, :league_id, :owner, :active, user_ids: [], game_ids: [])
    end
end
