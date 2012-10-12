
module.exports = class Organizations
  constructor:(@client) ->
    throw new Error "client parameter is required" unless @client

  all: (actor, cb = ->) =>
    #TODO: CHECK THIS
    @client.get "/organizations", actor, cb

  get: (id, actor, cb = ->) =>
    @client.get "/organizations/#{id}", actor, cb

  create: (data, actor, cb = ->) =>
    @client.post "/organizations", data, actor, cb

  delete: (id, actor, cb = ->) =>
    @client.delete "/organizations/#{id}", actor, cb

  update: (id, data, actor, cb = ->) =>
    @client.patch "/organizations/#{id}", data, actor, cb

