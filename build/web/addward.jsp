<%-- 
    Document   : registrationaction
    Created on : Mar 30, 2012, 11:22:44 PM
    Author     : Arnold Isaac McSey
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form action="action/wardaction.jsp" method="post">
            <label>Ward Name:</label><input type="text" name="name"/><br/>
            <label>Number of Beds:</label><input type="number" name="number"/><br/>
            <input type="submit" name="action" value="units"/>
        </form>
    </body>
</html>
