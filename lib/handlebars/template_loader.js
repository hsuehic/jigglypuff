// Generated by CoffeeScript 1.6.3
(function() {
  var FileNotFoundError, blankTemplate, fs, handlebars, utils;

  fs = require("fs");

  handlebars = require("handlebars");

  utils = require("../utils");

  FileNotFoundError = require("../errors").FileNotFoundError;

  blankTemplate = handlebars.compile("");

  module.exports = {
    fromPathSync: function(path) {
      var template;
      if (!fs.existsSync(path)) {
        throw new FileNotFoundError(path);
      }
      template = fs.readFileSync(path, {
        encoding: "utf-8"
      });
      return handlebars.compile(template);
    },
    fromText: function(text) {
      return handlebars.compile(text);
    }
  };

}).call(this);
