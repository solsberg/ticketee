require 'spec_helper'

describe CommentsController do
  let(:user) { create_user! }
  let(:project) { Project.create!(:name => "Ticketee") }
  let(:ticket) do
    project.tickets.create(:title => "State transiitons",
                           :description => "Can't be hacked",
                           :user => user)
  end
  
  let(:state) { State.create!(:name => "New") }

  context "a user without permission to change state" do
    before do
      sign_in(:user, user)
    end

    it "cannot transition a state by passing through a state_id" do
      post :create, { :comment => { :text => "Hacked!", :state_id => state.id },
                      :ticket_id => ticket.id,
                      :tags => "" }
      ticket.reload
      ticket.state.should be_nil
    end

    it "cannot create a tag wihout permission" do
      post :create, { :comment => { :text => "Tag!" },
                      :ticket_id => ticket.id,
                      :tags => "one two" }
      ticket.reload
      ticket.tags.should be_empty
    end
  end
end
