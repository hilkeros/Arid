class Activity < ActiveRecord::Base
  belongs_to :target, :polymorphic => true
  belongs_to :action, :polymorphic => true
end
