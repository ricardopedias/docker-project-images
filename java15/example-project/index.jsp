<%@page
    pageEncoding="UTF-8" 
    contentType="text/html; charset=UTF-8"
    import="java.util.Date, java.text.*"
%>
<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Java 15</title>
    </head>

    <body>

        <h2>Página de teste</h2>

        <%
        out.println("<p>");
        out.println("Esta é uma página JSP em " + (new Date()));
        out.println("</p>");
        %>

    </body>
</html>