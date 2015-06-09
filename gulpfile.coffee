g = require "gulp"
loadPlugins = require "gulp-load-plugins"
browserSync = require("browser-sync").create()
$ = loadPlugins()

ASSETS_DIR = "./assets/"
CSS_OUTPUT = "./assets/css"
SCSS_DIR = "./sass/whisp.scss"
SCSS_FILES = "#{SCSS_DIR}/*.scss"
VULCANIZE_INPUT = "./components.html"
VULCANIZE_OUTPUT_DIR = "./assets/"
VULCANIZE_OUTPUT_FILE = "#{VULCANIZE_OUTPUT_DIR}/components.html"

g.task "sass", ->
  g.src "sass/whisp.scss"
    .pipe $.sass
      includePaths: require("node-neat").with("node-bourbon")
    .pipe g.dest CSS_OUTPUT
    .pipe browserSync.stream()
    
g.task "vulcanize", ->
  g.src VULCANIZE_INPUT
    .pipe $.vulcanize
      strip: true
      inlineCss: true
      inlineScripts: true
    .pipe g.dest VULCANIZE_OUTPUT_DIR
    
g.task "build", ->
    
g.task "watch", ->
  browserSync.init
    watchTask: true
    proxy: "localhost:2368"
    
  # Define all watch src/task pairs
  g.watch SCSS_FILES, ["sass"]