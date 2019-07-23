class WebhooksController < ApplicationController
  before_action :set_webhook, only: [:handle]

  def handle
    unless @webhook.nil? || !@webhook.active
      @webhook.payload = webhook_params
      @webhook.save

      if @webhook.triggered?
        WebhookNotificationMailer
          .with(webhook: @webhook, request_params: webhook_params)
          .default_email
          .deliver_now
      end
    end

    render plain: 'Ok'
  end

  private

  def set_webhook
    @webhook = Webhook.find(params[:id])
  end

  def webhook_params
    params.permit(%i[value])
  end

end
