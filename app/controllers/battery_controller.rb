class BatteryController < ApplicationController
  def new
    @installation = Installation.new()
    @categories = Category.all
  end

end
