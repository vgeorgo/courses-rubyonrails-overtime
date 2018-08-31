FactoryBot.define do
	factory :post do
		date Date.today
		rationale 'Some Rationale Post1'
		association :user, factory: :user_infinite
	end

	factory :post2, class: 'Post' do
		date Date.yesterday
		rationale 'Some Rationale Post2'
		association :user, factory: :user_infinite
	end
end