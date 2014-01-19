describe 'ActiveCic', ->
  it "responds to url with the reports.json as the endpoint", ->
    activeCic = new ActiveCic
    expect(activeCic.url).toBe 'http://api.cic.mx/0/nl/reports.json'

  it "responds to url with the categories.json as the endpoint  when initialize with 'categories'", ->
    activeCic = new ActiveCic "categories"
    expect(activeCic.url).toBe 'http://api.cic.mx/0/nl/categories.json'

  it "responds to url with the groups.json as the endpoint when initialize with 'groups'", ->
    activeCic = new ActiveCic "groups"
    expect(activeCic.url).toBe 'http://api.cic.mx/0/nl/groups.json'

  it "defines a get method for the prototype object", ->
    activeCic = new ActiveCic
    activeCic.get 'aGetterMethod', -> return true
    expect(activeCic.aGetterMethod).toBeDefined()
