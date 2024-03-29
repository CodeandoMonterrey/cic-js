// Generated by CoffeeScript 1.6.3
describe('ActiveCic', function() {
  it("responds to url with the reports.json as the endpoint", function() {
    var activeCic;
    activeCic = new ActiveCic;
    return expect(activeCic.url).toBe('http://api.cic.mx/0/nl/reports.json');
  });
  it("responds to url with the categories.json as the endpoint  when initialize with 'categories'", function() {
    var activeCic;
    activeCic = new ActiveCic("categories");
    return expect(activeCic.url).toBe('http://api.cic.mx/0/nl/categories.json');
  });
  it("responds to url with the groups.json as the endpoint when initialize with 'groups'", function() {
    var activeCic;
    activeCic = new ActiveCic("groups");
    return expect(activeCic.url).toBe('http://api.cic.mx/0/nl/groups.json');
  });
  return it("defines a get method for the prototype object", function() {
    var activeCic;
    activeCic = new ActiveCic;
    activeCic.get('aGetterMethod', function() {
      return true;
    });
    return expect(activeCic.aGetterMethod).toBeDefined();
  });
});
