module.exports = function(grunt) {
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    jasmine: {
        options: {
          specs: 'specs/js/*Spec.js',
          keepRunner : true,
          vendor: "http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"
          //helpers: 'test/spec/*.js'
        }
      }
  });
  grunt.loadNpmTasks('grunt-contrib-jasmine');
  grunt.registerTask('travis', ['jasmine']);
};
