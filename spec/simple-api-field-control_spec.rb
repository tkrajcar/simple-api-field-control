require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Simple API Field Control" do
  before(:all) do
    @post = Post.create!(subject: "Test Post", api_key: "foo", other_secret: "bar")
    @json = @post.to_json
    @xml = Nokogiri::XML::Document.parse(@post.to_xml)

  end

  it "should know its subject length" do
    @post.subject_length.should eq 9
  end

  it "should know its count of subject words" do
    @post.subject_words.should eq 2
  end

  context "JSON serialization" do
    it "should occur with subject_length and subject_words" do
      @json.should have_json_path("subject_length")
      @json.should have_json_path("subject_words")
    end

    it "should occur without api_key or other_secret" do
      @json.should_not have_json_path("api_key")
      @json.should_not have_json_path("other_secret")
    end
  end

  context "XML serialization" do
    it "should occur with subject_length and subject_words" do
      @xml.xpath('//subject-length').text.should eq('9')
      @xml.xpath('//subject-words').text.should eq('2')
    end

    it "should occur without api_key or other_secret" do
      @xml.xpath('//api-key').text.should eq("")
      @xml.xpath('//other-secret').text.should eq("")
    end
  end
end
