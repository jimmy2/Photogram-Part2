class Post < ActiveRecord::Base
  has_attached_file :image, styles: { :medium => "640x" }
  validates :image, presence: true
  validates :user_id, presence: true 

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  belongs_to :user
end
