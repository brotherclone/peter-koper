module.exports = {
    entry: './app/javascript/packs/application.js',
    "mode": "production",
    resolve: {
        modules: ['app/javascript', 'node_modules', 'app/assets/javascripts'],
        fallback: {
            "os": require.resolve("os-browserify/browser"),
            "crypto": require.resolve("crypto-browserify"),
            "path": require.resolve("path-browserify"),
            "buffer": require.resolve("buffer/"),
            "stream" : require.resolve("stream-browserify"),
            "vm" : require.resolve("vm-browserify")
        },
        extensions: ['.js', '.json', '.css', '.scss'],
    },
    module: {
        rules: [
            {
            test: /\.css$/,
            use: ['style-loader', 'css-loader']
            },
            {
                test: /\.(png|jpe?g|gif|woff|woff2|eot|ttf|svg)$/i,
                use: [
                    {
                        loader: 'file-loader',
                    },
                ],
            }
        ]
    }
}