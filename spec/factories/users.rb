FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { '花子' }
    family_name           { '山田' }
    read_first            { 'ハナコ' }
    read_family           { 'ヤマダ' }
    birth                 { Faker::Date.between(from: '1930-01-01', to: '2017-12-31') }
  end
end
