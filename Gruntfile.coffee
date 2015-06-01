module.exports = (grunt) =>
  require("load-grunt-tasks")(grunt) 
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json") #
    vulcanize:
      components:
        files:
          "assets/components.html": "components.html"
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
    browserSync:
      dev:
        bsFiles:
          src: [
            "assets/css/app.min.css"
            "assets/js/*.js"
          ]
        options:
          proxy: "localhost:2368"
  
  # Tasks
  grunt.registerTask "build", ["vulcanize", "sass"]
  grunt.registerTask "serve", ["browserSync"]
  grunt.registerTask "default", ["build", "serve"]