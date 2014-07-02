# Populating the DB with users.
Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create(user)
  end
end

# Populating the DB with articles.
Given /the following articles exist/ do |articles_table|
  articles_table.hashes.each do |article|
    Article.create(article) do |art|
      art.id = article[:id]
      art.save()
    end
  end
end

# Login as a specific user
Given /I am logged in as "([^"]*)" with password "([^"]*)"/ do |login, password|
  visit '/accounts/login'
  fill_in 'user_login', :with => login
  fill_in 'user_password', :with => password
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end
