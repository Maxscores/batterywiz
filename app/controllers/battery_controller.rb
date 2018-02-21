class BatteryController < ApplicationController
  def new
    @installation = Installation.new()
    @categories = Category.all
  end

  def create
    require "pry"; binding.pry
  end

end
