// Generated by CoffeeScript 1.6.3
describe('Category', function() {
  var attributes, category;
  category = null;
  attributes = {
    id: '123',
    name: "ACCIDENTE",
    type: 'blackbox',
    group: new Array,
    metadata: false
  };
  category = new Category(attributes);
  it('responds to categoryId', function() {
    return expect(category.categoryId).toBeDefined();
  });
  it('responds to name', function() {
    return expect(category.name).toBeDefined();
  });
  it('responds to type', function() {
    return expect(category.type).toBeDefined();
  });
  it('responds to groups', function() {
    expect(category.groups).toBeDefined();
    return expect(category.groups).toEqual([]);
  });
  return it('responds to metadata', function() {
    console.log(category);
    expect(category.metaData).toBeDefined();
    return expect(category.metaData).toBeFalsy();
  });
});

describe('_mapGroups', function() {
  var attributes, category;
  category = null;
  attributes = {
    id: '123',
    name: "ACCIDENTE",
    type: 'blackbox',
    group: ["A GROUP", "Another group"]
  };
  beforeEach(function() {
    category = new Category(attributes);
    spyOn(category, '_mapGroups').and.callFake(function() {
      return category.groups = attributes.group;
    });
    return category._mapGroups(attributes.group);
  });
  it('tracks the spy call', function() {
    return expect(category._mapGroups).toHaveBeenCalledWith(attributes.group);
  });
  return it('returns and array of two groups', function() {
    return expect(category.groups.length).toEqual(2);
  });
});

describe('Category.all', function() {
  var categoriesArray, categoryMock, categoryResponseJSON;
  categoriesArray = new Array;
  categoryMock = null;
  categoryResponseJSON = {
    id: '123',
    name: "ACCIDENTE",
    type: 'blackbox',
    group: ["A GROUP", "Another group"]
  };
  beforeEach(function() {
    var index, _i;
    for (index = _i = 1; _i <= 3; index = ++_i) {
      categoriesArray.push(new Category(categoryResponseJSON));
    }
    categoryMock = jasmine.createSpyObj(Category, ['all']);
    categoryMock.all();
    return categoryMock.all.and.callFake(function() {
      return categoriesArray;
    });
  });
  it('tracks that the spy was called', function() {
    return expect(categoryMock.all).toHaveBeenCalled();
  });
  return it('returns and array of three reports', function() {
    return expect(categoryMock.all()).toEqual(categoriesArray);
  });
});
