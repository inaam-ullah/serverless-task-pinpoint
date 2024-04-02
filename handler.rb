# frozen_string_literal: true

require 'json'
require 'httparty'
require_relative './app/services/pin_point/applications'
require_relative './app/services/pin_point/comments'
require_relative './app/services/hi_bob/people'
require_relative './app/services/hi_bob/documents'
require_relative './app/helpers/webhook_helpers'
require_relative './app/helpers/pin_point_helpers'
require_relative './app/helpers/hi_bob_helpers'

APPLICATION_HIRED = 'application_hired'

include WebhookHelpers
include PinPointHelpers
include HiBobHelpers

def webhook_handler(event:, context:)
  pinpoint_event = event

  return not_hire_event_response unless pinpoint_event['event'] == APPLICATION_HIRED

  begin
    pinpoint_applicant_id = pinpoint_event.dig('data', 'application', 'id') || ENV['DEFAULT_PIN_POINT_APPLICANT_ID']
    pinpoint_api_key = ENV['PIN_POINT_API_KEY']
    hi_bob_api_username = ENV['HI_BOB_API_USERNAME']
    hi_bob_api_password = ENV['HI_BOB_API_PASSWORD']

    applicant_details = get_applicant_details(pinpoint_api_key, pinpoint_applicant_id)

    created_user = create_user(hi_bob_api_username, hi_bob_api_password, applicant_details)

    if created_user
      upload_document(hi_bob_api_username, hi_bob_api_password, applicant_details, created_user)
    end

    add_comment_to_application(pinpoint_api_key, created_user, pinpoint_applicant_id)

    webhook_request_acknowledgement_response
  rescue StandardError => e
    puts "Error: #{e.message}"
    internal_server_error_response
  end
end
