# frozen_string_literal: true

require_relative './hi_bob_service'

module HiBob
  class Documents < HiBobService
    def upload_document(employee_id, document_name, document_url, tags)
      endpoint = "/docs/people/#{employee_id}/shared"

      document_details = {
        documentName: document_name,
        documentUrl: document_url,
        tags: Array(tags)
      }

      response = self.class.post(endpoint, headers: @headers, body: document_details.to_json)

      handle_response(response)
    end
  end
end
