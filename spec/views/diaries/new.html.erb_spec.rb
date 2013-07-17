require 'spec_helper'

describe "diaries/new" do
  before(:each) do
    assign(:diary, stub_model(Diary,
      :title => "MyString",
      :body => "MyText"
    ).as_new_record)
  end

  it "renders new diary form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", diaries_path, "post" do
      assert_select "input#diary_title[name=?]", "diary[title]"
      assert_select "textarea#diary_body[name=?]", "diary[body]"
    end
  end
end
