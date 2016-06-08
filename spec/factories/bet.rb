require "faker"

FactoryGirl.define do
  factory :bet do
    team_id   1
    match_id  1
    user_id   1
  end
end
