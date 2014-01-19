describe 'Group', ->
  group = null
  attributes = {
    id: '#1234'
    name: "Seguridad Vial"
    categories: new Array
  }
  beforeEach ->
    group = new Group(attributes)
  
  it 'responds to groupId', ->
    expect(group.groupId).toBeDefined()

  it 'responds to name', ->
    expect(group.name).toBeDefined()

  it 'responds to categories', ->
    expect(group.categories).toBeDefined()

describe '_mapCategories', ->
  group = null
  attributes = {
    id: '#1234'
    name: "Seguridad Vial"
    categories: [new Category(group: []), new Category(group: new Array)] 
  }
  beforeEach ->
    group = new Group attributes

    spyOn(group, '_mapCategories').and.callFake ->
      group.categories = [new Category(group: []), new Category(group: new Array)]

    group._mapCategories(attributes.categories)

  it 'tracks the spy call', ->
    expect(group._mapCategories).toHaveBeenCalledWith(attributes.categories)

  it 'returns and array of two categories', ->
    expect(group.categories.length).toEqual 2

describe 'Group.all', ->
  groupsArray = new Array
  groupMock = null
  groupResponseJSON = {
    id: '#1234'
    name: 'Vialidad y Transito (SS)'
    categories: [["ACCIDENTE", 123]]
  }

  beforeEach ->
    for index in [1..3]
      groupsArray.push new Group groupResponseJSON
    groupMock = jasmine.createSpyObj(Group, ['all'])
    groupMock.all()
    groupMock.all.and.callFake ->
      groupsArray
      

  it 'tracks that the spy was called', ->
    expect(groupMock.all).toHaveBeenCalled()

  it 'returns and array of three reports', ->
    expect(groupMock.all()).toEqual groupsArray
