<%@ page import ="packagefolder.Video" import="java.util.List" import="java.util.ArrayList" import="java.io.PrintWriter"
import="java.io.IOException"  %>

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
    Class.forname("org.postgresql.Driver");

    //connection
    String url = "jdbc:postgresql://localhost:5432/videos_test";
    String username = "postgres";
    String password = "0123456789";
    StringBuilder query = new StringBuilder();
    query.append("");

    Connection con = DriverManager.getConnection(url, username,password);
    Statement st = con.createStatement();

    ResultSet rs = st.executeQuery(query.toString());


    System.out.println("hello");
    
    System.out.println(session.getAttribute("videos"));
    
    if(session.getAttribute("videos") == null){
        videos = new ArrayList<>();
        session.setAttribute("videos", videos); 
    }
    else{
        videos = (List<Video>) session.getAttribute("videos");
    }
        

    //display the content that you send back
    response.setContentType("text/plain");

    //this Printer allows us to write data to the http response body that is gonna be send to the client
    PrintWriter sendToClient = response.getWriter();

        for(Video v: videos){

            sendToClient.write(v.getName() + ":" + v.getUrl() + "\n");

        }
    %>
    <h1>Hellos</h1>
</body>
</html>