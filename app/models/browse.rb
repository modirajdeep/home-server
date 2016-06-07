class Browse < ActiveRecord::Base
    belongs_to :user
    default_scope -> { order(created_at: :desc) }
    validates :user_id, presence: true
    mount_uploader :file, FileUploader
    
end
