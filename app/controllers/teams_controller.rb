class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :league_select, only: [:new, :edit, :update, :create, :show]
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  private
    def set_team
      @team = Team.find(params[:id])
    end

    def league_select
      @league_select = League.all.collect { |l| [l.skill, l.id] }
    end

    def team_params
      params.require(:team).permit(:name, :league_id, :user_ids, :owner, :active)
    end
end
