
module.exports = class Entities
  constructor:(@client) ->
    throw new Error "client parameter is required" unless @client

  get: (slugOrId, actor, cb = ->) =>
    @client.get "/entities/#{slugOrId}", actor, cb

  createable: (name, cb = ->) =>
    #TODO: Uriencode and test name
    @client.get "/entities/createable/#{name}", null, cb

