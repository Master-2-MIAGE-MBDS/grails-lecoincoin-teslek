<!doctype html>
<html>
<head>
    <title>Lecoincoin</title>
    <asset:stylesheet src="index.css"/>
    <asset:javascript src="index.js"/>
</head>
<body>
%{--    <content tag="nav">--}%
%{--        <li class="dropdown">--}%
%{--            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Application Status <span class="caret"></span></a>--}%
%{--            <ul class="dropdown-menu">--}%
%{--                <li><a href="#">Environment: ${grails.util.Environment.current.name}</a></li>--}%
%{--                <li><a href="#">App profile: ${grailsApplication.config.grails?.profile}</a></li>--}%
%{--                <li><a href="#">App version:--}%
%{--                    <g:meta name="info.app.version"/></a>--}%
%{--                </li>--}%
%{--                <li role="separator" class="divider"></li>--}%
%{--                <li><a href="#">Grails version:--}%
%{--                    <g:meta name="info.app.grailsVersion"/></a>--}%
%{--                </li>--}%
%{--                <li><a href="#">Groovy version: ${GroovySystem.getVersion()}</a></li>--}%
%{--                <li><a href="#">JVM version: ${System.getProperty('java.version')}</a></li>--}%
%{--                <li role="separator" class="divider"></li>--}%
%{--                <li><a href="#">Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</a></li>--}%
%{--            </ul>--}%
%{--        </li>--}%
%{--        <li class="dropdown">--}%
%{--            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Artefacts <span class="caret"></span></a>--}%
%{--            <ul class="dropdown-menu">--}%
%{--                <li><a href="#">Controllers: ${grailsApplication.controllerClasses.size()}</a></li>--}%
%{--                <li><a href="#">Domains: ${grailsApplication.domainClasses.size()}</a></li>--}%
%{--                <li><a href="#">Services: ${grailsApplication.serviceClasses.size()}</a></li>--}%
%{--                <li><a href="#">Tag Libraries: ${grailsApplication.tagLibClasses.size()}</a></li>--}%
%{--            </ul>--}%
%{--        </li>--}%
%{--        <li class="dropdown">--}%
%{--            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Installed Plugins <span class="caret"></span></a>--}%
%{--            <ul class="dropdown-menu">--}%
%{--                <g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">--}%
%{--                    <li><a href="#">${plugin.name} - ${plugin.version}</a></li>--}%
%{--                </g:each>--}%
%{--            </ul>--}%
%{--        </li>--}%
%{--    </content>--}%

%{--    <div class="svg" role="presentation">--}%
%{--        <div class="grails-logo-container">--}%
%{--            <asset:image src="grails-cupsonly-logo-white.svg" class="grails-logo"/>--}%
%{--        </div>--}%
%{--    </div>--}%

%{--    <div id="content" role="main">--}%
%{--        <section class="row colset-2-its">--}%
%{--            <h1>Welcome to Grails</h1>--}%

%{--            <p>--}%
%{--                Congratulations, you have successfully started your first Grails application! At the moment--}%
%{--                this is the default page, feel free to modify it to either redirect to a controller or display--}%
%{--                whatever content you may choose. Below is a list of controllers that are currently deployed in--}%
%{--                this application, click on each to execute its default action:--}%
%{--            </p>--}%

%{--            <div id="controllers" role="navigation">--}%
%{--                <h2>Available Controllers:</h2>--}%
%{--                <ul>--}%
%{--                    <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">--}%
%{--                        <li class="controller">--}%
%{--                            <g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link>--}%
%{--                        </li>--}%
%{--                    </g:each>--}%
%{--                </ul>--}%
%{--            </div>--}%
%{--        </section>--}%
%{--    </div>--}%

<div class="container" id="container">
    <div class="form-container sign-up-container">
        <form action="#">
            <h1>Create Account</h1>
            <div class="social-container">
                <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
            </div>
            <span>or use your email for registration</span>
            <input type="text" placeholder="Name" />
            <input type="email" placeholder="Email" />
            <input type="password" placeholder="Password" />
            <button>Sign Up</button>
        </form>
    </div>
    <div class="form-container sign-in-container">
        <form action="/login/authenticate" method="POST" id="loginForm" class="cssform" autocomplete="off">
            <h1>Sign in</h1>
            <span>or use your account</span>
            <input type="text" placeholder="Email" />
            <input type="password" placeholder="Password" />
%{--            <a href="#">Forgot your password?</a>--}%
            <input type="submit" id="submit" value="Connexion">
        </>
    </div>
    <div class="overlay-container">
        <div class="overlay">
            <div class="overlay-panel overlay-left">
                <h1>Welcome Back!</h1>
                <p>To keep connected with us please login with your personal info</p>
                <button class="ghost" id="signIn">Sign In</button>
            </div>
            <div class="overlay-panel overlay-right">
                <h1>Hello, Friend!</h1>
                <p>Enter your personal details and start journey with us</p>
                <button class="ghost" id="signUp">Sign Up</button>
            </div>
        </div>
    </div>
    <script>
        (function() {
            document.forms['loginForm'].elements['username'].focus();
        })();
    </script>
</div>


</body>
</html>

%{--<html lang="en" class="no-js"><head>--}%
%{--    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--}%
%{--    <meta http-equiv="X-UA-Compatible" content="IE=edge">--}%
%{--    <title>--}%
%{--    Login--}%
%{--    </title>--}%
%{--    <meta name="viewport" content="width=device-width, initial-scale=1">--}%
%{--    <link rel="icon" type="image/x-ico" href="/assets/favicon.ico">--}%

%{--    <link rel="stylesheet" href="/assets/bootstrap.css?compile=false">--}%
%{--    <link rel="stylesheet" href="/assets/grails.css?compile=false">--}%
%{--    <link rel="stylesheet" href="/assets/main.css?compile=false">--}%
%{--    <link rel="stylesheet" href="/assets/mobile.css?compile=false">--}%
%{--    <link rel="stylesheet" href="/assets/application.css?compile=false">--}%



%{--    <meta name="layout" content="main">--}%

%{--    <style type="text/css" media="screen">--}%
%{--    #login {--}%
%{--        margin: 15px 0px;--}%
%{--        padding: 0px;--}%
%{--        text-align: center;--}%
%{--    }--}%

%{--    #login .inner {--}%
%{--        width: 340px;--}%
%{--        padding-bottom: 6px;--}%
%{--        margin: 60px auto;--}%
%{--        text-align: left;--}%
%{--        border: 1px solid #aab;--}%
%{--        background-color: #f0f0fa;--}%
%{--        -moz-box-shadow: 2px 2px 2px #eee;--}%
%{--        -webkit-box-shadow: 2px 2px 2px #eee;--}%
%{--        -khtml-box-shadow: 2px 2px 2px #eee;--}%
%{--        box-shadow: 2px 2px 2px #eee;--}%
%{--    }--}%

%{--    #login .inner .fheader {--}%
%{--        padding: 18px 26px 14px 26px;--}%
%{--        background-color: #f7f7ff;--}%
%{--        margin: 0px 0 14px 0;--}%
%{--        color: #2e3741;--}%
%{--        font-size: 18px;--}%
%{--        font-weight: bold;--}%
%{--    }--}%

%{--    #login .inner .cssform p {--}%
%{--        clear: left;--}%
%{--        margin: 0;--}%
%{--        padding: 4px 0 3px 0;--}%
%{--        padding-left: 105px;--}%
%{--        margin-bottom: 20px;--}%
%{--        height: 1%;--}%
%{--    }--}%

%{--    #login .inner .cssform input[type="text"] {--}%
%{--        width: 120px;--}%
%{--    }--}%

%{--    #login .inner .cssform label {--}%
%{--        font-weight: bold;--}%
%{--        float: left;--}%
%{--        text-align: right;--}%
%{--        margin-left: -105px;--}%
%{--        width: 110px;--}%
%{--        padding-top: 3px;--}%
%{--        padding-right: 10px;--}%
%{--    }--}%

%{--    #login #remember_me_holder {--}%
%{--        padding-left: 120px;--}%
%{--    }--}%

%{--    #login #submit {--}%
%{--        margin-left: 15px;--}%
%{--    }--}%

%{--    #login #remember_me_holder label {--}%
%{--        float: none;--}%
%{--        margin-left: 0;--}%
%{--        text-align: left;--}%
%{--        width: 200px--}%
%{--    }--}%

%{--    #login .inner .login_message {--}%
%{--        padding: 6px 25px 20px 25px;--}%
%{--        color: #c33;--}%
%{--    }--}%

%{--    #login .inner .text_ {--}%
%{--        width: 120px;--}%
%{--    }--}%

%{--    #login .inner .chk {--}%
%{--        height: 12px;--}%
%{--    }--}%
%{--    </style>--}%

%{--</head>--}%
%{--<body>--}%

%{--<div class="navbar navbar-default navbar-static-top" role="navigation">--}%
%{--    <div class="container">--}%
%{--        <div class="navbar-header">--}%
%{--            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">--}%
%{--                <span class="sr-only">Toggle navigation</span>--}%
%{--                <span class="icon-bar"></span>--}%
%{--                <span class="icon-bar"></span>--}%
%{--                <span class="icon-bar"></span>--}%
%{--            </button>--}%
%{--            <a class="navbar-brand" href="/#">--}%
%{--                <img src="/assets/grails.svg" alt="Grails Logo">--}%
%{--            </a>--}%
%{--        </div>--}%
%{--        <div class="navbar-collapse collapse" aria-expanded="false" style="height: 0.8px;">--}%
%{--            <ul class="nav navbar-nav navbar-right">--}%

%{--            </ul>--}%
%{--        </div>--}%
%{--    </div>--}%
%{--</div>--}%


%{--<div id="login">--}%
%{--    <div class="inner">--}%
%{--        <div class="fheader">Connectez-vous à l'aide de vos identifiants</div>--}%



%{--        <form action="/login/authenticate" method="POST" id="loginForm" class="cssform" autocomplete="off">--}%
%{--            <p>--}%
%{--                <label for="username">Nom d'utilisateur:</label>--}%
%{--                <input type="text" class="text_" name="username" id="username">--}%
%{--            </p>--}%

%{--            <p>--}%
%{--                <label for="password">Mot de passe:</label>--}%
%{--                <input type="password" class="text_" name="password" id="password">--}%
%{--            </p>--}%

%{--            <p id="remember_me_holder">--}%
%{--                <input type="checkbox" class="chk" name="remember-me" id="remember_me">--}%
%{--                <label for="remember_me">Rester connecté</label>--}%
%{--            </p>--}%

%{--            <p>--}%
%{--                <input type="submit" id="submit" value="Connexion">--}%
%{--            </p>--}%
%{--        </form>--}%
%{--    </div>--}%
%{--</div>--}%
%{--<script>--}%
%{--    (function() {--}%
%{--        document.forms['loginForm'].elements['username'].focus();--}%
%{--    })();--}%
%{--</script>--}%


%{--<div class="footer" role="contentinfo"></div>--}%

%{--<div id="spinner" class="spinner" style="display:none;">--}%
%{--    Loading…--}%
%{--</div>--}%

%{--<script type="text/javascript" src="/assets/jquery-2.2.0.min.js?compile=false"></script>--}%
%{--<script type="text/javascript" src="/assets/bootstrap.js?compile=false"></script>--}%
%{--<script type="text/javascript" src="/assets/application.js?compile=false"></script>--}%




%{--</body>--}%
%{--</html>--}%