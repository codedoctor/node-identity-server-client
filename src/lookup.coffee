_ = require 'underscore'

module.exports = class Lookup
  constructor:(@client) ->
    throw new Error "client parameter is required" unless @client

  users: (q, cb = ->) =>
    @client.get "/lookup/users?q=#{encodeURIComponent(q)}", null, cb

 