# frozen_string_literal: true

Devise.setup do |config|
  # The e-mail address that mail will appear to be sent from
  # If absent, mail is sent from "please-change-me-at-config-initializers-devise@example.com"
  config.mailer_sender = "support@myapp.com"

  # If using rails-api, you may want to tell devise to not use ActionDispatch::Flash
  # middleware b/c rails-api does not include it.
  # See: https://stackoverflow.com/q/19600905/806956
  config.navigational_formats = [:json]


  config.secret_key = "1bec5fbc2115a49b1e42ab198b61b97aa41787619e045d6a7b65c1ef0af979c9870ccc47fed0046c41baaf4520990fb16bbe971174dca098a628bc8adf1da21e"


end
