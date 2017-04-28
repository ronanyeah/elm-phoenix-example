const { resolve } = require( 'path' );

const outputPath = resolve('./priv/static/js');

module.exports = {
  entry: './elm/index.js',
  output: {
    path: outputPath,
    filename: 'bundle.js'
  },
  module: {
    rules: [{
      test: /\.elm$/,
      exclude: [/elm-stuff/, /node_modules/],
      use: {
        loader: 'elm-webpack-loader',
        options: {
          cwd: __dirname
        }
      }
    }]
  }
};
