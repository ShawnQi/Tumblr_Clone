class ActivsController < ApplicationController
  before_filter :require_current_user!
  before_filter :get_menu_stats
  
  def index
    @activs = Activ.where('got_user_id=?', current_user.id)
                   .order("created_at DESC")
                   .limit(20)
  end
end
