class Command
  constructor: (@code, @exec) ->

  check: (state) ->
    t = @code[0...@pos]
    t.push state
    @pos = @_fit t, @code

    if @pos >= @code.length
      @exec()
      @pos = 0

  _fit: (t, c) ->
    if @_equals(t, c[0...t.length])
      return t.length
    t.shift()
    return @_fit t, c

  _equals: (a, b) ->
    return false unless a.length is b.length
    for i in [0..a.length]
      return false unless a[i] is b[i]
    return true

module.exports = Command
