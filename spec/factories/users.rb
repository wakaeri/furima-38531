FactoryBot.define do
  factory :user do
    user_name_first         {"太郎"}
    user_name_last          {"山本"}
    user_name_first_reading {"タロウ"}
    user_name_last_reading  {"ヤマモト"}
    nickname                {Faker::Name.initials(number: 2)}
    email                   {Faker::Internet.free_email}
    password                {Faker::Internet.password(min_length: 6)}
    password_confirmation   {password}
    birthday                {Faker::Date.between(from: '1930-01-01', to: 5.years.ago)}
  end
end
