<!doctype html>
<html>
<head>
    <title>Lecoincoin</title>
    <asset:stylesheet src="index.css"/>
    <asset:stylesheet src="admin.css"/>
    <asset:javascript src="jquery-2.2.0.min.js"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
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
                <sec:ifAnyGranted roles="ROLE_USER">
                    <a href="/home/index">
                        <i class="zmdi zmdi-view-dashboard"></i>
                        Home
                    </a>
                </sec:ifAnyGranted>
                <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MODERATOR">
                    <a href="/home/index">
                        <i class="zmdi zmdi-view-dashboard"></i>
                        Dashboard
                    </a>
                </sec:ifAnyGranted>
            </li>
            <li>
                <sec:ifAnyGranted roles="ROLE_USER">
                    <a href = "/home/myaccount">
                        <i  class="zmdi zmdi-widgets" ></i>
                            My Account
                    </a>
                </sec:ifAnyGranted>
                <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MODERATOR">
                    <a href="/home/AllUsers" >
                        <i  class="zmdi zmdi-widgets" ></i>
                            All Users
                    </a>
                </sec:ifAnyGranted>

            </li>

            <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MODERATOR">
                <li>
                    <a href="/home/AllAds" >
                        <i class="zmdi zmdi-calendar"></i>
                        All Ads
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
                        <a><i class="zmdi zmdi-notifications text-danger"></i>
                        </a>
                    </li>
                    <li><a href="/logout/index">LOGOUT</a></li>
                </ul>
            </div>
        </nav>
        <div class="container-fluid" >
            <sec:ifLoggedIn>
                <sec:ifAnyGranted roles="ROLE_USER, ROLE_ADMIN, ROLE_MODERATOR">
                    <section id = "panel-user-2">
                        <div class="container">
                            <g:each in="${annoncesList}" var="c">
                                <div class="col-xs-12 col-md-6">
                                    <!-- First product box start here-->
                                    <div class="prod-info-main prod-wrap clearfix">
                                        <div class="row">
                                            <div class="col-md-5 col-sm-12 col-xs-12">
                                                <div class="product-image">
                                                    <div class="swiper">
                                                        <!-- Additional required wrapper -->
                                                        <div class="swiper-wrapper">
                                                            <!-- Slides -->
                                                        <g:each in="${c.getIllustrations()}" var = "i">
                                                            <div class="swiper-slide"><g:img dir="images" file="${i.getFilename()}" class="illus"/></div>
                                                        </g:each>

                                                        </div>
                                                        <!-- If we need pagination -->
                                                        <div class="swiper-pagination"></div>

                                                        <!-- If we need navigation buttons -->
                                                        <div class="swiper-button-prev"></div>
                                                        <div class="swiper-button-next"></div>


                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-7 col-sm-12 col-xs-12">
                                                <div class="product-deatil">
                                                    <h5 class="name">
                                                        <a>
                                                            ${c.getTitle()}
                                                        </a>
                                                        <a>
                                                            <span>Tag</span>
                                                        </a>

                                                    </h5>
                                                    <p class="price-container">
                                                        <span>${c.getPrice()}</span>
                                                    </p>
                                                    <span class="tag1"></span>
                                                </div>
                                                <div class="description">
                                                    <p>${c.getDescription()}</p>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <!-- end product -->
                                </div>
                            </g:each>
                        </div>
                    </section>
                </sec:ifAnyGranted>
            </sec:ifLoggedIn>
            <sec:ifNotLoggedIn>
            </sec:ifNotLoggedIn>
        </div>


        </div>
    </div>
</div>

</div>
</body>

<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
<script>
    const swiper = new Swiper('.swiper', {
        loop: true,
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        },
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        }
    });

</script>
</html>