# frozen_string_literal: true

require_relative './hi_bob_service'

module HiBob
  class People < HiBobService
    def create_employee(employee_details)
      response = self.class.post('/people',
                                 headers: @headers,
                                 body: serialize_user(employee_details).to_json)
      handle_response(response)
    end
  end
end
