FactoryBot.define do
	sequence :email do |n|
		"test#{n}@example.com"
	end

	factory :user do
		first_name 'Jon'
		last_name 'Snow'
		email 'user@user.com'
		password 'asdfasdf'
		password_confirmation 'asdfasdf'
	end

	factory :user_infinite, class: 'User' do
		first_name 'Jon'
		last_name 'Snow'
		email { generate :email }
		password 'asdfasdf'
		password_confirmation 'asdfasdf'
	end

	factory :admin, class: 'AdminUser' do
		first_name 'Admin'
		last_name 'User'
		email 'admin@admin.com'
		password 'asdfasdf'
		password_confirmation 'asdfasdf'
	end

	factory :admin_infinite, class: 'AdminUser' do
		first_name 'Admin'
		last_name 'User'
		email { generate :email }
		password 'asdfasdf'
		password_confirmation 'asdfasdf'
	end
end