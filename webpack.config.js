var path = require("path");
var webpack = require('webpack');

module.exports = {
  context: __dirname,
  entry: "./frontend/hoo.js",
  output: {
    path: path.join(__dirname, 'app', 'assets', 'javascripts'),
    filename: "bundle.js"
  },
  module: {
    loaders: [
      {
        loader: 'babel-loader',
        exclude: /node_modules/,
        query: {
          presets: ['es2015']
        }
      }
    ]
  },
  devtool: 'source-maps',
  resolve: {
    alias: { 'vue$': 'vue/dist/vue.js' }
  }
};
