<!doctype html>
<html>
<head>
    <title>Lecoincoin</title>
<asset:stylesheet src="index.css"/>
<asset:stylesheet src="admin.css"/>
<asset:javascript src="Usertab.js"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>



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
                <a   href="/home/AllUsers">
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
        <div class="container-fluid">
            <sec:ifLoggedIn>
                <sec:ifAnyGranted roles="ROLE_USER">


                </sec:ifAnyGranted>
                <sec:ifAnyGranted roles="ROLE_ADMIN">
                    <div class="container">
                        <section id="Users">
                            <div class="container">
                                <main id="table">
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th></th>
                                            <th>ID</th>
                                            <th></th>
                                            <th>Username</th>
                                            <th>Role</th>
                                            <th>Password</th>
                                            <th>Announces</th>
                                            <th></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                         <g:uploadForm controller = "api" action = "users" enctype="multipart/form-data">
                                            <tr class="first-tr">
                                                <td class="title-td"><span>Add New</span></td>
                                                <td></td>
                                                <td></td>
                                                <td class="static"><input type="text" class="form-control" name="username"></td>
                                                <td class="static"><input type="text" class="form-control" name="role"></td>
                                                <td class="static"><input type="text" class="form-control" name="password"></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>

                                                <td class="static"><button type="submit" class="button green" id="buttonAdd" href="/home/AllUsers" ><i class="glyphicon glyphicon-ok"></i></button></td>
                                            </tr>
                                             </g:uploadForm>
                                        <g:each in="${usersList}" var="c">
                                            <tr>
                                                <td></td>

                                                <td>${c.getId() } </td>
                                                <td></td>
                                                <td id="auteur${c.getId()}">${c.getUsername()}</td>

                                                <td id="role${c.getId()}">${c.getAuthorities()[0].getAuthority()}</td>

                                                <td id="password${c.getId()}">*********</td>


                                                <td>${c.getAnnonces()}</td>



                                                <td></td>

                                                <td></td>


                                                <td class="static"><button class="button grey" id="buttonEdit" value="${c.getId()}"><i class="glyphicon glyphicon-pencil"></i></button><button class="button red" id="Delete_user" value="${c.getId()}" ><i class="glyphicon glyphicon-remove"></i></button></td>
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
                        <div class="editContainer" id = 'editUser' style = "display: none">
                            <div id="editform">
                                <g:uploadForm controller = "api" action = "users" enctype="multipart/form-data">
                                    <span>
                                        <label for="editusrename">Username</label>
                                        <input type="text" id="editusername" name="username" placeholder="">
                                        <br>
                                        <label for="editpassword">Password</label>
                                        <input type="text" id="editpassword" name="password" placeholder="">
                                        <label for="editrole">Role</label>
                                        <br>
                                        <input type="text" id="editrole" name="role" placeholder="">
                                        <br><br>
                                        <input type="submit" value="EDIT">
                                    </span>
                                </g:uploadForm>
                                <button id="buttonCancel" class="buttonED" style = "background-color: orangered;color: white;font-size: 1rem;" >Cancel</button>
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
</div>


</body>
<script type="text/javascript">











    // var $table = $('#table');
    // $(function () {
    //     $('#toolbar').find('select').change(function () {
    //         $table.bootstrapTable('refreshOptions', {
    //             exportDataType: $(this).val()
    //         });
    //     });
    // })
    // //exporte les données sélectionnées
    //
    // var trBoldBlue = $("table");
    //
    // $(trBoldBlue).on("click", "tr", function (){
    //     $(this).toggleClass("bold-blue");
    // });
    $("button").click(function() {
        var button = $(this).val();

        function Delete_Annonce() {

            var xhttp = new XMLHttpRequest();
            xhttp.open("DELETE", "http://localhost:8081/api/annonce/" + button, true);
            xhttp.send();

            window.location.reload();
        }
        function Delete_User() {

            var xhttp = new XMLHttpRequest();
            xhttp.open("DELETE", "http://localhost:8081/api/user/" + button, true);
            xhttp.send();

            window.location.reload();
        }
        function Edit_annonce(){
            $(".input").show();
            $(".input").show();
        }

        function Edit_user(){
            $(".input").show();
            $(".input").show();
        }

        function Edit_user(){


        }

        if (this.id == 'Delete_annonce'){
            Delete_Annonce()
        }
        if (this.id == 'Delete_user'){
            Delete_User()
        }
        if (this.id =='Edit_annonce'){
            Edit_annonce()

        }
    });


    $(document).on('click', '#buttonEdit', function (event) {
        var adId = $(this).val();

        // document.getElementById('editAuthor').setAttribute('placeholder',document.getElementById('auteur'+adId).textContent)
        // document.getElementById('editTitle').setAttribute('placeholder',document.getElementById('titre'+adId).textContent)
        // document.getElementById('editPrice').setAttribute('placeholder',document.getElementById('prix'+adId).textContent)
        // document.getElementById('editDescription').setAttribute('placeholder',document.getElementById('desc'+adId).textContent)
        document.getElementById('editUser').style.display = "block";
        document.getElementById('Users').style.display = "none";


    });

</script>
</html>