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

    System.out.println("hello");

    String name = request.getParameter("name");
    String url = request.getParameter("url");
    String durationStr = request.getParameter("duration");
    
    System.out.println(session.getAttribute("videos"));
    
    if(session.getAttribute("videos") == null){
        videos = new ArrayList<>();
    }
    else{
        videos = (List<Video>) session.getAttribute("videos");
    }

    //Verify if duration is a number
    long duration =-1;
    try{
        duration = Long.parseLong(durationStr);
    }catch(NumberFormatException e){

    }

    response.setContentType("text/plain");

    if(name ==null || url ==null || durationStr ==null
        || name.trim().length()<1 || url.trim().length()<10
        || durationStr.trim().length()<1 || duration <=0){
            response.sendError(400,"Missing ['name','url','duration'].");
        }else{
            // Adding postgresql database
            Class.forName("org.postgresql.Driver");

            //connection
            String urldb = "jdbc:postgresql://localhost:5432/videos_test";
            String username = "postgres";
            String password = "0123456789";
            StringBuilder query = new StringBuilder();
            query.append("insert into video (title, url, duration) values ('"+ name + "', '" + url + "', " + duration + ");");
            System.out.println(query.toString());

            Connection con = DriverManager.getConnection(urldb, username,password);
            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery(query.toString());

            Video v = new Video(name, url, duration);
            videos.add(v);
        }

    session.setAttribute("videos", videos);
    System.out.println("Added");

    %>
</body>
</html>