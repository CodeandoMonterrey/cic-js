describe 'Category', ->
  category = null
  attributes = {
    id: '123'
    name: "ACCIDENTE"
    type: 'blackbox'
    group: new Array
    metadata: false
  }
  category = new Category(attributes)

  it 'responds to categoryId', ->
    expect(category.categoryId).toBeDefined()

  it 'responds to name', ->
    expect(category.name).toBeDefined()

  it 'responds to type', ->
    expect(category.type).toBeDefined()

  it 'responds to groups', ->
    expect(category.groups).toBeDefined()
    expect(category.groups).toEqual []

  it 'responds to metadata', ->
    console.log category
    expect(category.metaData).toBeDefined()
    expect(category.metaData).toBeFalsy()

describe '_mapGroups', ->
  category = null
  attributes = {
    id: '123'
    name: "ACCIDENTE"
    type: 'blackbox'
    group: ["A GROUP", "Another group"]
  }

  beforeEach ->
    category = new Category attributes

    spyOn(category, '_mapGroups').and.callFake ->
      category.groups = attributes.group

    category._mapGroups(attributes.group)

  it 'tracks the spy call', ->
    expect(category._mapGroups).toHaveBeenCalledWith(attributes.group)

  it 'returns and array of two groups', ->
    expect(category.groups.length).toEqual 2

describe 'Category.all', ->
  categoriesArray = new Array
  categoryMock = null
  categoryResponseJSON = {
    id: '123'
    name: "ACCIDENTE"
    type: 'blackbox'
    group: ["A GROUP", "Another group"]
  }

  beforeEach ->
    for index in [1..3]
      categoriesArray.push new Category categoryResponseJSON
    categoryMock = jasmine.createSpyObj(Category, ['all'])
    categoryMock.all()
    categoryMock.all.and.callFake ->
     categoriesArray
      
  it 'tracks that the spy was called', ->
    expect(categoryMock.all).toHaveBeenCalled()

  it 'returns and array of three reports', ->
    expect(categoryMock.all()).toEqual categoriesArray

