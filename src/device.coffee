{EventEmitter} = require 'events'
HID = require 'node-hid'

class Device extends EventEmitter
  @list: ->
    HID.devices()

  constructor: (vendorId, productId) ->
    dev = new HID.HID vendorId, productId
    dev.on 'data', (data) =>
      state = data.readUInt16LE 0
      @emit 'change', state unless @prev is state
      @prev = state

module.exports = Device
