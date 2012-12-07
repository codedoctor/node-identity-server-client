_ = require 'underscore'

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

  getByIds: (ids = [], cb = ->) =>
    idList = ids.join ','
    @client.get "/users/by-ids?ids=#{idList}", null, cb

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

  resetPassword: (email, cb = ->) =>
    data =
      email : email
    @client.post "/users/reset-password", data, null, cb

  resetPasswordToken: (token, password, cb = ->) =>
    data =
      password : password
    @client.put "/users/reset-password/#{token}", data, null, cb

  postIdentity: (userId,provider,v1,v2,profile,cb) =>
    data = 
      provider : provider
      v1 : v1
      v2 : v2
      profile : profile
    @client.post "/users/#{userId}/identities",data, null, cb

  deleteIdentity: (userId,identityId,cb = ->) =>
    @client.delete "/users/#{userId}/identities/#{identityId}", null, cb

  getRoles: (userId,cb = ->) =>
    @client.get "/users/#{userId}/roles", null, cb

  postRoles: (userId,roles = [],cb = ->) =>
    data = 
      roles : roles
    @client.post "/users/#{userId}/roles",data, null, cb

  deleteRoles: (userId,role,cb = ->) =>
    @client.delete "/users/#{userId}/roles/#{role}", null, cb



