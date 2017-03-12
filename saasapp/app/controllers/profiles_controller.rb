class ProfilesController < ApplicationController
  # Define instance variables with @ in controller and then reference them in views files
  # Must have same def/view file name for it to pick. Example def new and views->profiles->new
  
  # GET to /users/:user_id/profile/new
  def new
    # Render blank profile details form
    @profile = Profile.new
  end
end