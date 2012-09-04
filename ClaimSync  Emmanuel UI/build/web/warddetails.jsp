<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<head>
    <title>Login</title>
</head>
<body>
<h1>
    Hello please login to this application  
</h1>
<script>

        function login(){
            var username = $("#username").val();
            var password = $("#password").val();
alert(username);
            $.post('login', { username : username , password : password }, function(data) {
                $('#results').html(data).hide().slideDown('slow');
            } );
        }

</script>
Username : <input id="username" type="text" />
Password : <input id="password" type="password" />
<input name="send" type="submit" value="Click me" onclick="login()" />
<form name="next" action="auth/details" method="get">
    <input name="send" type="submit" value="Go Through"/>
</form>
<div id="results" />
</body>
</html>



 