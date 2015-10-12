require 'spec_helper'

describe LikesController do
  
  before do
    @event = Event.create!(event_attributes)
  end
  
  context "when not signed in" do
    
    before do
      session[:user_id] = nil
    end
    
    it "cannot access create" do
      post :create, event_id: @event
      
      expect(response).to redirect_to(new_session_url)
    end
    
    it "cannot access destroy" do
      delete :destroy, id: 1, event_id: @event
      
      expect(response).to redirect_to(new_session_url)
    end
    
  end
  
end