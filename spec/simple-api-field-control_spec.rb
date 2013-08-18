require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Simple API Field Control" do
  before(:all) do
    @post = Post.create!(subject: "Test Post")
  end

  it "should work" do
    @post.subject.should eq "Test Post"
  end
end
