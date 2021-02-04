FactoryBot.define do
  factory :dog do
    name { "MyString" }
    breed { "MyString" }
    age { 1 }
    shots { false }
    last_shot_date { "2021-02-04 03:31:04" }
    user { "" }
  end
end
