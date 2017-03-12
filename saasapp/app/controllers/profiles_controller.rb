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
      redirect_to user_path( params[:user_id] )
    else 
      # render isn't another request/GET, it returns original page
      # Rails render layouts documentation for explanation
      render action: :new
    end
  end
  
  private 
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :avatar, :job_title, :phone_number, :contact_email, :description)
    end
end