class AddPostToSummaries < ActiveRecord::Migration
  def change
    add_reference :summaries, :post, index: true, foreign_key: true
  end
end
