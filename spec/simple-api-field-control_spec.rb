require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Simple API Field Control" do
  before(:all) do
    @post = Post.create!(subject: "Test Post")
  end

  it "should know its subject length" do
    @post.subject_length.should eq 9
  end

  it "should know its count of subject words" do
    @post.subject_words.should eq 2
  end

  it "should serialize to JSON with subject_length and subject_words included" do
    json = @post.to_json
    json.should have_json_path("subject_length")
    json.should have_json_path("subject_words")
  end

  it "should serialize to XML with subject_length and subject_words included" do
    #xml = @post.to_xml
    doc = Nokogiri::XML::Document.parse(@post.to_xml)
    doc.xpath('//subject-length').text.should eq('9')
    doc.xpath('//subject-words').text.should eq('2')
  end
end
