assert = require 'assert'
HidEngine = require '../lib/hid-engine'

describe 'hid-engine', =>
  it 'should list devices', ->
    assert HidEngine.devices().length > 0

  it 'should initialize without error', ->
    @success = false
    new HidEngine
      vendorId: 4754
      productId: 17987
      commands: [
        code: [ 0 ]
        exec: ->
      ]
