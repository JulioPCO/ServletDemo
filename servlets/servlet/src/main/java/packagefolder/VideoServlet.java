package packagefolder;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(urlPatterns = {"/Video","/VideoPost"},initParams = {@WebInitParam(name="OS", value="Windows_10")})
//Servlets annotation is another way of setting the servlet information without the web.xml file, although the primary information such as xml version and web-app should be
//in the web.xml file.
// servlet annotation -> gives the url_patterns to the servlet / use this or web-mapping in the web.xml file and add initParam to the servlet config
// it can also be used to name the server ->e.g name = Videos
//for a strange reason I tried add the servlet config in the web.xml file but it was not working, maybe because there is the web servlet annotation
//So sticky with either web.xml or server annotation, and if you mix both check if this is not the error.
public class VideoServlet extends HttpServlet{

    public static final String VIDEO_ADDED =  "video Added";
    private List<Video> videos = new ArrayList<>();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        System.out.println("hello");

        //Servlet Context & Servlet config -> in context the object is shared among all servlets, while in config is for each servlet
        ServletContext context = getServletContext(); // set object servlet context
        System.out.println(context.getInitParameter("OS")); // get content specified in the web.xml file -> <context-param></context-param>

        ServletConfig config = getServletConfig(); 
        System.out.println(config.getInitParameter("OS"));

        //display the content that you send back
        resp.setContentType("text/plain");

        //this Printer allows us to write data to the http response body that is gonna be send to the client
        PrintWriter sendToClient = resp.getWriter();

        for(Video v: videos){

            sendToClient.write(v.getName() + ":" + v.getUrl() + "\n");

        }

        int size = videos.size();
        videos.clear();

        //sendRedirect

        //HttpSession 
        HttpSession session = req.getSession();
        session.setAttribute("size", size);
        resp.sendRedirect("compare");

        //Cookie
        //Cookie cookie = new Cookie("size", size + ""); //only string
        //resp.addCookie(cookie);

        // URL rewriting
        //resp.sendRedirect("compare?size=" + size); 

        
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        
        String name = req.getParameter("name");
        String url = req.getParameter("url");
        String durationStr = req.getParameter("duration");


        //Verify if duration is a number
        long duration =-1;
        try{
            duration = Long.parseLong(durationStr);
        }catch(NumberFormatException e){

        }

        resp.setContentType("text/plain");

        if(name ==null || url ==null || durationStr ==null
            || name.trim().length()<1 || url.trim().length()<10
            || durationStr.trim().length()<1 || duration <=0){
                resp.sendError(400,"Missing ['name','url','duration'].");
            }else{
                Video v =new Video(name, url, duration);
                videos.add(v);
                req.setAttribute("Added", VIDEO_ADDED);
            }

        //Request Dispatcher
        RequestDispatcher rd = req.getRequestDispatcher("id");
        rd.forward(req, resp);
    }
    
}
