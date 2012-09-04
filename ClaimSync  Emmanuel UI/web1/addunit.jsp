<%-- 
    Document   : addunit
    Created on : Mar 31, 2012, 8:43:18 AM
    Author     : afuaantwi
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
        <form action="action/unitaction.jsp" method="post">
            <label>Unit Name:</label><input type="text" name="name"/><br/>
            <input type="submit" name="action" value="units"/>
        </form>
    </body>
</html>
