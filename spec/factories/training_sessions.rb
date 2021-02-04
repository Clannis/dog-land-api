FactoryBot.define do
  factory :training_session do
    starts_at { "2021-02-04 03:35:51" }
    location { "MyString" }
    Trainer { "" }
    Course { "" }
  end
end
