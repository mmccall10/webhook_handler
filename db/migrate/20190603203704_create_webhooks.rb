class CreateWebhooks < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'uuid-ossp'
    enable_extension 'pgcrypto'

    create_table :webhooks, id: :uuid do |t|
      t.string :name
      t.boolean :active
      t.string :recipients
      t.string :subject
      t.text :email_body

      t.string :url, unique: true

      t.timestamps
    end
    add_index :webhooks, :name, unique: true
  end
end
