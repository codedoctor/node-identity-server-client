// Generated by CoffeeScript 1.3.3
(function() {
  var Users,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  module.exports = Users = (function() {

    function Users(client) {
      this.client = client;
      this.validatePasswordReset = __bind(this.validatePasswordReset, this);

      this.requestPasswordReset = __bind(this.requestPasswordReset, this);

      this.updatePassword = __bind(this.updatePassword, this);

      this.update = __bind(this.update, this);

      this["delete"] = __bind(this["delete"], this);

      this.getX = __bind(this.getX, this);

      this.all = __bind(this.all, this);

      this.get = __bind(this.get, this);

      this.getUserOrOrganizationByName = __bind(this.getUserOrOrganizationByName, this);

      this.createLocal = __bind(this.createLocal, this);

      if (!this.client) {
        throw new Error("client parameter is required");
      }
    }

    Users.prototype.createLocal = function(username, email, password, cb) {
      var data;
      if (cb == null) {
        cb = function() {};
      }
      data = {
        username: username,
        email: email,
        password: password
      };
      return this.client.post("/users", data, null, cb);
    };

    Users.prototype.getUserOrOrganizationByName = function(name, cb) {
      if (cb == null) {
        cb = function() {};
      }
      return this.client.get("/entities/" + name, null, cb);
    };

    Users.prototype.get = function(id, cb) {
      if (cb == null) {
        cb = function() {};
      }
      return this.client.get("/users/" + id, null, cb);
    };

    Users.prototype.all = function(actor, cb) {
      if (cb == null) {
        cb = function() {};
      }
      return this.client.get("/users", actor, cb);
    };

    Users.prototype.getX = function(id, actor, cb) {
      if (cb == null) {
        cb = function() {};
      }
      return this.client.get("/users/" + id, actor, cb);
    };

    Users.prototype["delete"] = function(id, actor, cb) {
      if (cb == null) {
        cb = function() {};
      }
      return this.client["delete"]("/users/" + id, actor, cb);
    };

    Users.prototype.update = function(id, data, actor, cb) {
      if (cb == null) {
        cb = function() {};
      }
      return this.client.patch("/users/" + id, data, actor, cb);
    };

    Users.prototype.updatePassword = function(id, newPassword, actor, cb) {
      var data;
      if (cb == null) {
        cb = function() {};
      }
      data = {
        password: newPassword
      };
      return this.client.put("/users/" + id + "/password", data, actor, cb);
    };

    Users.prototype.requestPasswordReset = function(id, actor, cb) {
      var data;
      if (cb == null) {
        cb = function() {};
      }
      data = {
        password: newPassword
      };
      return this.client.post("/users/" + id + "/password-reset-tokens", data, actor, cb);
    };

    Users.prototype.validatePasswordReset = function(id, token, newPassword, actor, cb) {
      var data;
      if (cb == null) {
        cb = function() {};
      }
      data = {
        password: newPassword
      };
      return this.client.put("/users/" + id + "/password-reset-tokens/" + token, data, actor, cb);
    };

    return Users;

  })();

}).call(this);