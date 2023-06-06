FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    # ランダム生成で英数字になるよう'ta'追加
    password { 'ta3' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name { '田中' }
    first_name { '一太郎' }
    last_name_kana { 'タナカ' }
    first_name_kana { 'イチタロウ' }
    birthday { Faker::Date.birthday }
  end
end