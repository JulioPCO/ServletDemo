<%@ page language ="java" %>

<!--taglib to add the jstl tags-->
<%@ taglib  prefix ="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix ="sql" uri ="http://java.sun.com/jsp/jstl/sql"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
    ${param.username} <br>
    <!--Setting database-->
    <sql:setDataSource var ="db" driver ="org.postgresql.Driver" url="jdbc:postgresql://localhost:5432/videos_test" user = "postgres" password = "0123456789"/>
    <!--querying and storing result statement in rs-->
    <sql:query var = "rs" dataSource="${db}">select * from "LoginDatabase" where username = '${param.username}';</sql:query>
    <!--Extracting-->
    ${rs.rows[0].username}
    ${rs.rows[0].password}
    <c:choose>
        <c:when test = "${rs.rows[0].username eq param.username}">
            <c:choose>
                <c:when test = "${rs.rows[0].password eq param.password}">
                    <c:set var="user" value="${param.username}" scope="session" />
                    <c:redirect url = "Private.jsp"/>
                </c:when>
                <c:otherwise>
                    <c:redirect url = "index.jsp"/>
                </c:otherwise>
            </c:choose>    
        </c:when>
        <c:otherwise>
            <c:redirect url = "index.jsp"/>
        </c:otherwise>
    </c:choose>

    String
</body>
</html>