fs = require "fs"
path = require "path"
_ = require "lodash"

env = process.env.NODE_ENV or "dev"

config =
  useless: "wtf"
  serverPort: 8080
  filesHome: "./public"
  viewsHome: "./public/views"
  componentsHome: "./public/components"

cwdPath = process.cwd()
configFile = path.resolve cwdPath, "jiggly.json"
if fs.existsSync configFile
  outerConfig = require configFile
  if envConfig = outerConfig[env]
    _.assign config, envConfig

config.filesHome = path.resolve cwdPath, config.filesHome
config.viewsHome = path.resolve cwdPath, config.viewsHome
config.componentsHome = path.resolve cwdPath, config.componentsHome

console.log "Config loaded:"
console.log config

module.exports = config