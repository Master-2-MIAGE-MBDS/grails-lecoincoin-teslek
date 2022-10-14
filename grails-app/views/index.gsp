<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <asset:stylesheet src="login.css"/>
    <title>Simple Responsive Admin</title>


</head>
<body>
<div class="center">
    <sec:ifNotLoggedIn>
        <h1>Login</h1>
        <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" autocomplete="off">
            <div class="txt_field">
                <input type="text" required name="${usernameParameter ?: 'username'}" id="username">
                <span></span>
                <label>Username</label>
            </div>
            <div class="txt_field" >
                <input type="password" required name="${passwordParameter ?: 'password'}" id="password">
                <span></span>
                <label>Password</label>
            </div>
            <div class="pass">Forgot Password?</div>
            <input type="submit" value="Login">
            <div class="signup_link">
                Not a member? <a href="#">Signup</a>
            </div>
        </form>
    </sec:ifNotLoggedIn>
    <input type="hidden" id="refreshed" value="no">
    <sec:ifLoggedIn>
            <g:javascript>
                onload=function(){
                    var e=document.getElementById("refreshed");
                    if(e.value=="no")e.value="yes";
                    else{e.value="no";location.reload();}
                }
            </g:javascript>
            <g:javascript>window.location.replace("/home");</g:javascript>
    </sec:ifLoggedIn>

</div>

</body>

</html>
