module RequestHelpers
  def authenticate_user
    @user = create(:user)
    token = DeviseTokenAuth::TokenFactory.create
    @user.tokens[token.client] = {
      token: token.token_hash,
      expiry: token.expiry
    }

    @user.save!
    @new_auth_header = @user.build_auth_headers(token.token, token.client)
  end
end
