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