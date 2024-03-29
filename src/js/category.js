// Generated by CoffeeScript 1.6.3
var Category,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

Category = (function(_super) {
  __extends(Category, _super);

  function Category(attributes) {
    if (attributes == null) {
      attributes = {};
    }
    this._mapGroups = __bind(this._mapGroups, this);
    this.categoryId = attributes.id;
    this.name = attributes.name;
    this.type = attributes.type;
    this.groups = new Array;
    this.metaData = attributes.metadata;
    this._mapGroups(attributes.group);
  }

  Category.prototype._mapGroups = function(groups_plain_array) {
    var group, _i, _len, _results;
    _results = [];
    for (_i = 0, _len = groups_plain_array.length; _i < _len; _i++) {
      group = groups_plain_array[_i];
      _results.push(this.groups.push(new Group({
        name: group,
        categories: new Array
      })));
    }
    return _results;
  };

  Category.all = function(options, callback) {
    var response;
    if (options == null) {
      options = {};
    }
    new ActiveCic("categories");
    response = new Array;
    $.ajax({
      type: 'GET',
      async: options.async,
      success: function(data) {
        var categories, category_attributes, _i, _len;
        categories = data.categories;
        for (_i = 0, _len = categories.length; _i < _len; _i++) {
          category_attributes = categories[_i];
          response.push(new Category(category_attributes));
        }
        if (callback) {
          return callback(response);
        }
      }
    });
    return response;
  };

  return Category;

})(ActiveCic);

window.Category = Category;
