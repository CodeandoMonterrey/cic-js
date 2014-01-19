module.exports = function(grunt) {
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    jasmine: {
      components: {
        src: [
          'src/js/*.js'
        ],
        options: {
          specs: 'specs/js/*Spec.js',
          keepRunner : true,
          //helpers: 'test/spec/*.js'
        }
      }
    }
  });
  grunt.registerTask('travis', ['jasmine']);
}
