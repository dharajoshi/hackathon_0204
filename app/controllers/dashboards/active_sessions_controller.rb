class Dashboards::ActiveSessionsController < ApplicationController
  def index
    sleep rand(0..1)
    @session_count = rand(100..500)
  end
end