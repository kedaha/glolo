require 'spec_helper'

describe Category do
  describe "#strengthen_or_add_keyword!" do
    let(:name_argument) { Faker::Lorem.word }
    let!(:category) { Category.create!(name: Faker::Lorem.word) }

    context "name argument exists as keyword" do
      let!(:keyword) { Keyword.create!(name: name_argument) }

      context "category doesn't contain keyword" do
        before { category.strengthen_or_add_keyword!(name_argument) }

        it "adds existing keyword as a keyword" do
          expect(category.reload.keywords).to include(keyword)
        end
      end

      context "category contains keyword" do
        before do
          category.keywords << keyword
        end

        it "increases link strength by one" do
          expect{
          category.strengthen_or_add_keyword!(keyword.name)}.to change{category.categories_keywords.where(keyword: keyword).first.strength}.by(1)
        end
      end
    end

    context "name argument doesn't exist" do
      before { category.strengthen_or_add_keyword!(name_argument) }

      it "adds new keyword as a category keyword" do
        expect(category.reload.keywords.where(name: name_argument)).to be_present
      end
    end
  end
end
