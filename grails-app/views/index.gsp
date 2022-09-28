<%@ page import="com.mbds.grails.AnnonceController; com.mbds.grails.UserController" %>
<!doctype html>
<html>
<head>
    <title>Lecoincoin</title>
    <asset:stylesheet src="index.css"/>
    <asset:javascript src="index.js"/>
</head>
<body>
<sec:ifLoggedIn>
    <div>
    </div>
</sec:ifLoggedIn>
<sec:ifNotLoggedIn>
<section class="forms-section">

    <div class="forms">
        <div class="form-wrapper is-active">
            <button type="button" class="switcher switcher-login">
                Login
                <span class="underline"></span>
            </button>
            <form class="form form-login" action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" autocomplete="off">
                <fieldset>
                    <legend>Please, enter your email and password for login.</legend>
                    <div class="input-block">
                        <label for="username">E-mail</label>
                        <input type="text" required name="${usernameParameter ?: 'username'}" id="username">
                    </div>
                    <div class="input-block">
                        <label for="password">Password</label>
                        <input type="password" required name="${passwordParameter ?: 'password'}" id="password">
                    </div>
                </fieldset>
                <input type="submit" class="btn-login" value="${message(code: 'springSecurity.login.button')}"/>

            </form>
        </div>
        <div class="form-wrapper">
            <button type="button" class="switcher switcher-signup">
                Sign Up
                <span class="underline"></span>
            </button>
            <form class="form form-signup">
                <fieldset>
                    <legend>Please, enter your email, password and password confirmation for sign up.</legend>
                    <div class="input-block">
                        <label for="signup-email">E-mail</label>
                        <input id="signup-email" type="email" required>
                    </div>
                    <div class="input-block">
                        <label for="signup-password">Password</label>
                        <input id="signup-password" type="password" required>
                    </div>
                    <div class="input-block">
                        <label for="signup-password-confirm">Confirm password</label>
                        <input id="signup-password-confirm" type="password" required>
                    </div>
                </fieldset>
                <button type="submit" class="btn-signup">Continue</button>
            </form>
        </div>
    </div>
</sec:ifNotLoggedIn>
</section>
</body>
</html>