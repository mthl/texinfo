/* Rollup plugins.  */
import buble from "rollup-plugin-buble";
import eslint from "rollup-plugin-eslint";
import uglify from "rollup-plugin-uglify";

export default {
  entry: "src/index.js",
  dest: "build/info.min.js",
  format: "iife",
  plugins: [
    eslint ({
      configFile: "build-aux/eslint.json",
      formatter: "unix",
      include: "src/*"
    }),
    buble (),
    uglify ()
  ]
};
