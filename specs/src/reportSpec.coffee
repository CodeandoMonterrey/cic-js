describe 'Report', ->
  report = null
  beforeEach ->
    report = new Report

  it 'responds to reports endpoint', ->
    expect(report.url).toBeDefined()

  it 'responds to account', ->
    expect(report.account).toBeDefined()
    expect(report.account).toBe('nl')

  it 'responds to format json as default', ->
    expect(report.format).toBeDefined()
    expect(report.format).toBe 'json'

  it 'responds to title', ->
    expect(report.title).toBeDefined()

  it 'responds to content', ->
    expect(report.content).toBeDefined()

  it 'responds to first_name', ->
    expect(report.first_name).toBeDefined()

  it 'responds to last_name', ->
    expect(report.last_name).toBeDefined()

  it 'responds to return_path', ->
    expect(report.return_path).toBeDefined()

  it 'responds to lat', ->
    expect(report.lat).toBeDefined()

  it 'responds to lng', ->
    expect(report.lng).toBeDefined()

  it 'responds to video_url', ->
    expect(report.video_url).toBeDefined()

  it 'responds to categories', ->
    expect(report.categories).toBeDefined()
    expect(report.categories).toBe 'ACCIDENTE'

  it 'has a didSave default value to false', ->
    expect(report.didSave).toBeFalsy()

describe '._serializedAttributes', ->
  expectedReportsHash = {}
  report = new Report(
    title: 'A title'
    content: 'The content'
    first_name: 'Abraham'
    last_name: 'Kuri'
    categories: 'ACCIDENTE'
  )
  beforeEach ->
    expectedReportsHash =
    reports: {
      account: 'nl'
      format: 'json'
      title: 'A title'
      content: 'The content'
      first_name: 'Abraham'
      last_name: 'Kuri'
      return_path: ''
      lat: ''
      lng: ''
      video_url: ''
      categories: 'ACCIDENTE'
    }

  it 'has the expected POST serialization json', ->
    expect(report._serializedAttributes()).toEqual expectedReportsHash

describe 'Report.find()', ->
  reportsArray = new Array
  reportMock = null
  responseReportJSON = {
      account: 'nl'
      format: 'json'
      title: 'A title'
      content: 'The content'
      first_name: 'Abraham'
      last_name: 'Kuri'
      return_path: ''
      lat: ''
      lng: ''
      video_url: ''
      categories: 'ACCIDENTE'
      created_at: new Date()
      updated_at: new Date()
      ticket: '#1234'
      state: 'read'
      is_public: true
      votes: 0
      stars: 0
      address_detail: {}
      group: 'Vialidad y Transito (SS)'
    }

  beforeEach ->
    for index in [1..3]
      reportsArray.push new Report responseReportJSON
    reportMock = jasmine.createSpyObj('Report', ['find'])
    reportMock.find()
    reportMock.find.and.callFake ->
      reportsArray

  it 'tracks that the spy was called', ->
    expect(reportMock.find).toHaveBeenCalled()

  it 'returns and array of three reports', ->
    expect(reportMock.find()).toEqual reportsArray

describe 'Report.find("limit": 1)', ->
  reportsArray = new Array
  reportMock = null
  responseReportJSON = {
      account: 'nl'
      format: 'json'
      title: 'A title'
      content: 'The content'
      first_name: 'Abraham'
      last_name: 'Kuri'
      return_path: ''
      lat: ''
      lng: ''
      video_url: ''
      categories: 'ACCIDENTE'
      created_at: new Date()
      updated_at: new Date()
      ticket: '#1234'
      state: 'read'
      is_public: true
      votes: 0
      stars: 0
      address_detail: {}
      group: 'Vialidad y Transito (SS)'
    }

  beforeEach ->
    for index in [1..3]
      reportsArray.push new Report responseReportJSON
    reportMock = jasmine.createSpyObj('Report', ['find'])
    reportMock.find("limit": 1)
    reportMock.find.and.callFake ->
      reportsArray[0]

  it 'tracks that the spy was called', ->
    expect(reportMock.find).toHaveBeenCalledWith({"limit": 1})

  it 'returns and array of three reports', ->
    expect(reportMock.find()).toEqual reportsArray[0]
 
describe 'report_instance._setGetters', ->
  report = null
  beforeEach ->
    responseReportJSON = {
        account: 'nl'
        format: 'json'
        title: 'A title'
        content: 'The content'
        first_name: 'Abraham'
        last_name: 'Kuri'
        return_path: ''
        lat: ''
        lng: ''
        video_url: ''
        categories: 'ACCIDENTE'
        created_at: new Date()
        updated_at: new Date()
        ticket: '#1234'
        state: 'read'
        is_public: true
        votes: 0
        stars: 0
        address_detail: {}
        group: 'Vialidad y Transito (SS)'
      }
    report = new Report(responseReportJSON)

  it 'responds to ticketId', ->
    expect(report.ticketId).toBeDefined()

  it 'responds to state', ->
    expect(report.state).toBeDefined()

  it 'responds to created_at', ->
    expect(report.created_at).toBeDefined()

  it 'responds to is_public', ->
    expect(report.is_public).toBeDefined()

  it 'responds to votes', ->
    expect(report.votes).toBeDefined()

  it 'responds to stars', ->
    expect(report.stars).toBeDefined()

  it 'responds to address_detail', ->
    expect(report.address_detail).toBeDefined()

  it 'responds to group', ->
    expect(report.group).toBeDefined()

describe 'report_instance.save', ->
  report = null
  beforeEach ->
    reportAttributes = {
      content: 'A content'
      categories: 'ACCIDENTE'
    }

    report = new Report(reportAttributes)
    responseReportJSON = {
        account: 'nl'
        format: 'json'
        title: 'A title'
        first_name: 'Abraham'
        last_name: 'Kuri'
        return_path: ''
        lat: ''
        lng: ''
        video_url: ''
        created_at: new Date()
        updated_at: new Date()
        ticket: '#1234'
        state: 'read'
        is_public: true
        votes: 0
        stars: 0
        address_detail: {}
        group: 'Vialidad y Transito (SS)'
      }


    spyOn(report, 'save').and.callFake ->
      report._setGetters(responseReportJSON)
    report.save()

  it 'tracks the spy was called', ->
    expect(report.save).toHaveBeenCalled()

  it 'sets the ticketId', ->
    expect(report.ticketId).toBeDefined()


describe 'report_instance.create()', ->
  report = null
  beforeEach ->
    reportAttributes = {
      content: 'A content'
      categories: 'ACCIDENTE'
    }

    report = new Report(reportAttributes)
    responseReportJSON = {
        account: 'nl'
        format: 'json'
        title: 'A title'
        first_name: 'Abraham'
        last_name: 'Kuri'
        return_path: ''
        lat: ''
        lng: ''
        video_url: ''
        created_at: new Date()
        updated_at: new Date()
        ticket: '#1234'
        state: 'read'
        is_public: true
        votes: 0
        stars: 0
        address_detail: {}
        group: 'Vialidad y Transito (SS)'
      }

    spyOn(report, 'save').and.callFake ->
      report._setGetters(responseReportJSON)

    spyOn(Report, 'create').and.callFake ->
      report.save()

    Report.create(reportAttributes)

  it 'tracks the spy was called', ->
    expect(Report.create).toHaveBeenCalled()

  it 'saves the report', ->
    expect(report.ticketId).toBeDefined()
