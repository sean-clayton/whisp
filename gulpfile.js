var gulp = require("gulp");
var loadPlugins = require("gulp-load-plugins");
var $ = loadPlugins();

const ASSETS_DIR = "./assets/";
const CSS_OUTPUT = "./assets/css";
const VULCANIZE_INPUT = "./components.html";
const VULCANIZE_OUTPUT = "./assets/components.html";

gulp.task("sass", function() {
  return gulp.src("sass/whisp.scss").pipe($.sass({
    includePaths: require("node-neat").with("node-bourbon")
  })).pipe(gulp.dest(CSS_OUTPUT));
});

gulp.task("vulcanize", function() {
  return gulp.src(VULCANIZE_OUTPUT).pipe($.vulcanize({
    dest: VULCANIZE_OUTPUT,
    strip: true,
    inlineCss: true,
    inlineScripts: true
  })).pipe(gulp.dest(VULCANIZE_OUTPUT));
});