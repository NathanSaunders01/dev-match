class LeaguesController < ApplicationController
  def index
    
    # Controller pulls users from User db, joins the Profile and only selects those
    # users with a profile that has a first name stored. This prevents blank profiles
    # appearing in the league table
    
    @LMSusers = User.joins(:profile).where.not('first_name = ?','').order('last_sign_in_at DESC')
    @MVPusers = User.joins(:profile).where.not('first_name = ?','').order('sign_in_count DESC')
    
    # This finds the index/position of the the current user in the ordered list
    # No need to join/include profile as the field 'last_sign_in_at' and 'sign_in_count'
    # Are fields from the users db, not profiles
    
    @LMSuser_position = User.order('last_sign_in_at DESC').find_index(current_user)
    @MVPuser_position = User.order('sign_in_count DESC').find_index(current_user)
  end
end