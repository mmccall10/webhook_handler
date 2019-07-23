class WebhookNotificationMailer < ApplicationMailer
  default from: 'email@example.com'
  def default_email
    @webhook = params[:webhook]
    subject = subject(@webhook)

    @body = parse_body(@webhook)

    emails = @webhook.recipients.split(',').map(&:strip)
    mail(to: emails, subject: subject)
  end

  def subject(webhook)
    return webhook.subject.strip if webhook.subject.present?

    'Webhook Handler Alert'
  end

  def parse_body(webhook)
    webhook.email_body.gsub('%value%', webhook.payload['value'])
  end
end
