require 'rails_helper'

describe 'account creation' do 
	it 'allows user to create account' do
		visit root_path
		click_link 'Create Account'

		#fill_in 'Name', with: "Jeff"
		#fill_in 'Email', with: 'jeffrey1.ross@gmail.com'
		#fill_in 'Password', with: 'Password123'
		#fill_in 'Password Confirmation', with: 'Password123'
		fill_in 'Subdomain', with: 'test_subdomain'
		click_button 'Create Account'

		expect(page).to have_content('Signed in successfully')
	end
end