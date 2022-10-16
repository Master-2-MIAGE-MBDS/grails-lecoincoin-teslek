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
<body >
<div id="viewport">
    <!-- Sidebar -->
    <div id="sidebar">
        <header>
            <a href="/home/index">LeCoinCoin</a>
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
        <div class="displayAD">
            <sec:ifLoggedIn>
                <sec:ifAnyGranted roles="ROLE_USER, ROLE_ADMIN, ROLE_MODERATOR">
                    <div class = "card-wrapper">
                        <div class = "card">
                            <!-- card left -->
                            <div class = "product-imgs">
                                <div class="containerB">
                                    <div id="gallery" class="gallery">
                                        <!-- controllers -->
                                        <a class="gallery__controller gallery__controller--prev"></a>
                                        <a class="gallery__controller gallery__controller--next"></a>

                                        <div class="gallery__images" id ='imgs'>
                                            <!-- images -->
                                            <g:each in="${ad.getIllustrations()}" var = "i">
                                                <g:img dir="images" file="${i.getFilename()}" id ="${i.getId()}"></g:img>
                                            </g:each>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- card right -->
                            <div class = "product-content">
                                <h2 class = "product-title">${ad.getTitle()}</h2>
                                <div class = "product-price">
                                    <p class = "new-price">Price: <span>$${ad.getPrice()}</span></p>
                                </div>
                                <div class = "product-detail">
                                    <br>
                                    <br>
                                    <h4>About this ad: </h4>
                                    <p style = "font-size:15px  ">${ad.getDescription()}</p>
                                </div>

                            </div>
                        </div>
                    </div>
                </sec:ifAnyGranted>
            </sec:ifLoggedIn>
            <sec:ifNotLoggedIn>
            </sec:ifNotLoggedIn>
        </div>


    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tiny-slider/2.9.2/min/tiny-slider.js"></script>
</body>
<script>
    let first = document.getElementById('imgs').firstElementChild
    let last = document.getElementById('imgs').lastElementChild
    first.setAttribute('class', 'active')
    const galleryWrapper = document.getElementById('gallery'),
        galleryControllers = galleryWrapper.querySelectorAll('.gallery__controller')

    galleryControllers.forEach(controller => {
        controller.addEventListener('click', (event) => {
            if(controller.classList.contains('gallery__controller--prev'))
                galleryGoBack()
            else
                galleryGoForward()
        })
    })

    function galleryGoBack(){
        const active = galleryWrapper.querySelector('img.active')
        active.classList.remove('active')

        if(active.previousElementSibling)
            active.previousElementSibling.classList.add('active')
        else {
            if (active == first)
                last.setAttribute('class', 'active')
            else
                this.galleryWrapper.querySelector('img:last-child').classList.add('active')
        }
    }

    function galleryGoForward(){
        const active = galleryWrapper.querySelector('img.active')
        active.classList.remove('active')

        if(active.nextElementSibling)
            active.nextElementSibling.classList.add('active')
        else
        {
            if(active == last)
                first.setAttribute('class', 'active')
            else
                this.galleryWrapper.querySelector('img').classList.add('active')
        }

    }
</script>
<script>

</script>
</html>

