require 'rails_helper'
require 'pp'

describe 'navigate' do
	before do
		@user = FactoryBot.create(:user)

		# Mimic user section
		login_as(@user, :scope => :user)
	end

	describe 'index' do
		before do
			visit posts_path
		end

		it 'can be reached successfully' do
			expect(page.status_code).to eq(200)
		end

		it 'has a title of Posts' do
			expect(page).to have_content(/Posts/)
		end

		it 'has a list of posts' do
			post1 = FactoryBot.create(:post)
			post2 = FactoryBot.create(:post2)
			visit posts_path
			expect(page).to have_content(/Post1|Post2/)
		end
	end

	describe 'creation' do
		before do
			visit new_post_path
		end

		it 'has a new form that can be reached' do
			expect(page.status_code).to eq(200)
		end

		it 'can be created from new form page' do
			fill_in 'post[date]', with: Date.today
			fill_in 'post[rationale]', with: 'Some rationale'

		    click_on "Save"

		    expect(page).to have_content('Some rationale')
		end

		it 'will have an user associated it' do
			fill_in 'post[date]', with: Date.today
			fill_in 'post[rationale]', with: 'User Association'

		    click_on "Save"

		    expect(User.last.posts.last.rationale).to eq('User Association')
		end
	end
end