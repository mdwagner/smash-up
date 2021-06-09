/*
 | Mix Asset Management
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your application.
 |
 | Docs: https://github.com/JeffreyWay/laravel-mix/tree/master/docs#readme
 */

const mix = require("laravel-mix");
const WebpackNotifierPlugin = require("webpack-notifier");
const CompressionWepackPlugin = require("compression-webpack-plugin");

const devPlugins = [
  // Customize the notifier to be less noisy
  new WebpackNotifierPlugin({
    alwaysNotify: false,
    skipFirstNotification: true,
  }),
];

const prodPlugins = [
  // Compress static assets in production
  new CompressionWepackPlugin({
    compressionOptions: { level: 9 },
    test: /\.js$|\.css$|\.html$|\.svg$/,
  }),
];

const plugins = mix.inProduction()
  ? [...devPlugins, ...prodPlugins]
  : devPlugins;

mix
  // Set public path so manifest gets output here
  .setPublicPath("public")

  // More info and options (like React support) here:
  // https://github.com/JeffreyWay/laravel-mix/blob/master/docs/mixjs.md
  .js("src/js/app.js", "js")
  .extract()

  .postCss("src/css/app.css", "css", [require("tailwindcss")])

  // Customize postCSS:
  // https://github.com/JeffreyWay/laravel-mix/blob/master/docs/css-preprocessors.md#postcss-plugins
  .options({
    // If you want to process images, change this to true and add options from
    // https://github.com/tcoopman/image-webpack-loader
    imgLoaderOptions: { enabled: false },
    // Stops Mix from clearing the console when compilation succeeds
    clearConsole: false,
  })

  .sourceMaps(false)

  // Add assets to the manifest
  .version(["public/assets"])

  // Reduce noise in Webpack output
  .webpackConfig({
    stats: "errors-only",
    plugins,
    watchOptions: {
      ignored: /node_modules/,
    },
  })

  // Disable default Mix notifications because we're using our own notifier
  .disableNotifications();
