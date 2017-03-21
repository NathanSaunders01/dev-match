class LeaguesController < ApplicationController
  def index
    @LMSusers = User.order('last_sign_in_at DESC')
    @MVPusers = User.limit(5).order('sign_in_count DESC')
    @LMSuser_position = User.order('last_sign_in_at DESC').find_index(current_user)
    @MVPuser_position = User.order('sign_in_count DESC').find_index(current_user)
  end
end