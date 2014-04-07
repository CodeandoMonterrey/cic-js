// Generated by CoffeeScript 1.6.3
var ActiveCic;

ActiveCic = (function() {
  var BASE_URL;

  BASE_URL = "http://api.cic.mx/0/nl";

  function ActiveCic(end_point) {
    if (end_point == null) {
      end_point = "reports";
    }
    this.url = "" + BASE_URL + "/" + end_point + ".json";
    $.ajaxSetup({
      url: this.url,
      dataType: 'json',
      crossDomain: true
    });
  }

  ActiveCic.prototype.get = function(propName, propFunc) {
    return this.__defineGetter__(propName, propFunc);
  };

  return ActiveCic;

})();
