var webpack = require('webpack');

var CommonsChunkPlugin = webpack.optimize.CommonsChunkPlugin;
var HtmlWebpackPlugin = require('html-webpack-plugin');
var ExtractTextPlugin = require('extract-text-webpack-plugin');
var CopyWebpackPlugin = require('copy-webpack-plugin');


module.exports = {

  devtool: 'cheap-inline-module-source-map',

  debug: true,


  context: __dirname,

  entry: './entry.js',

  output: {
    path: '../public',
    filename: 'js/[name].js',
    chunkFilename: '[id].chunk.js'
  },

  resolve: {
    cache: false,
    extensions: ['', '.js', '.json', '.css', '.scss', '.html']
  },

  module: {

    preLoaders: [],

    loaders: [

      {test: /\.(png|jpe?g|gif|svg|woff|woff2|ttf|eot|ico)$/, loader: 'file?name=fonts/[name].[hash].[ext]?'},

      {test: /\.json$/, loader: 'json'},

      {
        test: /\.css$/,
        loader: ExtractTextPlugin.extract('style', 'css!')
      },

      {
        test: /\.scss$/,
        include: /client\/stylesheets/,
        loader: ExtractTextPlugin.extract('style', 'css?sourceMap!sass')
      },

      {test: /\.html$/, loader: 'raw'},

      {
        test: /\.js$/,
        include: /client\/javascripts/,
        exclude: /node_modules/,
        loader: 'babel-loader',
        query:
        {
          presets:['es2015', 'react']
          ,"plugins": [
            "add-module-exports"
          ]
        }
      }
    ],

    postLoaders: []
  },

  plugins: [

    new CommonsChunkPlugin({
      name: 'common'
    }),

    new ExtractTextPlugin('css/main.css'),

    new CopyWebpackPlugin([
      { from: './visual-editor/resources/public/visual-editor-min.js', to: 'js/visual-editor-min.js' }
    ])
  ]
}