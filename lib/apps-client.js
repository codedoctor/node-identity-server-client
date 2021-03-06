// Generated by CoffeeScript 1.6.3
(function() {
  var AppsClient,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  module.exports = AppsClient = (function() {
    function AppsClient(client, appId) {
      this.client = client;
      this.appId = appId;
      this["delete"] = __bind(this["delete"], this);
      this.create = __bind(this.create, this);
      this.get = __bind(this.get, this);
      this.all = __bind(this.all, this);
      if (!this.client) {
        throw new Error("client parameter is required");
      }
      if (!this.appId) {
        throw new Error("appId parameter is required");
      }
    }

    AppsClient.prototype.all = function(actor, cb) {
      if (cb == null) {
        cb = function() {};
      }
      return this.client.get("/apps/" + this.appId + "/clients", actor, cb);
    };

    AppsClient.prototype.get = function(id, actor, cb) {
      if (cb == null) {
        cb = function() {};
      }
      return this.client.get("/apps/" + this.appId + "/clients/" + id, actor, cb);
    };

    AppsClient.prototype.create = function(data, actor, cb) {
      if (cb == null) {
        cb = function() {};
      }
      return this.client.post("/apps/" + this.appId + "/clients", data, actor, cb);
    };

    AppsClient.prototype["delete"] = function(id, actor, cb) {
      if (cb == null) {
        cb = function() {};
      }
      return this.client["delete"]("/apps/" + this.appId + "/clients/" + id, actor, cb);
    };

    return AppsClient;

  })();

}).call(this);
