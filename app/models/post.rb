class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user

  validates :title, presence: true
  validates :category, presence: true
  validates :content, presence: true

  enum category: { "生活、暮らし": 1,
                   "仕事": 2,
                   "趣味": 3,
                   "プログラミング": 4,
                   "その他": 5}
end
