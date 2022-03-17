require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:article) { Article.new title: "Super Sweet Title", description: "This is my equally sweet description." }

  it "is a valid object with valid attributes" do
    expect(article).to be_valid
  end

  it "is not valid without a title" do
    article.title = nil
    expect(article).to_not be_valid
  end

  it "is not valid without a description" do
    article.description = nil
    expect(article).to_not be_valid
  end

  it "is not valid if title is not unique" do
    article.save
    article_2 = Article.new title: "Super Sweet Title", description: "This is my equally sweet description."
    expect(article_2).to_not be_valid
  end

  it "should not allow a title to be less than 6 characters" do 
    article.title = "x" * 5
    expect(article).to_not be_valid
  end

  it "should not allow a title to be more than 100 characters" do 
    article.title = "x" * 101
    expect(article).to_not be_valid
  end

  it "should not allow a description to be less than 10 characters" do 
    article.description = "x" * 9
    expect(article).to_not be_valid
  end

  it "should not allow a description to be more than 300 characters" do
    article.description = "x" * 301
    expect(article).to_not be_valid
  end

end