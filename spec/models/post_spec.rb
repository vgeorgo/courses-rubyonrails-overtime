require 'rails_helper'

RSpec.describe Post, type: :model do
	describe 'creation' do
		before do
			@user = FactoryBot.create(:user)
			@post = FactoryBot.create(:post)
		end

		it 'can be created' do
			expect(@post).to be_valid
		end

		it 'cannot be created without a date and reationale' do
			@post.date = nil
			@post.rationale = nil
			expect(@post).to_not be_valid
		end
	end
end
