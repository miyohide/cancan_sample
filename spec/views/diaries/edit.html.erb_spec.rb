require 'spec_helper'

describe "diaries/edit" do
  before(:each) do
    @diary = assign(:diary, stub_model(Diary,
      :title => "MyString",
      :body => "MyText"
    ))
  end

  it "renders the edit diary form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", diary_path(@diary), "post" do
      assert_select "input#diary_title[name=?]", "diary[title]"
      assert_select "textarea#diary_body[name=?]", "diary[body]"
    end
  end
end
