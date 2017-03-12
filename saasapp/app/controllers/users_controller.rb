class UsersController < ApplicationController
  
  #G GET to /users/:id
  def show 
    @user = User.find( params[:id] )
  end
  
end