<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <%
        response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); //Works in HTTP 1.1
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0
        response.setHeader("Expires","0");// Proxies

        if(session.getAttribute("user")==null){
            response.sendRedirect("index.jsp");
        }
    %>
    welcome

    <form action="index.jsp">
        <button type="submit" value="back">back</button>
    </form>
    
</body>
</html>