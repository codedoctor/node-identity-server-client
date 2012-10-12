
exports.NotFound = class NotFound extends Error
  constructor: (path) ->
    @name = 'NotFound'
    @status = 404

    if path
      Error.call @, "Cannot find #{path}"
      @path = path
    else
      Error.call @, "Not Found"

    Error.captureStackTrace @, arguments.callee

exports.AccessDenied = class AccessDenied extends Error
  constructor: (@path) ->
    @name = 'AccessDenied'
    @message = "You cannot access the resource #{@path}"
    @status = 401

    Error.call @, @message
    Error.captureStackTrace @, arguments.callee

exports.UnprocessableEntity = class UnprocessableEntity extends Error
  constructor: (@parameter) ->
    @name = 'UnprocessableEntity'
    @message = "At least one parameter is missing or invalid #{@parameter}"
    @status = 422

    Error.call @, @message
    Error.captureStackTrace @, arguments.callee


