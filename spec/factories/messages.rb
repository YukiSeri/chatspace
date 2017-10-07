FactoryGirl.define do

  factory :message do
    text  { Faker::Lorem.sentence }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/image/test.jpg')) }
    association :group, factory: :group, id: 1
    association :user, factory: :user, id: 1
  end

end
