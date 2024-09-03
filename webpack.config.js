module.exports = {
    entry: './app/javascript/packs/application.js',
    "mode": "production",
    resolve: {
        modules: ['app/javascript', 'node_modules'],
        fallback: {
            "os": require.resolve("os-browserify/browser"),
            "crypto": require.resolve("crypto-browserify"),
            "path": require.resolve("path-browserify"),
            "buffer": require.resolve("buffer/"),
            "stream" : require.resolve("stream-browserify"),
            "vm" : require.resolve("vm-browserify")
        }
    },
    module: {
        rules: [{
            test: /\.css$/,
            use: ['style-loader', 'css-loader']
        }]
    }
}