class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions

  has_many :posts
  belongs_to_active_hash :year
  belongs_to_active_hash :month

  enum date: {"1日": 1,"2日": 2, "3日": 3, "4日": 4, "5日": 5, "6日": 6, "7日": 7, "8日": 8, "9日": 9, "10日": 10,
              "11日": 11,"12日": 12, "13日": 13, "14日": 14, "15日": 15, "16日": 16, "17日": 17, "18日": 18, "19日": 19, "20日": 20,
              "21日": 21,"22日": 22, "23日": 23, "24日": 24, "25日": 25, "26日": 26, "27日": 27, "28日": 28, "29日": 29, "30日": 10,
              "31日": 31}


  validates :nickname, presence: true, uniqueness: true, length: { maximum: 6 }
  validates :email, presence: true, uniqueness: true
  validates :phone_number, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :year_id, presence: {message:"を選択して下さい"}
  validates :month_id, presence: {message:"を選択して下さい"}
  validates :date_id, presence: {message:"を選択して下さい"}
end
