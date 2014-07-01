require "spec_helper"

describe EventsController do
  let!(:events) { FactoryGirl.create_list :event, 3 }
  describe "GET Index" do
    it "should instantiate @events" do
      get :index
      expect(assigns[:events]).to eq(current_user.events)
    end

    it "should render index" do
      get :index
      expect(response).to render_template("index")
    end
  end

end