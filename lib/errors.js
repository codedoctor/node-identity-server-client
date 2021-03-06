// Generated by CoffeeScript 1.6.3
(function() {
  var AccessDenied, NotFound, UnprocessableEntity,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  exports.NotFound = NotFound = (function(_super) {
    __extends(NotFound, _super);

    function NotFound(path) {
      this.name = 'NotFound';
      this.status = 404;
      if (path) {
        Error.call(this, "Cannot find " + path);
        this.path = path;
      } else {
        Error.call(this, "Not Found");
      }
      Error.captureStackTrace(this, arguments.callee);
    }

    return NotFound;

  })(Error);

  exports.AccessDenied = AccessDenied = (function(_super) {
    __extends(AccessDenied, _super);

    function AccessDenied(path) {
      this.path = path;
      this.name = 'AccessDenied';
      this.message = "You cannot access the resource " + this.path;
      this.status = 401;
      Error.call(this, this.message);
      Error.captureStackTrace(this, arguments.callee);
    }

    return AccessDenied;

  })(Error);

  exports.UnprocessableEntity = UnprocessableEntity = (function(_super) {
    __extends(UnprocessableEntity, _super);

    function UnprocessableEntity(parameter) {
      this.parameter = parameter;
      this.name = 'UnprocessableEntity';
      this.message = "At least one parameter is missing or invalid " + this.parameter;
      this.status = 422;
      Error.call(this, this.message);
      Error.captureStackTrace(this, arguments.callee);
    }

    return UnprocessableEntity;

  })(Error);

}).call(this);
