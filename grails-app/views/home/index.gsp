<!doctype html>
<html>
<head>
    <title>Lecoincoin</title>
    <asset:stylesheet src="index.css"/>
    <asset:stylesheet src="admin.css"/>

    <asset:javascript src="jquery-2.2.0.min.js"></asset:javascript>
</head>

<div class="wrapper">

    <sec:ifLoggedIn>
        <sec:ifAnyGranted roles="ROLE_USER">
            <div>
                <g:each in="${annoncesList}" var="c">
                    <p>${c.getAuthor().getUsername()} : ${c.getTitle()}</p>
                </g:each>
            </div>
        </sec:ifAnyGranted>
        <sec:ifAnyGranted roles="ROLE_ADMIN">
            <input id="panel-1-ctrl" class="panel-radios" type="radio" name="tab-radios" checked>
            <input id="panel-2-ctrl" class="panel-radios" type="radio" name="tab-radios">

            <header id="introduction">
            </header>

            <ul id="tabs-list">

                <label id="open-nav-label" for="nav-ctrl"> </label>
                <li id="li-for-panel-1">
                    <label class="panel-label" for="panel-1-ctrl">All Users</label>
                </li>
                <li id="li-for-panel-2">
                    <label class="panel-label" for="panel-2-ctrl">All Ads</label>
                </li>
            </ul>

            <article id="panels">
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
            </article>
        </sec:ifAnyGranted>
    </sec:ifLoggedIn>
    <sec:ifNotLoggedIn>

    </sec:ifNotLoggedIn>
</div>

</body>
</html>