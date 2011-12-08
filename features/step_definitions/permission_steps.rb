permission_step = /^"([^"]*)" can ([^"]*?) ([o|i]n)?\s?the "([^"]*)" project$/

Given permission_step do |user, action, on, project|
	Permission.create!(:user => User.find_by_email!(user),
										 :thing => Project.find_by_name!(project),
										 :action => action)
end
