// Generated by CoffeeScript 1.3.3
(function() {
  var Apps, AppsClient,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  AppsClient = require('./apps-client');

  module.exports = Apps = (function() {

    function Apps(client) {
      this.client = client;
      this.clients = __bind(this.clients, this);

      this.update = __bind(this.update, this);

      this["delete"] = __bind(this["delete"], this);

      this.create = __bind(this.create, this);

      this.get = __bind(this.get, this);

      this.all = __bind(this.all, this);

      if (!this.client) {
        throw new Error("client parameter is required");
      }
    }

    Apps.prototype.all = function(cb) {
      if (cb == null) {
        cb = function() {};
      }
      return this.client.get("/apps", null, cb);
    };

    Apps.prototype.get = function(id, actor, cb) {
      if (cb == null) {
        cb = function() {};
      }
      return this.client.get("/apps/" + id, actor, cb);
    };

    Apps.prototype.create = function(data, actor, cb) {
      if (cb == null) {
        cb = function() {};
      }
      return this.client.post("/apps", data, actor, cb);
    };

    Apps.prototype["delete"] = function(id, actor, cb) {
      if (cb == null) {
        cb = function() {};
      }
      return this.client["delete"]("/apps/" + id, actor, cb);
    };

    Apps.prototype.update = function(id, data, actor, cb) {
      if (cb == null) {
        cb = function() {};
      }
      return this.client.patch("/apps/" + id, data, actor, cb);
    };

    Apps.prototype.clients = function(appId) {
      return new AppsClient(this.client, appId);
    };

    return Apps;

  })();

}).call(this);