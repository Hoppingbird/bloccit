require 'rails_helper'

describe Vote do

    describe "value validation" do

      include TestFactories

      it "only allows -1 or 1 as values" do
        up_vote = Vote.new(value: 1)
        expect( up_vote.valid? ).to eq(true)
        down_vote = Vote.new(value: -1)
        expect( down_vote.valid? ).to eq(true)
        invalid_v = Vote.new(value: 2)
        expect( invalid_v.valid? ).to eq(false)
      end
    end
    describe 'after_save' do
      it "calls `Post#update_rank` after save" do
        vote = Vote.new(value: 1, post: post)
        expect {
          post( :update_rank, post_id: post.id )
        }.to change{ post.update_rank }.by 1
        vote.save
      end
    end
  end


