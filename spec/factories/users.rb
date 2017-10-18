FactoryGirl.define do

  factory :user do
    name  { Faker::Name.name }
    email { Faker::Internet.email }
    password              { Faker::Internet.password(8) }
    password_confirmation { password }

    # 多対多の関係をuserから一括生成する
    # @groups = current_user.groupsを実装
    after(:create) do |user|
      create(:group_user, user: user, group: create(:group))
    end
  end

end
