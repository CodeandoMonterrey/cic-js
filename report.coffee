class Report extends ActiveCic

  DEFAULT_FIND_PARAMS = {
    limit: 1
    for_category: 407 #ACCIDENTE by default
    until: undefined #format: YYYY-MM-DD
  }
  constructor: (attributes = {}) ->
    #inits the ajaxSetup
    super("reports")

    #Report attributes
    @account = attributes.account || "nl"
    @format = "json"
    @title = attributes.title
    @content = attributes.content
    @first_name = attributes.first_name
    @last_name = attributes.last_name
    @return_path = attributes.return_path
    @lat = attributes.lat
    @lng = attributes.lng
    @video_url = attributes.video_url
    @categories = attributes.category || attributes.categories

    @reportSerializedParams = {}
    @didSave = false

    @_serializedAttributes()

    @_setGetters(attributes) if attributes.ticket

  _serializedAttributes: =>
    reports: {
      account: @account
      format: @format
      title: @title
      content: @content
      first_name: @first_name
      last_name: @last_name
      return_path: @return_path
      lat: @lat
      lng: @lng
      video_url: @video_url
      categories: @category
    }
    
  save: (responseCallback) =>
    $.ajax(
      type: 'POST'
      data: @_serializedAttributes()
      success: (data) =>
        @_setGetters(data.reports)
        @didSave = true
        responseCallback(@) if responseCallback
      error: =>
        console.log 'Something went wrong'
    )

  @create: (attributes, responseCallback) =>
    report = new Report(attributes)
    report.save(responseCallback)

  _setGetters: (attributes) =>
    @get 'ticketId', => attributes.ticket
    @get 'state', => attributes.state
    @get 'created_at', => new Date(attributes.created_at)
    @get 'updated_at', => new Date(attributes.updated_at)
    @get 'is_public', => attributes.is_public
    @get 'votes', => attributes.votes
    @get 'stars', => attributes.stars
    @get 'address_detail', => attributes.address_detail
    @get 'group', => attributes.group


  @find: (params = {}, callback) ->
    new ActiveCic('reports')
    params = $.extend {}, DEFAULT_FIND_PARAMS, params
    response = new Array

    $.ajax(
      type: 'GET'
      async: params.async
      data: params
      success: (data) ->
        reports = data.reports
        for report_attributes in reports
          response.push new Report report_attributes
          callback(response) if callback
    )
    response

window.Report = Report
