/* Rollup plugins.  */
import buble from 'rollup-plugin-buble';

export default {
  entry: 'src/index.js',
  dest: 'build/info.js',
  format: 'iife',
  sourceMap: 'inline',
  plugins: [
    buble()
  ]
};
