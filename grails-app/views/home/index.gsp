<!doctype html>
<html>
<head>
    <title>Lecoincoin</title>
    <asset:stylesheet src="index.css"/>
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
                    <i class="zmdi zmdi-view-dashboard"></i>
                    <sec:ifAnyGranted roles="ROLE_USER">
                        Home
                    </sec:ifAnyGranted>
                    <sec:ifAnyGranted roles="ROLE_ADMIN">
                        Dashboard
                    </sec:ifAnyGranted>

                </a>
            </li>
            <sec:ifAnyGranted roles="ROLE_ADMIN">
                <li>
                    <a href="#">
                        <i class="zmdi zmdi-widgets"></i>
                        All Users
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="zmdi zmdi-calendar"></i>
                        All Ads
                    </a>
                </li>
            </sec:ifAnyGranted>
            <sec:ifAnyGranted roles="ROLE_USER">
                <li>
                    <a href="#">
                        <i class="zmdi zmdi-widgets"></i>
                        My Account
                    </a>
                </li>

            </sec:ifAnyGranted>

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
                    <li>
                        <a href="/logout/index">LOGOUT</a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="container-fluid">
            <sec:ifLoggedIn>
                <sec:ifAnyGranted roles="ROLE_USER">
                </sec:ifAnyGranted>
                <sec:ifAnyGranted roles="ROLE_ADMIN">
                </sec:ifAnyGranted>
            </sec:ifLoggedIn>
            <sec:ifNotLoggedIn>
            </sec:ifNotLoggedIn>
        </div>
    </div>
</div>

</div>

</body>
</html>