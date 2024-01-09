# frozen_string_literal: true

module WebhookHelpers
  private

  def handle_response(response)
    if response.success?
      response
    else
      raise "Request failed with status code: #{response.code}, #{response.body}"
    end
  end

  def not_hire_event_response
    { statusCode: 200, body: JSON.generate({ message: 'Not a new hire event, ignoring' }) }
  end

  def webhook_request_acknowledgement_response
    { statusCode: 200, body: JSON.generate({ message: 'Webhook request acknowledged' }) }
  end

  def internal_server_error_response
    { statusCode: 500, body: JSON.generate({ error: 'Internal Server Error' }) }
  end
  
end
