require 'spec_helper'

describe ProjectsController do
  let(:user) do
    user = Factory(:user)
    user.confirm!
    user
  end
  
  let(:project) { Factory(:project) }
  
  it "displays an error message when asked for a missing project" do
    get :show, :id => "not-here"
    response.should redirect_to(projects_path)
    message = "The project you were looking for could not be found."
    flash[:alert].should == message
  end
  
  context "standard users" do
    { "new" => "get",
      "create" => "post",
      "edit" => "get",
      "update" => "put",
      "destroy" => "delete" }.each do |action, method|
      it "cannot access the #{action} action" do
        sign_in(:user, user)
        send(method, action.dup, :id => project.id)
        response.should redirect_to(root_path)
        flash[:alert].should == "You must be an admin to do that."
      end
    end
  end
end
