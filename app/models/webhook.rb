class Webhook < ApplicationRecord
  include ActiveModel::Validations
  validates_with WebhookTriggerValidator
  validates :name, presence: true, uniqueness: true

  # after_save :generate_url

  # def generate_url
  #   return unless url.nil? || !url.ends_with?(id)

  #   self.url = "/webhooks/#{id}"
  #   save
  # end
  def url
    protocol = Rails.env.development? ? 'http://' : 'https://'
    "#{protocol}#{ENV.fetch('DOMAIN_NAME')}/webhooks/#{id}"
  end

  def auth_header
    'Basic ' + Base64.encode64("#{ENV.fetch('DEVICE_USER')}:#{ENV.fetch('DEVICE_PASSWORD')}")
  end


  def triggered?
    return false if payload['value'].blank? || trigger.blank? || !active

    payload_value = payload['value']
    operator, trigger_value = trigger.split(':')

    case operator
    when 'eq'
      String(payload_value) == String(trigger_value)
    when 'gte'
      Integer(payload_value) >= Integer(trigger_value)
    when 'lte'
      Integer(payload_value) <= Integer(trigger_value)
    when 'starts_with'
      String(payload_value).start_with?(String(trigger_value))
    when 'ends_with'
      String(payload_value).ends_with?(String(trigger_value))
    else
      false
    end
  end
end
