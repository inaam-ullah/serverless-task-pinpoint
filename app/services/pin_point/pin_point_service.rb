# frozen_string_literal: true

require 'httparty'
require_relative '../../helpers/webhook_helpers'

module PinPoint
  class PinPointService
    include HTTParty
    include WebhookHelpers

    base_uri 'https://developers-test.pinpointhq.com/api/v1'

    def initialize(api_key)
      @headers = {
        'Accept' => 'application/json',
        'Content-Type' => 'application/json',
        'X-API-KEY' => api_key
      }
    end
  end
end
