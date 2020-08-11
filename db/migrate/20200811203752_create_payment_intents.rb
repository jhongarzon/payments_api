class CreatePaymentIntents < ActiveRecord::Migration[6.0]
  def change
    create_table :payment_intents do |t|
      t.string :client_secret, null: false
      t.decimal :amount, null: false
      t.string :payment_method_type
      t.string :receipt_email
      t.references :client, null: false, foreign_key: true
      t.references :currency, null: false, foreign_key: true
      t.references :payment_status, null: false, foreign_key: true

      t.timestamps
    end
  end
end
