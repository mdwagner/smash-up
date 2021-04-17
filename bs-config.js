/*
 | Browser-sync config file
 |
 | For up-to-date information about the options:
 |   http://www.browsersync.io/docs/options/
 |
 */

module.exports = {
  snippetOptions: {
    rule: {
      match: /<\/head>/i,
      fn: function (snippet, match) {
        return snippet + match;
      }
    }
  },
  files: ["bin/start_server"],
  watchEvents: ["change"],
  open: false,
  browser: "default",
  ghostMode: false,
  ui: false,
  online: false,
  logConnections: false
};
