process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const environment = require('./environment')
const StylelintPlugin = require('stylelint-webpack-plugin');

environment.config.merge({
  plugins: [new StylelintPlugin()]
})

module.exports = environment.toWebpackConfig()
