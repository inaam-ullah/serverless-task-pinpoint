# frozen_string_literal: true

module PinPointHelpers
  private

  def get_applicant_details(pinpoint_api_key, pinpoint_applicant_id)
    PinPoint::Applications.new(pinpoint_api_key).fetch_applicant_details(pinpoint_applicant_id)
  end

  def add_comment_to_application(pinpoint_api_key, created_user, pinpoint_applicant_id)
    PinPoint::Comments.new(pinpoint_api_key)
      .create_comment("Record created with ID: #{created_user['id']}", pinpoint_applicant_id)
  end
end
