class WelcomeController < ApplicationController
  def index
    @leagues = League.all
  end
end
