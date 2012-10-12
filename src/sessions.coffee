
module.exports = class Sessions
  constructor:(@client) ->
    throw new Error "client parameter is required" unless @client

  signInLocal: (login, password, cb = ->) =>
    data =
      login : login
      password : password

    @client.post "/sessions", data, null, cb
