require "administrate/base_dashboard"

class WebhookDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::String.with_options(searchable: false),
    name: Field::String,
    active: Field::Boolean,
    trigger: Field::String,
    recipients: Field::String,
    subject: Field::String,
    email_body: Field::Text,
    url: Field::String,
    auth_header: Field::String,
    payload: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :name,
    :active,
    :url
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :name,
    :active,
    :trigger,
    :recipients,
    :subject,
    :email_body,
    :url,
    :auth_header,
    :payload,
    :created_at,
    :updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :name,
    :active,
    :trigger,
    :recipients,
    :subject,
    :email_body
  ].freeze

  # Overwrite this method to customize how webhooks are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(webhook)
    "Webhook #{webhook.name}"
  end
end
