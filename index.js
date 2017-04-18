'use strict';

require('./index.html');
require('./src/Stylesheets.elm')

var Elm = require('./src/Main.elm');
Elm.Main.embed(document.getElementById('main'));