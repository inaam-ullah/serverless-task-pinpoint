# frozen_string_literal: true

require 'httparty'
require_relative './pin_point_service'

module PinPoint
  class Applications < PinPointService
    def fetch_applicant_details(application_id)
      endpoint = "/applications/#{application_id}?extra_fields[applications]=attachments"
      handle_response(self.class.get(endpoint, headers: @headers))
    end
  end
end
