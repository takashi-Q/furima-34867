FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    name { '田中' }
    first_name { '俺' }
    first_name_kana { 'ラ' }
    last_name { '田中' }
    last_name_kana { 'タナカ' }
    email { Faker::Internet.free_email }
    date { '1931-02-02' }
  end
end
