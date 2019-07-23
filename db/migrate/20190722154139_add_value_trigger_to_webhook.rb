class AddValueTriggerToWebhook < ActiveRecord::Migration[5.2]
  def change
    add_column :webhooks, :trigger, :string
  end
end
