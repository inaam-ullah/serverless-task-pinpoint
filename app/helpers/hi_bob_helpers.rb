# frozen_string_literal: true

module HiBobHelpers
  private

  def create_user(hi_bob_api_username, hi_bob_api_password, applicant_details)
    HiBob::People.new(hi_bob_api_username, hi_bob_api_password)
      .create_employee(applicant_details.dig('data', 'attributes'))
  end

  def upload_document(hi_bob_api_username, hi_bob_api_password, applicant_details, created_user)
    attachment = applicant_details.dig('data', 'attributes', 'attachments').first
    HiBob::Documents.new(hi_bob_api_username, hi_bob_api_password)
      .upload_document(created_user['id'],
                       attachment['filename'],
                       attachment['url'],
                       attachment['context'])
  end
end
