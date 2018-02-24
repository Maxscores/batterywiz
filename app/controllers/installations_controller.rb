class InstallationsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @installations = current_user.installations
  end

  def show
    if current_user && current_user.installations.exists?(params[:id])
      @presenter = InstallationPresenter.new(params[:id])
    elsif session[:installation_id].to_i == params[:id].to_i
      @presenter = InstallationPresenter.new(params[:id])
    else
      not_found
    end
  end

  def new
    @installation = Installation.new()
  end

  def create
    installation = Installation.new(installation_params)
    if current_user
      installation.user = current_user
    end
    if installation.save!
      session[:installation_id] = installation.id
      redirect_to new_consumption_path
    else
      flash[:message] = "The Build Failed, please make sure require fields are filled and  try again"
      redirect_to new_installation_path
    end
  end

  private
    def installation_params
      params.require(:installation).permit(:zipcode)
    end


end
