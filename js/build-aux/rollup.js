/* Rollup plugins.  */
import buble from "rollup-plugin-buble";
import eslint from "rollup-plugin-eslint";

export default {
  entry: "src/index.js",
  dest: "build/info.js",
  format: "iife",
  sourceMap: "inline",
  plugins: [
    eslint ({
      configFile: "build-aux/eslint.json",
      formatter: "unix",
      include: "src/*"
    }),
    buble ()
  ]
};
