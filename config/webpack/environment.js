const { environment } = require('@rails/webpacker')

// ここからjquery導入時に追加
const webpack = require('webpack')

environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery'
  })
)
// ここまで

module.exports = environment
