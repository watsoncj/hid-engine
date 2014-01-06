Engine = require './engine'

class HidEngine

  constructor: (@options) ->
    new Engine @options.vendorId, @options.productId, @options.commands

  @devices: =>
    Engine.devices()

module.exports = HidEngine
