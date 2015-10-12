require 'spec_helper'

describe "Filtering events" do

  it "shows upcoming events" do
    event = Event.create!(event_attributes(starts_at: 1.month.from_now))

    visit events_url

    click_link "Upcoming"

    expect(current_path).to eq("/events")
    
    expect(page).to have_text(event.name)
  end
  
  it "shows past events" do
    event = Event.create!(event_attributes(starts_at: 1.month.ago))

    visit events_url

    click_link "Past"

    expect(current_path).to eq("/events/filter/past")
    
    expect(page).to have_text(event.name)
  end
  
  it "shows free events" do
    event = Event.create!(event_attributes(starts_at: 1.month.from_now, price: 0))

    visit events_url

    click_link "Free"

    expect(current_path).to eq("/events/filter/free")
    
    expect(page).to have_text(event.name)
  end
  
  it "shows recent events" do
    event = Event.create!(event_attributes(starts_at: 1.month.ago))

    visit events_url

    click_link "Recent"

    expect(current_path).to eq("/events/filter/recent")
    
    expect(page).to have_text(event.name)
  end
  
end
