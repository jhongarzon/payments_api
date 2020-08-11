class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.string :client_secret, null: false
      t.decimal :amount, null: false
      t.string :receipt_email, null: false
      t.datetime :cancelled_at
      t.string :cancellation_reason
      t.references :payment_intent, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.references :currency, null: false, foreign_key: true
      t.references :payment_status, null: false, foreign_key: true

      t.timestamps
    end
  end
end
