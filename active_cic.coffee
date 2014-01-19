class ActiveCic
  BASE_URL = "http://api.cic.mx/0/nl"

  constructor: (end_point) ->
    @url = "#{BASE_URL}/#{end_point}.json"
    $.ajaxSetup(
      url: @url
      dataType: 'json'
    )

  get: (propName, propFunc) ->
    @__defineGetter__ propName, propFunc
