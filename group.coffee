class Group extends ActiveCic

  constructor: (attributes = {}) ->
    @groupId = attributes.id
    @name = attributes.name
    @categories = new Array

    @_mapCategories(attributes.categories)

  _mapCategories: (categories_plain_array) =>
    for category in categories_plain_array
      @categories.push new Category {
        name: category[0]
        id: category[1]
        group: new Array
      }

  @all: (options = {}, callback) ->
    new ActiveCic "groups"
    response = new Array

    $.ajax(
      type: 'GET'
      async: options.async
      success: (data) ->
        groups = data.groups
        for group_attrs in groups
          response.push new Group group_attrs
          callback(response) if callback
    )
    response

window.Group = Group
