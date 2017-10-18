FactoryGirl.define do

  factory :message do
    text  { Faker::Lorem.sentence }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/image/test.jpg')) }
    association :group, factory: :group
    association :user, factory: :user
  end

end
