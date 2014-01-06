module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      compile:
        files:
          'lib/command.js': 'src/command.coffee'
          'lib/device.js': 'src/device.coffee'
          'lib/engine.js': 'src/engine.coffee'
          'lib/hid-engine.js': 'src/hid-engine.coffee'
    mochaTest:
      options:
        reporter: 'nyan'
      src: ['test/konami.coffee']

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-mocha-test'

  grunt.registerTask 'default', ['coffee', 'mochaTest']
