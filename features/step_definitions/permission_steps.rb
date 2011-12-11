permission_step = /^"([^"]*)" can ([^"]*?) ([o|i]n)?\s?the "([^"]*)" project$/

Given permission_step do |user, action, on, project|
	Permission.create!(:user => User.find_by_email!(user),
										 :thing => Project.find_by_name!(project),
										 :action => action)
end

When /^I check "([^"]*)" for "([^"]*)"$/ do |permission, project_name|
  project = Project.find_by_name!(project_name)
  permission = permission.downcase.gsub(" ", "_")
  field_id = "permissions[#{project.id}][#{permission}]"
  steps(%Q{When I check "#{field_id}"})
end
