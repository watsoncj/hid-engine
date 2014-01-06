Command = require './command'
Device = require './device'

class Engine
  constructor: (vendorId, productId, commands) ->
    @commands = (new Command(command.code, command.exec) for command in commands)

    new Device(vendorId, productId).on 'change', @_change

  _change: (state) =>
    command.check state for command in @commands

  @devices: =>
    Device.list()

module.exports = Engine
