<html>
<body>
<h2>Hello World!</h2>

<form action="VideoPost" method="post">
    <input type="text" name="name">
    <input type="text" name="url">
    <input type="text" name="duration">
    <button>Submit</button>
</form>

<form action="VideoPost.jsp" method="post">
    <input type="text" name="name">
    <input type="text" name="url">
    <input type="text" name="duration">
    <button>Submit jsp</button>
</form>

<form action="ErrorTest.jsp">
    <button>Error test</button>
</form>

<form action="Video">
    <button>Retrieve</button>
</form>

<form action="Video.jsp">
    <button>Retrieve jsp</button>
</form>

<form action="JSTL">
    <button>JSTL test</button>
</form>

<form action="Login.jsp" method ="post">
    <input type="text" name="username">
    <input type="password" name="password">
    <button>Login</button>
</form>

<form action="Private.jsp">
    <button>need login</button>
</form>

<form action="Logout">
    <button>logout</button>
</form>

<form action="Upload" method ="post" enctype="multipart/form-data">
    <input type="file" name="file" multiple>
    <input type="submit" >
</form>
</body>
</html>
