'use strict';

require('./index.html');
require('./src/Style/Stylesheets.elm')

var Elm = require('./src/Main.elm');
Elm.Main.embed(document.getElementById('main'));