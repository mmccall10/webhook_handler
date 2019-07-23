class AddPayloadToWebhooks < ActiveRecord::Migration[5.2]
  def change
    add_column :webhooks, :payload, :jsonb
  end
end
