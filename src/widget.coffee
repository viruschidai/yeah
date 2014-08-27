module.exports = exports = class Widget
  constructor: (@manager) ->
    @rootElement = null
    @createProperties()


  getChildren: ->
    {}


  createProperties: ->
    children = @getChildren()
    for child in children
      do ->
        Object.defineProperty @, child.alias, {
          writeble: true
          enumerable: true
          configurable: false
          get: =>
            @manager.get child.selector
          set: (value) =>
            @manager.set child.selector, value
        }
