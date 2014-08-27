webdriver = require 'selenium-webdriver'
By = webdriver.By


parseSelector = (selector) ->
  type = 'css'
  m = /(xpath|name|linkText|tagName)=(.*)/gi.exec selector
  if (m)
    type = m[1]
    selector = m[2]
  else
    console.log 'selector = ', selector
    if /(\s+|>|:|\+)/gi.test selector
      type = 'css'
    else if selector.indexOf('#') is 0
      type = 'id'
    else if selector.indexOf('.') is 0
      type = 'className'
      selector = selector.substring 1
    else if selector.indexOf('/') is 0
      type = 'xpath'
    else
      type = 'className'

  return {using: type, selector}


module.exports = exports = class Manager
  constructor: (driver) ->
    @d = driver

  get: (v) ->
    {using, selector} = parseSelector selector
    return @d.findElement By[type] selector

  goto: (page) ->
    @d.get page.url

  getTitle: (page) ->
    @d.getTitle()
