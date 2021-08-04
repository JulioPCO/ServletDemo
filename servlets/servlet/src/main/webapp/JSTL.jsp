<%@ page language ="java" %>

<!--taglib to add the jstl tags-->
<%@ taglib  prefix ="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix ="sql" uri ="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib  prefix ="fn" uri ="http://java.sun.com/jsp/jstl/functions"%>
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

    <!--Setting database-->
    <sql:setDataSource var ="db" driver ="org.postgresql.Driver" url="jdbc:postgresql://localhost:5432/videos_test" user = "postgres" password = "0123456789"/>
    <!--querying and storing result statement in rs-->
    <sql:query var = "rs" dataSource="${db}">select * from video</sql:query>
    <!--Extracting-->
    <c:forEach items = "${rs.rows}" var = "s">
        <c:out value ="${s.title}"></c:out> : <c:out value ="${s.url}"></c:out> <br>
    </c:forEach>

    <!--some functions of jstl function-->
    <c:set var ="str" value="This is an introduction to java"/>
    Length of string : ${fn:length(str)} <br> 

    <c:forEach items = "${fn:split(str,' ')}" var = "sp">
        ${sp} <br> 
    </c:forEach>

    index : ${fn:indexOf(str, "is")} <br> 

    <c:if test = "${fn:contains(str,'java')}">
        contains java
    </c:if>
</body>
</html>