class UserAccessRule
  include Mongoid::Document
  include Mongoid::Userstamp
  include Mongoid::Timestamps

  field :can_write, type: Boolean, default: false
  field :can_share, type: Boolean, default: false
  field :can_delete, type: Boolean, default: false
  
  belongs_to :app
  belongs_to :organizational_unit
  embedded_in :user

end
