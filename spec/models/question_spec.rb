require 'rails_helper'

RSpec.describe Question, type: :model do
    context "attributes" do
    let(:question) { Question.new(title:"New Question Title", body:"New Question Body", resolve: false)}
    
  it "should respond to title" do
      expect(question).to respond_to(:title)
  end 
  
  it "should respond to body" do
      expect(question).to respond_to(:body)
  end 
  
  it "should respond to resolve" do
      expect(question).to respond_to(:resolve)
  end 
 end
end
