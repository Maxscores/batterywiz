class BatteryController < ApplicationController
  def new
    @installation = Installation.new()
    @categories = Category.all
  end

  def create
    require "pry"; binding.pry
  end

  private
    def method_name

    end
end
