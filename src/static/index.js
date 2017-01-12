// pull in desired CSS/SASS files
require( './styles/main.scss' );

// Elm.Main.embed( document.getElementById( 'main' ) );
var Elm = require( '../elm/Main' );
var app = Elm.Main.fullscreen();
// Elm injected in fb.js to avoid multiple instances 

