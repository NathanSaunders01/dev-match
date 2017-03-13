class ProfilesController < ApplicationController
  # Define instance variables with @ in controller and then reference them in views files
  # Must have same def/view file name for it to pick. Example def new and views->profiles->new
  # Active Record Querying documentation for other examples for accessing DB
  
  # Use rails routes in console to find what URL path should be used and 
  # what dynamic ids need to be included. Use params in relevant controller file
  # to include the paramater.

  # GET to /users/:user_id/profile/new
  def new
    # Render blank profile details form
    # Profile.new refers to model file for profile
    @profile = Profile.new
  end
  
  # POST to /users/:user_id/profile
  def create
    # Ensure that we have the user who is filling form by finding ID in URL for user
    @user = User.find( params[:user_id] )
    # Create profile linked to this specific user. Check profile_params in function below
    # See build_"association" in Active Record Association documentation for more examples
    @profile = @user.build_profile( profile_params )
    # EXAMPLE: @profile = @user.images.build(). See profile model for "has_many"
    if @profile.save
      flash[:success] = "Profile updated!"
      redirect_to user_path(id: params[:user_id] )
    else 
      # render isn't another request/GET, it returns original page
      # Rails render layouts documentation for explanation
      render action: :new
    end
  end
  
  # This is for GET requests made to /users/:user_id/profile/edit
  def edit
    @user = User.find( params[:user_id] )
    @profile = @user.profile
  end
  
  # PUT/PATCH to /users/:user_id/profile
  def update
    # Retrieve the user from the DB
    @user = User.find( params[:user_id] )
    # Retrieve the user's profile
    @profile = @user.profile
    # Mass assign edited profile attributes and save (update)
    if @profile.update_attributes( profile_params)
      flash[:success] = "Profile updated!"
      # Redirect user to their profile page
      redirect_to user_path(id: params[:user_id] )
    else 
      render action: :edit
    end
  end
  
  private 
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :avatar, :job_title, :phone_number, :contact_email, :description)
    end
end