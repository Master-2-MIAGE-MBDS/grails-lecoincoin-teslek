<!doctype html>
<html>
<head>
    <title>Lecoincoin</title>
    <asset:stylesheet src="index.css"/>
    <asset:stylesheet src="admin.css"/>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<div id="viewport">
    <!-- Sidebar -->
    <div id="sidebar">
        <header>
            <a href="#">LeCoinCoin</a>
        </header>
        <ul class="nav">
            <li>
                <a href="#">
                    <i class="zmdi zmdi-view-dashboard"></i> Dashboard
                </a>
            </li>
            <li>
                <a href="#">
                    <i class="zmdi zmdi-widgets" ></i>
                    <button onclick="myFunction()">AllUsers</button>


                </a>
            </li>
            <li>
                <a href="#">
                    <i class="zmdi zmdi-calendar"></i>
                    <button onclick="myFunction1()">AllAds</button>
                </a>
            </li>
        </ul>
    </div>
    <!-- Content -->
    <div id="content">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="#"><i class="zmdi zmdi-notifications text-danger"></i>
                        </a>
                    </li>
                    <li><a href="#">Test User</a></li>
                </ul>
            </div>
        </nav>
        <div class="container-fluid">
            <p>YEDEEEEK</p>
            <sec:ifLoggedIn>
                <sec:ifAnyGranted roles="ROLE_USER">

                </sec:ifAnyGranted>
                <sec:ifAnyGranted roles="ROLE_ADMIN">
                    <div class="container">
                        <section id="panel-1">
                            <main>
                                <g:each in="${usersList}" var="c">
                                    <p >${c.getUsername()} </p>
                                </g:each>

                            </main>
                        </section>
                        <section id="panel-2">
                            <main>
                                <div class="flex-container">
                                    <g:each in="${annoncesList}" var="c">

                                        <p >${c.getAuthor().getUsername()} : ${c.getTitle()}</p>

                                    </g:each>
                                </div>
                            </main>
                        </section>
                    </div>
                </sec:ifAnyGranted>
            </sec:ifLoggedIn>
            <sec:ifNotLoggedIn>
            </sec:ifNotLoggedIn>
        </div>


        </div>
    </div>
</div>


</body>
<script>
    function myFunction() {
        document.getElementById("panel-2").style.display= "none";
        document.getElementById("panel-1").style.display= "block";
    }
    function myFunction1() {
        document.getElementById("panel-2").style.display = "block";
        document.getElementById("panel-1").style.display= "none";
    }
</script>
</html>