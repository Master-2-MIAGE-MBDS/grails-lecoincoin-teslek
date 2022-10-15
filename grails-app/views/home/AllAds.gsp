<!doctype html>
<html>
<head>
    <title>Lecoincoin</title>
<asset:stylesheet src="index.css"/>
<asset:stylesheet src="admin.css"/>
<asset:javascript src="Usertab.js"/>
<asset:javascript src="jquery-2.2.0.min.js"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
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
                <a href="/home/index">
                    <i class="zmdi zmdi-view-dashboard"></i> Dashboard
                </a>
            </li>
            <li>
                <a href="/home/AllUsers">
                    <i class="zmdi zmdi-widgets" ></i>
                    AllUsers
                </a>
            </li>
            <li>
                <a  href="/home/AllAds">
                    <i class="zmdi zmdi-calendar"></i>
                    AllAds
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
                    <li><a href="/logout">Logout</a></li>
                </ul>
            </div>
        </nav>
                     <main class="flex-container">


                            </main>
                        </section>
                        <section id="panel-2">
    <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MODERATOR">
                            <div class="container" id="Ads">
                                <main id="table1">
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th></th>
                                            <th>ID</th>
                                            <th></th>
                                            <th>Author</th>
                                            <th></th>
                                            <th>Title</th>
                                            <th></th>
                                            <th>Description</th>
                                            <th></th>
                                            <th>Price</th>
                                            <th></th>
                                            <th>Illustrations</th>

                                        </tr>
                                        </thead>
                                        <tbody>
                                        <sec:ifAnyGranted roles="ROLE_ADMIN">
                                          <g:uploadForm controller = "api" action = "annonces" enctype="multipart/form-data">
                                            <tr class="first-tr">
                                                <td class="title-td"><span>Add New</span></td>
                                                <td></td>
                                                <td></td>
                                                <td class="static"><input type="text" class="form-control" name="author"></td>
                                                <td></td>
                                                <td class="static"><input type="text" class="form-control" name="title"></td>
                                                <td></td>
                                                <td class="static"><input type="text" class="form-control" name="description"></td>
                                                <td></td>
                                                <td class="static"><input type="text" class="form-control" name="price"></td>
                                                <td></td>
                                                <td><input type="file" id="illustration" name="illustration"  multiple accept="image/*"></td>
                                                <td></td>
                                                <td class="static"><button type="submit" class="button green"><i class="glyphicon glyphicon-ok"></i></button></td>
                                            </tr>
                                          </g:uploadForm>
                                            </sec:ifAnyGranted>
                                        <g:each in="${annoncesList}" var="a">
                                            <tr>
                                                <td></td>
                                                <td><a href = "/home/ad/${a.getId()}">${a.getId() }</a></td>
                                                <td></td>
                                                <td id="auteur${a.getId()}"><a href = "/home/ad/${a.getId()}">${a.getAuthor().getUsername()}</a></td>
                                                <td></td>
                                                <td id="titre${a.getId()}"><a href = "/home/ad/${a.getId()}">${a.getTitle()}</a></td>
                                                <td></td>
                                                <td id="desc${a.getId()}">${a.getDescription()}</td>
                                                <td></td>
                                                <td id="prix${a.getId()}">${a.getPrice()}</td>
                                                <td></td>
                                                <td>
                                                    <div class="grid-container">
                                                        <g:each in="${a.getIllustrations()}" var = "i">
                                                            <g:img dir="images" file="${i.getFilename()}" class="illusAdmin"></g:img>
                                                        </g:each>
                                                    </div>
                                                </td>
                                                <td></td>
                                                <td class="static"><button class="button grey" id="buttonEdit" value="${a.getId()}"><i class="glyphicon glyphicon-pencil"></i></button>
                                            <sec:ifAnyGranted roles="ROLE_ADMIN"> <button type="submit" class="button red" id="Delete_annonce" value="${a.getId()}"  ><i class="glyphicon glyphicon-remove"></i></button></sec:ifAnyGranted></td>
                                            </tr>
                                        </g:each>

                                        </tbody>
                                    </table>
                                    <div class="alert">
                                        <h2>Error !</h2>
                                        <p>Please fill in all fields and resubmit the form.</p>
                                        <span class="button remove"><i class="glyphicon glyphicon-remove"></i></span>
                                    </div>
                                </main>
                            </div>


        </section>
        <div class="editContainer" id = 'editAd' style = "display: none">
            <div id="editform" style ="margin-left: 10px">
                <g:uploadForm controller = "api" action = "annonces" enctype="multipart/form-data">
                    <span>
                        <label for="editAuthor">Auteur</label>
                        <input type="text" id="editAuthor" name="title" placeholder="">
                        <br>
                        <label for="editTitle">Title</label>
                        <input type="text" id="editTitle" name="title" placeholder="">
                        <label for="editPrice">Price</label>
                        <br>
                        <input type="number" id="editPrice" name="price" placeholder="">
                        <br><br>
                        <label for="editDescription">Description</label>
                        <textarea id="editDescription" name="description" placeholder="" style="height:70px"></textarea>
                        <br>
                        <div class="row" id="">

                        </div>
                        <label for="editIllustration">Illustrations</label>
                        <input type="file" id="editIllustration" name="illustration"  multiple accept="image/*">
                        <br>
                        <input type="submit" value="EDIT">
                    </span>
                </g:uploadForm>
                <br>
                <button id="buttonCancel" class="buttonED" style = "background-color: orangered;color: white;font-size: 1rem;" onclick="cancel();">Cancel</button>
            </div>

        </div>
    </div>
                </sec:ifAnyGranted>
%{--            </sec:ifLoggedIn>--}%
%{--            <sec:ifNotLoggedIn>--}%
%{--            </sec:ifNotLoggedIn>--}%
        </div>


    </div>
</div>
</div>




</body>


<script type="text/javascript">
    $(document).on('click', '#Delete_annonce', function () {
        var adId = $(this).val();
        var xhttp = new XMLHttpRequest();
        xhttp.open("DELETE", "http://localhost:8081/api/annonce/" + adId, true);
        xhttp.send();
        setTimeout(function(){
            window.location.reload();
        }, 700);
    });
    $(document).on('click', '#buttonEdit', function (event) {
        var adId = $(this).val();

        document.getElementById('editAuthor').setAttribute('placeholder',document.getElementById('auteur'+adId).textContent)
        document.getElementById('editTitle').setAttribute('placeholder',document.getElementById('titre'+adId).textContent)
        document.getElementById('editPrice').setAttribute('placeholder',document.getElementById('prix'+adId).textContent)
        document.getElementById('editDescription').setAttribute('placeholder',document.getElementById('desc'+adId).textContent)
        document.getElementById('editAd').style.display = "block";
        document.getElementById('Ads').style.display = "none";
    });
    function cancel(){
        document.getElementById('editAd').style.display = "none";
        document.getElementById('Ads').style.display = "block";
    }
</script>
</html>