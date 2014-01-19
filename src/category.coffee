class Category extends ActiveCic

  constructor: (attributes = {}) ->
    #Category attributes
    @categoryId = attributes.id
    @name = attributes.name
    @type = attributes.type
    @groups = new Array
    @metaData = attributes.metadata

    @_mapGroups(attributes.group)

  _mapGroups: (groups_plain_array) =>
    for group in groups_plain_array
      @groups.push new Group {
        name: group
        categories: new Array
      }

  @all: (options = {}, callback) ->
    new ActiveCic "categories"
    response = new Array

    $.ajax(
      type: 'GET'
      async: options.async
      success: (data) ->
        categories = data.categories
        for category_attributes in categories
          response.push new Category category_attributes
          callback(response) if callback
    )
    response

window.Category = Category
