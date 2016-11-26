// pull in desired CSS/SASS files
require( './styles/main.scss' );

// Elm.Main.embed( document.getElementById( 'main' ) );
var Elm = require( '../elm/Main' );
var app = Elm.Main.fullscreen();
// Elm injected in fb.js to avoid multiple instances 

require( './fb.js' );


app.ports.logout.subscribe(function () {

    window.FB.logout(function (response) {
        console.log('Logging out ' + response);
        // user is now logged out
    });
});

app.ports.login.subscribe(function () {

    window.FB.login(function (response) {
        if (response.authResponse) {
            console.log('Welcome!  Fetching your information.... ');
            window.FB.api('/me', function (response) {
                console.log('Good to see you, ' + response.name + '.');
                app.ports.statusChange.send("connected"); //response
            });
        } else {
            console.log('User cancelled login or did not fully authorize.');
        }
        // user is now logged out
    });
});