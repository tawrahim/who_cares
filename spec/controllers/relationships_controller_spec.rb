require 'spec_helper'

describe RelationshipsController do
  
  let(:user) { FactoryGirl.create(:user) }
  let(:other_user) { FactoryGirl.create(:user) }

  before { sign_in user }

  describe "creating a relationship with Ajax" do
   
    it "should increment the relationship count" do
     expect do
      xhr :post, :create, relationship: { followed_id: other_user.id }
     end.should change(Relationship, :count).by(1)
    end

    it "should respond with success" do
      xhr :post, :create, relationship: { followed_id: other_user.id }
      response.should be_success
    end
  end
end
