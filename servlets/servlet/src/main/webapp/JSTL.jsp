<%@ page language ="java" %>

<!--taglib to add the jstl tags-->
<%@ taglib  prefix ="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <!--Using java language-->
    <%
        String name = request.getAttribute("label").toString();
        out.println(name);
    %>
    
    <!--with special tags-->
    ${label} <br>

    <!--with jstl-->
    <c:out value ="${label}"/> <br>

    <c:forEach items = "${label}" var = "s">
        ${s} <br>
    </c:forEach>
</body>
</html>