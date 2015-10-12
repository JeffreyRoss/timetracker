require 'rails_helper'

describe 'user authenticaiton' do 
	it 'allow signin with valid credentials' do
		sign_user_in(create(:user))
		expect(page).to have_content('Signed in successfully')
	end

	it 'allow signin with invalid credentials' do
		sign_user_in(create(:user), password: 'wrong pw')

		expect(page).to have_content('Invalid email or password')
	end

	it 'allow user to sign out' do
		sign_user_in(create(:user))

		visit root_path
		click_link 'Log out'
		expect(page).to have_content('Signed out successfully')
	end	
end

def sign_user_in(user, opts={})
	visit new_user_session_path
	fill_in 'Email', with: user.email
	fill_in 'Password', with: (opts[:password] || user.password)
	click_button 'Log in'
end