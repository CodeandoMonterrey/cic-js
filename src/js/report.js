// Generated by CoffeeScript 1.6.3
var Report,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

Report = (function(_super) {
  var DEFAULT_FIND_PARAMS;

  __extends(Report, _super);

  DEFAULT_FIND_PARAMS = {
    limit: 1,
    for_category: 407,
    until: void 0
  };

  function Report(attributes) {
    if (attributes == null) {
      attributes = {};
    }
    this._setGetters = __bind(this._setGetters, this);
    this.save = __bind(this.save, this);
    this._serializedAttributes = __bind(this._serializedAttributes, this);
    Report.__super__.constructor.call(this, "reports");
    this.account = attributes.account || "nl";
    this.format = "json";
    this.title = attributes.title || "";
    this.content = attributes.content || "";
    this.first_name = attributes.first_name || "";
    this.last_name = attributes.last_name || "";
    this.return_path = attributes.return_path || "";
    this.lat = attributes.lat || "";
    this.lng = attributes.lng || "";
    this.video_url = attributes.video_url || "";
    this.categories = attributes.category || attributes.categories || "ACCIDENTE";
    this.reportSerializedParams = {};
    this.didSave = false;
    this._serializedAttributes();
    if (attributes.ticket) {
      this._setGetters(attributes);
    }
  }

  Report.prototype._serializedAttributes = function() {
    return {
      reports: {
        account: this.account,
        format: this.format,
        title: this.title,
        content: this.content,
        first_name: this.first_name,
        last_name: this.last_name,
        return_path: this.return_path,
        lat: this.lat,
        lng: this.lng,
        video_url: this.video_url,
        categories: this.categories
      }
    };
  };

  Report.prototype.save = function(responseCallback) {
    var _this = this;
    return $.ajax({
      type: 'POST',
      data: this._serializedAttributes(),
      success: function(data) {
        _this._setGetters(data.reports);
        _this.didSave = true;
        if (responseCallback) {
          return responseCallback(_this);
        }
      },
      error: function() {
        return console.log('Something went wrong');
      }
    });
  };

  Report.create = function(attributes, responseCallback) {
    var report;
    report = new Report(attributes);
    return report.save(responseCallback);
  };

  Report.prototype._setGetters = function(attributes) {
    var _this = this;
    this.get('ticketId', function() {
      return attributes.ticket;
    });
    this.get('state', function() {
      return attributes.state;
    });
    this.get('created_at', function() {
      return new Date(attributes.created_at);
    });
    this.get('updated_at', function() {
      return new Date(attributes.updated_at);
    });
    this.get('is_public', function() {
      return attributes.is_public;
    });
    this.get('votes', function() {
      return attributes.votes;
    });
    this.get('stars', function() {
      return attributes.stars;
    });
    this.get('address_detail', function() {
      return attributes.address_detail;
    });
    return this.get('group', function() {
      return attributes.group;
    });
  };

  Report.find = function(params, callback) {
    var response;
    if (params == null) {
      params = {};
    }
    new ActiveCic('reports');
    params = $.extend({}, DEFAULT_FIND_PARAMS, params);
    response = new Array;
    $.ajax({
      type: 'GET',
      async: params.async,
      data: params,
      success: function(data) {
        var report_attributes, reports, _i, _len, _results;
        reports = data.reports;
        _results = [];
        for (_i = 0, _len = reports.length; _i < _len; _i++) {
          report_attributes = reports[_i];
          response.push(new Report(report_attributes));
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

  return Report;

}).call(this, ActiveCic);

window.Report = Report;