
module.exports = class Identities
  constructor:(@client) ->
    throw new Error "client parameter is required" unless @client

  createOrValidate: (providerName, v1, v2, profile, actor, cb = ->) =>
    data =
      v1 : v1
      v2 : v2
      profile : profile

    @client.post "/identities/#{providerName}", data, actor, cb
