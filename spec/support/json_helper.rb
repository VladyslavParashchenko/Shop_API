# frozen_string_literal: true

def json_parse_response
  JSON.parse(response.body)
end
