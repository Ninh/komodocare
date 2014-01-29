class UploadsController < ApplicationController
  def index
    @uploads = Upload.all
  end

  def show
    @upload = Upload.find(params[:id])
  end

  def new
    @upload = Upload.new
  end

  def create
    @upload = Upload.new(params[:upload])
    if @upload.save
      redirect_to @upload.user, :notice => "Successfully created upload."
    else
      render :action => 'new'
    end
  end

  def edit
    @upload = Upload.find(params[:id])
  end

  def update
    @upload = Upload.find(params[:id])
    if @upload.update_attributes(params[:upload])
      redirect_to @upload, :notice  => "Successfully updated upload."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy
    @user = User.find(params[:id])
    redirect_to @user, :notice => "Successfully destroyed upload."
  end
end
