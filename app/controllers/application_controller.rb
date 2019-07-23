class ApplicationController < ActionController::Base
  http_basic_authenticate_with(
    name: ENV.fetch("DEVICE_USER"),
    password: ENV.fetch("DEVICE_PASSWORD")
  )

  def logout
    render plain: '401 Unauthorized', status: :unauthorized
  end
end
