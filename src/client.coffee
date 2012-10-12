request = require 'request'
_ = require 'underscore'
Users = require './users'
Sessions = require './sessions'
Entities = require './entities'
TokenInfos = require './token-infos'
Apps = require './apps'
Identities = require './identities'
Organizations = require './organizations'
Scopes = require './scopes'

module.exports = class Client
  constructor: (@endpoint, @options = {}) ->
    @endpoint = @_cleanEndpoint(@endpoint)
    throw new Error("Endpoint required") unless @endpoint && @endpoint.length > 0

    _.defaults @options,
            maxCacheItems: 1000
            maxTokenCache: 60 * 10
            clientId : null
            bearerToken: null # If present will be added to the request header as a
                              # bearer token (using current draft)
            headers: {}
    @cache = {}

    @apps = @apiClients = new Apps @
    @entities = new Entities @
    @identities = new Identities @
    @organizations = new Organizations @
    @scopes = new Scopes @
    @sessions = new Sessions @
    @tokenInfos = new TokenInfos @
    @users = new Users @

  _cleanEndpoint: (endpoint) =>
    return null unless endpoint
    endpoint.replace /\/+$/, ""


  _handleResult: (res, bodyBeforeJson, callback) =>
      return callback new errors.AccessDenied("") if res.statusCode is 401 or res.statusCode is 403

      body = null

      #console.log "WE ARE HERE #{bodyBeforeJson}"
      if bodyBeforeJson and bodyBeforeJson.length > 0
        try
          console.log "GETTING: #{bodyBeforeJson} END GETTING"
          body = JSON.parse(bodyBeforeJson)
        catch e
          return callback( new Error("Invalid Body Content"), bodyBeforeJson, res.statusCode)

      return callback(new Error(if body then body.message else "Request failed.")) unless res.statusCode >= 200 && res.statusCode < 300
      callback null, body, res.statusCode

  _reqWithData: (method, path, data, actor, callback) =>
    headers =
      'Content-Type': 'application/json'
      'Accept' : 'application/json'

    headers['authorization'] = "Bearer #{@options.bearerToken}" if @options.bearerToken
    headers['X-ClientId'] = @options.clientId if @options.clientId

    _.extend headers, @options.headers

    request
      uri: "#{@endpoint}#{path}"
      headers: headers
      body: if data then JSON.stringify data else null
      method: method
      timeout: 2000
     , (err, res, body) =>
       if err
         err.status = res.statusCode
         return callback(err)

       @_handleResult res, body, callback


  post: (path, data, actor, callback) =>
    @_reqWithData "POST", path, data, actor, callback

  patch: (path, data, actor, callback) =>
    @_reqWithData "PATCH", path, data, actor, callback

  put: (path, data, actor, callback) =>
    @_reqWithData "PUT", path, data, actor, callback



  delete: (path, actor, callback) =>
    headers =
#      'Content-Type': 'application/json'
      'Accept' : 'application/json'

    headers['authorization'] = "Bearer #{@options.bearerToken}" if @options.bearerToken

    _.extend headers, @options.headers

    request
      uri: "#{@endpoint}#{path}"
      headers: headers
      method: 'DELETE'
     , (err, res, body) =>
        if err
          err.status = res.statusCode
          return callback(err)

        @_handleResult res, body, callback

  get: (path, actor, callback) =>
    unless callback
      callback = actor
      actor = null

    headers =
#      'Content-Type': 'application/json'
      'Accept' : 'application/json'

    headers['authorization'] = "Bearer #{@options.bearerToken}" if @options.bearerToken
    headers['X-ClientId'] = @options.clientId if @options.clientId

    _.extend headers, @options.headers

    request
      uri: "#{@endpoint}#{path}"
      headers: headers
      method: 'GET'
     , (err, res, body) =>
       if err
         err.status = res.statusCode
         return callback(err)
       @_handleResult res, body, callback

