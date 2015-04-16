class WelcomeController < ApplicationController
  def index
    @leagues = League.all
    @rosters = Roster.all
    @roster_sample = @rosters.sample(3)
  end
end
