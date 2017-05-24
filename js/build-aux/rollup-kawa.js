/* Rollup plugins.  */
import buble from 'rollup-plugin-buble';

export default {
  entry: 'src/index.js',
  dest: 'examples/kawa/kawa-ebook.js',
  format: 'iife',
  sourceMap: 'inline',
  plugins: [
    buble()
  ]
};
