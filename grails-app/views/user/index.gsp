<!DOCTYPE html>
<html>
    <head>
        <asset:stylesheet src="indexUsers.css"/>
    </head>
    <body>
            <div class = "user-container">
                <f:table collection="${userList}"  properties="username, annonces" />
            </div>
    </body>
</html>O0