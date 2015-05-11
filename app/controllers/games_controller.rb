class GamesController < ApplicationController
  before_action :set_league
  before_action :check_user_admin, only: [:new, :create, :edit, :update, :index]
  before_action :team_select, only: [:new, :edit, :update, :create]
  before_action :set_game, only: [:edit, :update]

  def index
    @games = Game.all
  end

  def show
  end

  def new
    @game = @league.games.new
  end

  def edit
  end

  def create
    @game = Game.new(game_params)
    @home_team = Team.find_by(id: @game.home_team.try(:id))
    @away_team = Team.find_by(id: @game.away_team.try(:id))

    respond_to do |format|
      if @game.save

        @game.set_teams(@game, @home_team, @away_team)
        @game.set_team_attendance(@game, @home_team, @away_team)

        format.html { redirect_to @league, notice: 'Game was successfully created.' }
      else
        flash[:error] = "Unable to create game. #{@game.errors.full_messages.join('. ')}"
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to league_games_path, notice: 'Game was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    def set_game
      @game = Game.find(params[:id])
    end

    def set_league
      @league = League.find_by(id: params[:league_id])
      @league_today_games = @league.games.today_games
    end

    def check_user_admin
      redirect_to root_path, alert: "Permission not configured." if !current_user.try(:admin) || current_user.nil?
    end

    def team_select
      @team_select = Team.active.where(league_id: @league.id)
    end

    def game_params
      params.require(:game).permit(:time, :home_goals, :away_goals, :league_id, :home_team_id, :away_team_id, :winner_id, :loser_id, :home_points, :away_points)
    end

end
