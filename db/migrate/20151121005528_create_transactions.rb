class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.integer :requested_book_id
      t.integer :requester_book_id
      t.boolean :status_requested
      t.boolean :status_requester

      t.timestamps null: false
    end
  end
end
