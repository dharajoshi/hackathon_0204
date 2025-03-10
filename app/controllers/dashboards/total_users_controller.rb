class Dashboards::TotalUsersController < ApplicationController

  def index
    sleep rand(1..2)
    @total_users = rand(0..100)
  end

end