# usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|uniqueness: true|
|password|string|null: false|uniqueness: true|
|nickname|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|year_id|integer|null: false|
|month_id|integer|null: false|
|date_id|integer|null: false|
|phone_number|string|null: false|uniqueness: true|
|icon|string|


### Association
- has_many :posts
- belongs_to_active_hash :year
-  belongs_to_active_hash :month


# postsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key: true|
|category|integer|null: false|
|title|string|null: false|
|image|text|null: false|
|content|text|null: false|


### Associtaion
- belongs_to :user

# yearモデル
# monthモデル
- 静的なデータのためアクティブハッシュを使用しました。