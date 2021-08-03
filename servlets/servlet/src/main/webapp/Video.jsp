<%@ page import ="packagefolder.Video" import="java.util.List" import="java.util.ArrayList" import="java.io.PrintWriter"
import="java.io.IOException" import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <%! List<Video> videos;%>

    <% 

    // Adding postgresql database
    Class.forName("org.postgresql.Driver");

    //connection
    String url = "jdbc:postgresql://localhost:5432/videos_test";
    String username = "postgres";
    String password = "0123456789";
    StringBuilder query = new StringBuilder();
    query.append("select * from video");

    Connection con = DriverManager.getConnection(url, username,password);
    Statement st = con.createStatement();

    ResultSet rs = st.executeQuery(query.toString());
    
    //display the content that you send back
    response.setContentType("text/plain");

    //this Printer allows us to write data to the http response body that is gonna be send to the client
    PrintWriter sendToClient = response.getWriter();

        while(rs.next()){

            sendToClient.write(rs.getString(1) + ":" + rs.getString(2) + "\n");

        }

    st.close();
    con.close();
    %>
    <h1>Hellos</h1>
</body>
</html>