require 'spec_helper'

describe CategoriesPost do
  describe 'validations' do
    describe 'categories per post' do
      let(:user) { stub_model(User) }
      let(:post) { Post.create!(user: user) }
      let!(:category1) { Category.create!(name: Faker::Lorem.word) }
      let!(:category2) { post.categories.create!(name: Faker::Lorem.word) }

      context 'related post has one other category' do
        let(:categories_post) { CategoriesPost.new(post_id: post.id, category_id: category1.id) }
        it 'is valid' do
          expect(categories_post.valid?).to eq(true)
        end
      end

      context 'related post has two other categories' do
        let!(:category3) { post.categories.create!(name: Faker::Lorem.word) }
        let(:categories_post) { CategoriesPost.new(post_id: post.id, category_id: category1.id) }
        it 'is not valid' do
          expect(categories_post.valid?).to eq(false)
        end
      end
    end
  end
end
