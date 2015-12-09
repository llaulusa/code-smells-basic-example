class OwnersController < ApplicationController
  def index
    @owners = Owner.all.sort_by{|owner| owner.first_name }
  end

  def show
    @onr = nil
    @onr = Owner.find(params[:id])
    return @onr if @onr
  end


  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)
    if @owner.save
      redirect_to owners_path, success: "Owner with name #{params[:owner][:first_name]} #{params[:owner][:last_name]} was created successfully"
    else
      redirect_to owners_path, success: "Owner with name #{params[:owner][:first_neme]} #{params[:owner][:last_name]} was not created successfully"
    end
  end
  
  def edit
    @owner = Owner.find_by(name: params[:name])
  end
  
  def update
    @owner = Owner.find_by(id: params[:id])
    if @owner.update(owner_params)
      # redirect_to owners_path, success: "Owner with name #{params[:owner][:first_name]} #{params[:owner][:last_name]} was updated successfully"
    else
      flash[:error] = "Owner with name #{params[:owner][:first_name]} #{params[:owner][:last_name]} was not created successfully"
      # render 'edit'
    end
  end

  def destroy
    p = params[:id]
    message = nil
    success_message = ""
    error_message = ''
    @onr = Owner.find(r)
    if @onr && @onr.persisted? && p
      #destroy all my cats
      @onr.cats.each do |cat|
        cat.destroy
      end
      if @onr.destroy
        success_message = "owner destroyed" 
        flash[:success] = success_message
        redirect_to owners_path
      end
    else
      error_message = "owner not destroyed because something happened with #{params[:id]}"
      flash[:error] = error_message
      # redirect_to owners_path
    end 
  end
  

  private
    def owner_params
        params.require(:owner).permit(:first_name, :last_name, :age, :race, :location)
    end
end
