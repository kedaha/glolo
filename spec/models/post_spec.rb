require 'spec_helper'

describe Post do
  describe "callbacks" do
    context "post has no postable, but has category" do
      let(:post) { create(:post) }
      let(:category) { PostCategory.item_sale }

      before do
        post.category = category
        post.save!
        post.reload
      end

      it "saves new postable for post" do
        expect(post.postable).to be_present
      end

      it "saves correct type" do
        expect(post.postable.class).to eq(category.postable_class)
      end
    end
  end
end
