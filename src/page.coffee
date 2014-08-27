module.exports = exports = class Page extend Widget
  url: ''

  constructor: (manager) ->
    super(manager)

  createProperties: ->
    super()

    Object.defineProperty @, 'title', {
      writeble: false
      enumerable: true
      configurable: false
      get: =>
        @manager.getTitle()
    }
