# frozen_string_literal: true

require_relative './pin_point_service'

module PinPoint
  class Comments < PinPointService
    def create_comment(body_text, application_id)
      endpoint = '/comments'

      comment_details = {
        data: {
          attributes: {
            body_text: body_text
          },
          relationships: {
            commentable: {
              data: {
                type: 'applications',
                id: application_id.to_s
              }
            }
          },
          type: 'comments',
        }
      }

      handle_response(self.class.post(endpoint, headers: @headers, body: comment_details.to_json))
    end
  end
end
