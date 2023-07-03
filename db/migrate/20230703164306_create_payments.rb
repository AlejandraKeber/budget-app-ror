class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.string :name
      t.decimal :amount

      t.timestamps
    end
    add_reference :payments, :author, foreign_key: { to_table: :users }
  end
end
