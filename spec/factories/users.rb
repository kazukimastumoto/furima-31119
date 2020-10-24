FactoryBot.define do
  factory :user do
    nickname              { 'ka' }
    email                 { 'kkk@gmail.com' }
    password              { '111111k' }
    password_confirmation { password }
    first_name            { '一輝' }
    last_name             { '松本' }
    first_name_kana       { 'カズキ' }
    last_name_kana        { 'マツモト' }
    birthday              { '1994-01-02' }
  end
end
