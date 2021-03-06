// Generated by CoffeeScript 1.6.3
(function() {
  var Lookup, _,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  _ = require('underscore');

  module.exports = Lookup = (function() {
    function Lookup(client) {
      this.client = client;
      this.users = __bind(this.users, this);
      if (!this.client) {
        throw new Error("client parameter is required");
      }
    }

    Lookup.prototype.users = function(q, cb) {
      if (cb == null) {
        cb = function() {};
      }
      return this.client.get("/lookup/users?q=" + (encodeURIComponent(q)), null, cb);
    };

    return Lookup;

  })();

}).call(this);
