package packagefolder;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = "/compare")
public class VideoCompare  extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub

        //Cookies
        /* Cookie[] cookie =  req.getCookies();

        for(Cookie c : cookie){
            if(c.getName().equals("size")){
                int vid2 = Integer.parseInt(c.getValue());
            }
        } */

        // httpsession
        HttpSession session = req.getSession();

        int vid = (int) session.getAttribute("size"); 
        session.removeAttribute("size");

        //int vid = Integer.parseInt(req.getParameter("size")); -> url rewriting

        if(vid == 0)
            System.out.println("No video");
        else
            System.out.println("Has video");
    }
}

