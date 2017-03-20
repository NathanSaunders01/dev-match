class LeaguesController < ApplicationController
  def index
    @LMSusers = User.all.order('last_sign_in_at DESC')
    @MVPusers = User.all.order('sign_in_count DESC')
  end
end