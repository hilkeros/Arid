class ActivityLogger < ActiveRecord::Observer
  observe :comment, :friendship
  
  def after_create model
    Activity.create(:user_id => model.user_id, :target => model.target, :action => model)
  end
  
end
