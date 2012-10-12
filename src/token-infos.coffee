
module.exports = class TokenInfos
  constructor:(@client) ->
    throw new Error "client parameter is required" unless @client

  validate: (token, cb) =>
    @client.get "/token-infos/#{token}", null, (err, body, statusCode) =>
      return cb err if err

      result =
        isValid : !!(body.actor && body.actor.actorId && body.expiresIn)
        actor : body.actor || {}
        expiresIn : body.expiresIn || 0
        scopes : body.scopes || []

      cb null, result