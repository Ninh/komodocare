class MedicationsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @medications = Medication.all
  end

  def show
    @medication = Medication.find(params[:id])
  end

  def new
    @medication = Medication.new
  end

  def create
    @medication = Medication.new(params[:medication])
    if @medication.save
      redirect_to @medication.user, :notice => "Successfully created medication."
    else
      render :action => 'new'
    end
  end

  def edit
    @medication = Medication.find(params[:id])
  end

  def update
    @medication = Medication.find(params[:id])
    if @medication.update_attributes(params[:medication])
      redirect_to @medication, :notice  => "Successfully updated medication."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @medication = Medication.find(params[:id])
    @medication.destroy
    redirect_to medications_url, :notice => "Successfully destroyed medication."
  end
end
