
module.exports = class AppsClient
  constructor:(@client, @appId) ->
    throw new Error "client parameter is required" unless @client
    throw new Error "appId parameter is required" unless @appId

  all: (actor, cb = ->) =>
    @client.get "/apps/#{@appId}/clients", actor, cb

  get: (id, actor, cb = ->) =>
    @client.get "/apps/#{@appId}/clients/#{id}", actor, cb

  create: (data, actor, cb = ->) =>
    @client.post "/apps/#{@appId}/clients", data, actor, cb

  delete: (id, actor, cb = ->) =>
    @client.delete "/apps/#{@appId}/clients/#{id}", actor, cb

