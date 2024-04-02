# frozen_string_literal: true

require 'httparty'
require_relative '../../helpers/webhook_helpers'

module HiBob
  class HiBobService
    include HTTParty
    include WebhookHelpers

    base_uri 'https://api.hibob.com/v1'

    def initialize(username, password)
      @auth = { username:, password: }
      @headers = {
        'Authorization' => "Basic #{base64_credentials}",
        'Accept' => 'application/json',
        'Content-Type' => 'application/json',
      }
    end

    private

    def base64_credentials
      Base64.strict_encode64("#{@auth[:username]}:#{@auth[:password]}")
    end

    def serialize_user(params)
      params[:start_date] ||= (Date.today + 1).to_s
      params[:site] ||= 'New York (Demo)'
      {
        firstName: params['first_name'],
        surname: params['last_name'],
        email: "#{params['email'].sub('@', "+#{rand(1000..9999)}@")}",
        work: {
          site: params[:site],
          startDate: params[:start_date]
        }
      }
    end
  end
end
