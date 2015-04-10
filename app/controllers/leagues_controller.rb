class LeaguesController < ApplicationController

  def index
    @leagues = League.all
  end

  def show
    @league = League.find(params[:id])
    @league_weekly_games = @league.games.current(Time.zone.now).weekly(1.week.from_now).order('time asc')
  end
end
