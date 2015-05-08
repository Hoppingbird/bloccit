class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.string :post
      t.string :string

      t.timestamps null: false
    end
  end
end
