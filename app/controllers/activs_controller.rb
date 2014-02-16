class ActivsController < ApplicationController
  before_filter :require_current_user!
  
  def index
    @activs = Activ.where('sent_user_id=? OR got_user_id=?', current_user.id, current_user.id)
                   .order("created_at DESC")
                   .limit(20)
  end
end
