FactoryBot.define do
  factory :post do
    title       {"今日の予定"}
    category    {1}
    image       {"work.PNG"}
    content     {"買い物"}
    user
  end
end