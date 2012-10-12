
module.exports = class Scopes
  constructor:(@client) ->
    throw new Error "client parameter is required" unless @client

  all: ( cb = ->) =>
    @client.get "/scopes", null, cb

  get: (name, cb = ->) =>
    @client.get "/scopes/#{name}", null, cb
