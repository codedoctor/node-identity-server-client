// Generated by CoffeeScript 1.6.3
(function() {
  var TokenInfos,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  module.exports = TokenInfos = (function() {
    function TokenInfos(client) {
      this.client = client;
      this.validate = __bind(this.validate, this);
      if (!this.client) {
        throw new Error("client parameter is required");
      }
    }

    TokenInfos.prototype.validate = function(token, cb) {
      var _this = this;
      return this.client.get("/token-infos/" + token, null, function(err, body, statusCode) {
        var result;
        if (err) {
          return cb(err);
        }
        result = {
          isValid: !!(body.actor && body.actor.actorId && body.expiresIn),
          actor: body.actor || {},
          expiresIn: body.expiresIn || 0,
          scopes: body.scopes || []
        };
        return cb(null, result);
      });
    };

    return TokenInfos;

  })();

}).call(this);
