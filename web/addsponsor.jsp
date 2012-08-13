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
        <form action="action/sponsoraction.jsp" method="POST">
            <label>Sponsor Name  : </label><input type="text" name="sponsorname" value=""/><br />
            <label>Type : </label><select name="type">
                
                 <option value="private">Private Health Insurance</option>
                
                  <option value="cooperate">Cooperate Insured</option>
            </select><br/>
            <label>Address : </label><input type="text" name="address" value=""/><br/>
            <label>Contact  : </label><input type="text" name="contact" value=""/><br />
            <label>Email: </label><input type="text" name="email" value=""/><br/>
            
            <input type="submit" name="action" value="sponsor"/>
        </form>
    </body>
</html>
