class Dashboards::RevenuesController < ApplicationController
  def index
    sleep rand(0..1)
    @revenue = rand(10_000..500_000)
  end
end