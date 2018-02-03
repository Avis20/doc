
const HtmlWebpackPlugin = require('html-webpack-plugin');

const HtmlWebpackPluginConfig = new HtmlWebpackPlugin({
    filename: 'index.html',
    inject: 'body',
    title: 'HELLO',
    template: 'nunjucks-html-loader!./source/templates/index.njk',
});

module.exports = {
    entry: './source/index.js',
    output: {
        filename: 'bundle.js',
        path: __dirname,
        publicPath: '/' //Important!!! : https://github.com/webpack/webpack/issues/1426
    },
    plugins: [ HtmlWebpackPluginConfig ],
    resolve: {
        extensions: ['.Webpack.js', '.web.js', '.ts', '.js', '.tsx']
    },

    module: {
        loaders: [
        {
            test: /\.html$|njk|nunjucks/,
            use: ['html-loader', {
                loader: 'nunjucks-html-loader',
                options : {
                    // FileSystemLoader: '/home/avis/develop/learn/js/nunjucks',
                    // Other super important. This will be the base
                    // directory in which webpack is going to find 
                    // the layout and any other file index.njk is calling.
                    // searchPaths: ['/home/avis/develop/learn/js/nunjucks/source/templates/**/']
                    searchPaths: ['source/templates']
                    // Use the one below if you want to use a single path.
                    // searchPaths: ['./source/templates'],
                }
            }]
        }]
    }
}