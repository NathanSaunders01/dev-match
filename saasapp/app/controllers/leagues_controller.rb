class LeaguesController < UsersController
  def index
    @users = User.includes(:profile)
  end
end