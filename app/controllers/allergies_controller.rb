class AllergiesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @allergies = @user.allergies
  end

  def show
    @allergy = Allergy.find(params[:id])
  end

  def new
    @allergy = Allergy.new
  end

  def create
    @allergy = Allergy.new(params[:allergy])
    if @allergy.save
      redirect_to @allergy.user, :notice => "Successfully created allergy."
    else
      render :action => 'new'
    end
  end

  def edit
    @allergy = Allergy.find(params[:id])
  end

  def update
    @allergy = Allergy.find(params[:id])
    if @allergy.update_attributes(params[:allergy])
      redirect_to @allergy, :notice  => "Successfully updated allergy."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @allergy = Allergy.find(params[:id])
    @allergy.destroy
    redirect_to allergies_url, :notice => "Successfully destroyed allergy."
  end
end
