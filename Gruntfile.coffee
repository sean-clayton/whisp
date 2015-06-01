module.exports = (grunt) =>
  require("load-grunt-tasks")(grunt) 
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json") #
    vulcanize:
      components:
        files:
          "assets/components.html": "components.html"
          "assets/components-min.html": "assets/components.html"
    sass:
      default:
        files: "assets/css/app.min.css": "sass/app.scss"
    watch:
      components:
        files: "components.html"
        tasks: ["vulcanize"]
      sass:
        files: "sass/*.scss"
        tasks: ["sass"]
  
  # Tasks
  grunt.registerTask "build", ["vulcanize", "sass"]
  grunt.registerTask "default", ["build"]