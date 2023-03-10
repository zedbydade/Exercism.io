class ApplicationRouter < Sinatra::Base
  get '/' do
    'ahsiuerhrlksesr'
  end

  post '/users' do
    request_payload = JSON.parse(request.body.read)

    user_data = {
      name: request_payload['name'],
      email: request_payload['email'],
      password: BCrypt::Password.create(request_payload[:password])
    }

    user = User.create(user_data)
    response = { id: user.id, name: user.name, email: user.email }.to_json
    status(201)
    content_type :json
    body(response)
  end

  get '/users/authenticate/:id' do
    request_payload = JSON.parse(request.body.read)
    user = User[:id]
    password = BCrypt::Engine.hash_secret(params[:password], user.password)

    # body("password = #{password == request_payload[:password]}")
    body("password = #{password}")
  end
end
