AppsClient = require './apps-client'

module.exports = class Apps
  constructor:(@client) ->
    throw new Error "client parameter is required" unless @client

  all: ( cb = ->) =>
    #TODO: CHECK THIS
    @client.get "/apps", null, cb

  get: (id, actor, cb = ->) =>
    @client.get "/apps/#{id}", actor, cb

  create: (data, actor, cb = ->) =>
    @client.post "/apps", data, actor, cb

  delete: (id, actor, cb = ->) =>
    @client.delete "/apps/#{id}", actor, cb

  update: (id, data, actor, cb = ->) =>
    @client.patch "/apps/#{id}", data, actor, cb

  clients: (appId) =>
    new AppsClient(@client, appId)