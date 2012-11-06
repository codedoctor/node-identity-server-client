
module.exports = class Users
  constructor:(@client) ->
    throw new Error "client parameter is required" unless @client

  # RENAME TO CREATE
  createLocal: (username, email, password, cb = ->) =>
    data =
      username : username
      email : email
      password : password

    @client.post "/users", data, null, cb

  # TODO: CHECK AND REPLACE
  getUserOrOrganizationByName: (name, cb = ->) =>
    @client.get "/entities/#{name}", null, cb

  #TODO: RENAME
  get: (id, cb = ->) =>
    @client.get "/users/#{id}", null, cb

  getApps: (id, cb = ->) =>
    @client.get "/users/#{id}/apps", null, cb

  all: (actor, cb = ->) =>
    #TODO: CHECK THIS
    @client.get "/users", actor, cb


  getX: (id, actor, cb = ->) =>
    @client.get "/users/#{id}", actor, cb

  delete: (id, actor, cb = ->) =>
    @client.delete "/users/#{id}", actor, cb

  update: (id, data, actor, cb = ->) =>
    @client.patch "/users/#{id}", data, actor, cb

  updatePassword: (id, newPassword, actor, cb = ->) =>
    data =
      password : newPassword
    @client.put "/users/#{id}/password", data, actor, cb

  requestPasswordReset: (id, actor, cb = ->) =>
    data =
      password : newPassword
    @client.post "/users/#{id}/password-reset-tokens", data, actor, cb

  validatePasswordReset: (id, token, newPassword, actor, cb = ->) =>
    data =
      password : newPassword
    @client.put "/users/#{id}/password-reset-tokens/#{token}", data, actor, cb


