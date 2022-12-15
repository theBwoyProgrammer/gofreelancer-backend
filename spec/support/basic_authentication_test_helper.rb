module BasicAuthenticationTestHelper
  def encoded_credentials_for(user)
    ActionController::HttpAuthentication::Basic.encode_credentials(
      user.email,
      user.password
    )
  end

  def credentials_header_for(user)
    { 'Content-Type' => 'application/json', authorization: encoded_credentials_for(user) }
  end
end