var app = Elm.Main.fullscreen();

window.fbAsyncInit = function () {

    FB.init({
        appId: '1758076804404057',
        status: true,
        xfbml: false,
        version: 'v2.7' // or v2.6, v2.5, v2.4, v2.3 
    });

    FB.getLoginStatus(function (response) {
        if (response.status === 'connected') {
            console.log('Logged in.');
            var uid = response.authResponse.userID;
            var accessToken = response.authResponse.accessToken;
        }
        else if (response.status === 'not_authorized') {
            console.log('Unauthorized');
        }
        else {
            console.log('Logged out');
            //FB.login();
        }

        app.ports.statusChange.send(response.status);

    }, true);

};

(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s);
    js.id = id; d;
    js.async = true;
    js.src = "//connect.facebook.net/es_LA/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
} (document, 'script', 'facebook-jssdk'));


app.ports.logout.subscribe(function () {

    FB.logout(function (response) {
        console.log('Logging out ' + response);
        app.ports.statusChange.send(response.status);
        // user is now logged out
    });
});

app.ports.login.subscribe(function () {

    FB.login(function (response) {
        if (response.authResponse) {
            console.log('Welcome!  Fetching your information.... ');
            FB.api('/me', function (response) {
                console.log('Good to see you, ' + response.name + '.');
                app.ports.statusChange.send("connected"); //response
            });
        } else {
            console.log('User cancelled login or did not fully authorize.');
        }
        // user is now logged out
    });
});
// app.ports.errors.send(response.status);