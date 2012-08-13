<%-- 
    Document   : scripttest
    Created on : Aug 2, 2012, 1:12:24 AM
    Author     : drac852002
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>JSP Page</title>
        <script type="text/javascript">
            function addMore(){
                var one = document.getElementById("one").value;
                var two = document.getElementById("two").value;
                var three = document.getElementById("three").value;
                var four = document.getElementById("four").value;
                var five = document.getElementById("five").value;
                
                var doc = document.getElementById("tt").innerHTML = "<tr><td>"+one+"</td><td>"+two+"</td><td>"+three+
                    "</td><td>"+four+"</td><td>"+five+"</td></tr>";
            }
            
        </script>
    </head>
    <body>
        <form action="" method="post">
            <input type="text" name="one" id="one"/><input type="text" name="two" id="two"/><input type="text" id="three" name="three" />
            <input type="text" name="four" id="four"/><input type="text" id="five"name="five" />
            <input type="button" name="here" onclick="addMore();return false"/>
        </form>
        <table>
            
        </table>
        <div id="tt"></div>
    </body>
</html>
