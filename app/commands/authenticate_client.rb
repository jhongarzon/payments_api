class AuthenticateClient
  # Good gem, new to me. But we use service object pattern a lot
  prepend SimpleCommand

  def initialize(username, password)
    @username = username
    @password = password
  end

  def call
    JsonWebToken::encode(client_id: client.id) if client
  end

  private

  # FEEDBACK: good pattern making the accessors private
  attr_accessor :username, :password

  def client
    client = Client.find_by(username: username)    
    return client if client && client.authenticate(password)

    errors.add :user_authentication, 'invalid credentials'
    nil
  end
end
