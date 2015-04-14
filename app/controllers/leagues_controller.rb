class LeaguesController < ApplicationController

  before_action :set_league, only: [:show]

  def index
    @leagues = League.all
  end

  def show
  end

  private

  def set_league
    @league = League.find(params[:id])
    @league_weekly_games = @league.games.weekly_games
    @league_prior_games = @league.games.prior_games
    @league_current_games = @league.games.current_games
  end

end
