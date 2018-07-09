# frozen_string_literal: true

def login(user)
  request.headers.merge! user.create_new_auth_token
end
