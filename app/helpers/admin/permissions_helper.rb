module Admin::PermissionsHelper
  def permissions
    {
      "view" => "View",
      "create tickets" => "Create tickets",
      "edit tickets" => "Edit tickets",
      "delete tickets" => "Delete tickets",
      "change states" => "Change states",
      "tag" => "Add tags"
    }
  end
end
