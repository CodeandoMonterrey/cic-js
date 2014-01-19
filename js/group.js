// Generated by CoffeeScript 1.6.3
var Group,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

Group = (function(_super) {
  __extends(Group, _super);

  function Group(attributes) {
    if (attributes == null) {
      attributes = {};
    }
    this._mapCategories = __bind(this._mapCategories, this);
    this.groupId = attributes.id;
    this.name = attributes.name;
    this.categories = new Array;
    this._mapCategories(attributes.categories);
  }

  Group.prototype._mapCategories = function(categories_plain_array) {
    var category, _i, _len, _results;
    _results = [];
    for (_i = 0, _len = categories_plain_array.length; _i < _len; _i++) {
      category = categories_plain_array[_i];
      _results.push(this.categories.push(new Category({
        name: category[0],
        id: category[1],
        group: new Array
      })));
    }
    return _results;
  };

  Group.all = function(options, callback) {
    var response;
    if (options == null) {
      options = {};
    }
    new ActiveCic("groups");
    response = new Array;
    $.ajax({
      type: 'GET',
      async: options.async,
      success: function(data) {
        var group_attrs, groups, _i, _len, _results;
        groups = data.groups;
        _results = [];
        for (_i = 0, _len = groups.length; _i < _len; _i++) {
          group_attrs = groups[_i];
          response.push(new Group(group_attrs));
          if (callback) {
            _results.push(callback(response));
          } else {
            _results.push(void 0);
          }
        }
        return _results;
      }
    });
    return response;
  };

  return Group;

})(ActiveCic);

window.Group = Group;
