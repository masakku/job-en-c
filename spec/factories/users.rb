FactoryBot.define do
  factory :user do
    nickname                   {"yamada"}
    name_kana                  {"ヤマダ"}
    email                      {Faker::Internet.free_email}
    password                   {"aaa000"}
    profile                    {"山田太郎"}
    occupation                 {"営業職"}
    position                   {"一般社員"}
  end
end