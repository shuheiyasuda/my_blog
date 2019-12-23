class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, :category, :content, presence: true 

  enum category: { "LIFE": 1,
                   "WORK": 2,
                   "HOBBY": 3,
                   "PROGRAMMING": 4,
                   "OTHER": 5}
end
