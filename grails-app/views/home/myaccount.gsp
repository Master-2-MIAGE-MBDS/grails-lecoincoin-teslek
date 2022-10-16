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
                <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MODO">
                    <a>
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
                <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MODO">
                    <a onclick="myFunction()" >
                        <i  class="zmdi zmdi-widgets" ></i>
                        All Users
                    </a>
                </sec:ifAnyGranted>

            </li>

            <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MODO">
                <li>
                    <a onclick="myFunction1()" >
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
                <sec:ifAnyGranted roles="ROLE_USER">
                    <section id = "panel-user-1">
                        <button id = "add-btn" onclick = "displayHideForm()">Add Ad</button>
                        <div id="addform">
                            <g:uploadForm controller = "api" action = "annonces" method = "POST" enctype="multipart/form-data">
                                <span>

                                    <label for="title">Title</label>
                                    <input type="text" id="title" name="title" placeholder="Title...">
                                    <label for="price">Price</label>
                                    <br>
                                    <input type="number" id="price" name="price" placeholder="Price...">
                                    <br><br>
                                    <label for="description">Description</label>
                                    <textarea id="description" name="description" placeholder="Write something.." style="height:70px"></textarea>
                                    <br>
                                    <label for="illustration">Illustrations</label>
                                    <input type="file" id="illustration" name="illustration"  multiple accept="image/*">
                                    <br>
                                    <input type="submit" id="refresh" value="ADD">
                                </span>
                            </g:uploadForm>
                        </div>
                        <div class="container" id="userAds">
                            <g:each in="${currentUser.getAnnonces()}" var="c">
                                <div class="col-xs-12 col-md-6">
                                    <div class="prod-info-main prod-wrap clearfix">
                                        <div class="row">
                                            <div class="col-md-5 col-sm-12 col-xs-12">
                                                <div class="product-image">
                                                    <div class="swiper">
                                                        <!-- Additional required wrapper -->
                                                        <div class="swiper-wrapper">
                                                            <!-- Slides -->
                                                        <g:each in="${c.getIllustrations()}" var = "i">
                                                            <div class="swiper-slide"><g:img dir="images" file="${i.getFilename()}" class="illus"></g:img></div>
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
                                                        <a href = "/home/ad/${c.getId()}" id="aId${c.getId()}">${c.getTitle()}
                                                        </a>
                                                        <br>
                                                        <a>
                                                            <span>Tag</span>
                                                        </a>

                                                    </h5>
                                                    <p class="price-container">
                                                        <span id="priceId${c.getId()}">${c.getPrice()}</span>
                                                    </p>
                                                    <span class="tag1"></span>
                                                </div>
                                                <div class="description">
                                                    <p id = "descId${c.getId()}" >${c.getDescription()}</p>
                                                </div>
                                                <div class = "adButtons">
                                                    <button class="buttonED" id="buttonEdit" value="${c.getId()}">Edit</button>
                                                    <button class="buttonED" id="buttonDelete" value="${c.getId()}" >Delete</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </g:each>
                        </div>
                        <div class="editContainer" id = 'editAd' style = "display: none">
                            <div id="editform" style = "width: 100%;margin-left: 5px">
                                    <span id="editSpan">
                                        <input type="text" id="editId" name="id" style = "display: none">
                                        <label for="editTitle">Title</label>
                                        <input type="text" id="editTitle" name="title" placeholder="">
                                        <label for="editPrice">Price</label>
                                        <br>
                                        <input type="number" id="editPrice" name="price" placeholder="">
                                        <br><br>
                                        <label for="editDescription">Description</label>
                                        <textarea id="editDescription" name="description" placeholder="" style="height:70px"></textarea>
                                        <br>
                                        <div class="row" id="editIllus">

                                        </div>
                                        <br>
                                        <br>
                                        <button type="submit" id = 'submitEditForm' onclick = 'patchAd()'>EDIT</button>
                                    </span>
                                <br>
                                <button id="buttonCancel" class="buttonED" style = "background-color: orangered;color: white;font-size: 1rem;" >Cancel</button>
                            </div>

                        </div>
                    </section>
                </sec:ifAnyGranted>
            </sec:ifLoggedIn>
            <sec:ifNotLoggedIn>
            </sec:ifNotLoggedIn>
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
<script>
    function displayHideForm() {
        var form = document.getElementById('addform'),
            style = window.getComputedStyle(form),
            display = style.getPropertyValue('display');
        if(display === "none"){
            form.style.display = "block";
            document.getElementById('add-btn').style.background = '#a9a9a9'
        }
        else {
            form.style.display = "none";
            document.getElementById('add-btn').style.background = '#37474f'
        }
    }
    function displayHideAddButton(){
        var btn = document.getElementById('add-btn'),
            style = window.getComputedStyle(btn),
            display = style.getPropertyValue('display');
        if(display === "none"){
            btn.style.display = "block";
            document.getElementById('add-btn').style.background = '#a9a9a9'
        }
        else {
            btn.style.display = "none";
            document.getElementById('add-btn').style.background = '#37474f'
        }
    }
</script>

<script>
    let origin = location.origin;
    let imgs= []
    let fns = []
    let adId = -1
    function callback(responseText){
        var save = responseText;
        return save;
    }
    function newdiv(adId) {

        var url = origin + "/api/illustrations";
        var xhr = new XMLHttpRequest();

        xhr.open("GET", url+"/"+adId,true);
        //xhr.responseType = 'json';
        xhr.send(null);
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                imgs = xhr.response
                imgs = imgs.substring(1);
                imgs = imgs.substring(0, imgs.length - 1);
                var imgsList = imgs.split(', ')
                for (var j = 0; j < imgsList.length; j++) {
                    imgsList[j] = imgsList[j].substring(1);
                    imgsList[j] = imgsList[j].substring(0, imgsList[j].length - 1);
                }

                var div = document.getElementById('editIllus')
                for (var i = 0; i < imgsList.length; i++) {
                    div.innerHTML += '<span id="'+imgsList[i]+'"><img src="/assets/'+imgsList[i]+'" class="illus" /><button type="button"  class="buttonDeleteIlluC" id="buttonDeleteIlluI" value="'+imgsList[i]+'" onclick ="illus(\''+imgsList[i]+'\')">X</button></span>'
                    fns.push(imgsList[i])
                }
            }
        };


    }

    //DANGER PAS PARAMETRE DANS URL
    $(document).on('click', '#buttonDelete', function (event) {
        var adId = $(this).val();

        var url = origin + "/api/annonce";
        var xhr = new XMLHttpRequest();
        xhr.open("DELETE", url+"/"+adId, true);
        xhr.send(null);
        fns = []
        window.location.reload()
    });
    $(document).on('click', '#buttonEdit', function (event) {
        adId = $(this).val();
        displayHideAddButton()
        newdiv(adId)
        document.getElementById('editTitle').setAttribute('placeholder',document.getElementById('aId'+adId).textContent)
        document.getElementById('editPrice').setAttribute('placeholder',document.getElementById('priceId'+adId).textContent)
        document.getElementById('editDescription').setAttribute('placeholder',document.getElementById('descId'+adId).textContent)
        document.getElementById('editId').value = adId
        //document.getElementById('editSpan').parentElement.setAttribute('id',"submitEditForm")
        document.getElementById('editAd').style.display = "block";
        document.getElementById('userAds').style.display = "none";
    });
    $(document).on('click', '#buttonCancel', function (event) {
        document.getElementById('editAd').style.display = "none";
        document.getElementById('userAds').style.display = "block";
        fns = []
        adId = -1
        window.location.reload()

    });
    function patchAd(){
        var titleV = document.getElementById('editTitle').value;
        var priceV = document.getElementById('editPrice').value;
        var descriptionV = document.getElementById('editDescription').value;
        console.log(fns)
        const data = {
            id: adId,
            title: titleV,
            price : priceV,
            description : descriptionV,
            illustrations : fns
        };

        if(titleV == '' || priceV == '' || descriptionV == '')
        {
            var url = origin + "/api/annonce";
            var xhr = new XMLHttpRequest();
            const searchParams = new URLSearchParams(data);

            xhr.open("PATCH", url, true);
            xhr.send(searchParams);

        }
        else {
            var url = origin + "/api/annonce";
            var xhr = new XMLHttpRequest();
            const searchParams = new URLSearchParams(data);

            xhr.open("PUT", url, true);
            xhr.send(searchParams);

        }
        setTimeout(function(){
            window.location.reload();
        }, 500);
    }
    function illus(fn){
        const index = fns.indexOf(fn);
        if (index > -1) {
            fns.splice(index, 1);
        }
        console.log(document.getElementById(fn))
        document.getElementById(fn).remove()

    }

</script>



</html>