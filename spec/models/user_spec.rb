require 'rails_helper'

describe User do

  # include TestFactories
   
  describe "#favorited(post)" do
    xit "returns `nil` if the user has not favorited the post" do
    end
  
   xit "returns the appropriate favorite if it exists" do
   end   
  
   end

  describe ".top_rated" do
    before do
      @user1 = create(:user)
      post = create(:post, user: @user1)
      comment = create(:comment, user: @user1, post: post)

      @user2 = create(:user)
      post = create(:post, user: @user2)
      2.times { create(:comment, user: @user2, post: post) }

    end  

    it "returns user ordered by posts and comments" do
       expect( User.top_rated ).to eq([@user2, @user1])
    end
    it "stores a post count on a user" do
       users = User.top_rated
       expect( users.first.posts_count ).to eq(1)
    end

    it "stores comment count on user" do
       users = User.top_rated
       expect( users.first.comments_count ).to eq(2)

    end 
  end 

end 

