<!doctype html>
<html>
<head>
    <title>Lecoincoin</title>
    <asset:stylesheet src="index.css"/>
    <asset:stylesheet src="admin.css"/>
    <asset:javascript src="Usertab.js"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
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
                <sec:ifAnyGranted roles="ROLE_ADMIN , ROLE_MODERATOR">
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
                       <sec:ifAnyGranted roles="ROLE_ADMIN">
                                            <tr class="first-tr">
                                                <td class="title-td"><span>Add New</span></td>
                                                <td></td>
                                                <td></td>
                                                <td class="static"><input type="text" id="username" name="username" class="form-control"></td>
                                                <td class="static"><input type="text" id="role" class="form-control" name="role"></td>
                                                <td class="static"><input type="text" id="password" name="password"class="form-control"></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>

                                                <td class="static"><button onclick="addUser()" class="button green" id="buttonAdd"><i class="glyphicon glyphicon-ok"></i></button></td>
                                            </tr>
                       </sec:ifAnyGranted>
                                        <g:each in="${usersList}" var="c">
                                            <tr>
                                                <td></td>
                                                <td>${c.getId() } </td>
                                                <td></td>
                                                <td id="auteur${c.getId()}">${c.getUsername()}</td>
                                                <td id="role${c.getId()}">${c.getAuthorities()}</td>
                                                <td id="password${c.getId()}">*********</td>
                                                <td>
                                                    <g:each in="${c.getAnnonces()}" var="x">
                                                        <a href = "/home/ad/${c.getId()}">
                                                            ${x.getId()}
                                                        </a>
                                                    </g:each>
                                                </td>
                                                <td></td>
                                                <td></td>
                                                <td class="static"><button class="button grey" id="buttonEdit" value="${c.getId()}"><i class="glyphicon glyphicon-pencil"></i></button><sec:ifAnyGranted roles="ROLE_ADMIN"><button class="button red" id="Delete_user" value="${c.getId()}" ><i class="glyphicon glyphicon-remove"></i></button></sec:ifAnyGranted></td>
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
                            <div id="editform" style = "margin-left: 15px">
                                    <span>
                                        <input type="text" id="editId" name="id" style = "display: none">
                                        <label for="editusername">Username</label>
                                        <input type="text" id="editusername" name="username" placeholder="">
                                        <br>
                                        <label for="editpassword">Password</label>
                                        <input type="password" id="editpassword" name="password" placeholder="">
                                        <label for="editrole">Role</label>
                                        <br>
                                        <input type="text" id="editrole" name="role" placeholder="">
                                        <br><br>
                                        <button type="submit" id = 'submitEditForm' onclick = 'patchUs()'>EDIT</button>
                                    </span>
                                <button id="buttonCancel" class="buttonED" style = "background-color: orangered;color: white;font-size: 1rem;" onclick="cancel()">Cancel</button>
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
</body>
<script type="text/javascript">
    let origin = location.origin;

    function cancel(){
        document.getElementById('editUser').style.display = "none";
        document.getElementById('Users').style.display = "block";
    }
    $(document).on('click', '#Delete_user', function () {
        var userId = $(this).val();
        var xhttp = new XMLHttpRequest();
        xhttp.open("DELETE", origin + "/api/user/" + userId, true);
        xhttp.send();
        setTimeout(function(){
            window.location.reload();
        }, 700);
    });
    $(document).on('click', '#buttonEdit', function (event) {
        var UsId = $(this).val();
        document.getElementById('editusername').setAttribute('placeholder',document.getElementById('auteur'+UsId).textContent)
        document.getElementById('editrole').setAttribute('placeholder',document.getElementById('role'+UsId).textContent)
        document.getElementById('editpassword').setAttribute('placeholder',document.getElementById('password'+UsId).textContent)
        document.getElementById('editId').value = UsId
        document.getElementById('editUser').style.display = "block";
        document.getElementById('Users').style.display = "none";


    });
    function addUser() {

        const data = {
            username: document.getElementById('username').value,
            role : document.getElementById('role').value,
            password : CryptoJS.AES.encrypt(document.getElementById("password").value, "My Secret Passphrase"),
        };
        var url = origin+"/api/users";
        var xhr = new XMLHttpRequest();
        const searchParams = new URLSearchParams(data);
        xhr.open("POST", url, true);
        xhr.send(searchParams);
        setTimeout(function(){
            window.location.reload();
        }, 500);
    }


    function patchUs(){
        var UsId = document.getElementById('editId').value;
        var usernameV= document.getElementById('editusername').value;
        var passwordV = document.getElementById('editpassword').value;
        var roleV = document.getElementById('editrole').value;
        const data = {
            id: UsId,
            username :usernameV,
            password: passwordV,
            role : roleV,
        };

        if(usernameV == '' || passwordV == '' || roleV == '')
        {
            var url = origin+"/api/user";
            var xhr = new XMLHttpRequest();
            const searchParams = new URLSearchParams(data);

            xhr.open("PATCH", url, true);
            xhr.send(searchParams);
            setTimeout(function(){
                window.location.reload();
            }, 650);

        }
        else {
            var url = origin+"/api/user";
            var xhr = new XMLHttpRequest();
            const searchParams = new URLSearchParams(data);

            xhr.open("PUT", url, true);
            xhr.send(searchParams);
            setTimeout(function(){
                window.location.reload();
            }, 650);

        }

    }
</script>
</html>