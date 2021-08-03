package packagefolder;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = {"/JSTL"})

public class JSTL extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        System.out.println("hello");

        List<Video> video = Arrays.asList(new Video("Azul", "https://wow.com", (long) 12000), new Video("Verde", "https://wow.com", (long) 2000), new Video("Lilas", "https://wow.com", (long) 100));
        req.setAttribute("label", video);
        RequestDispatcher rd = req.getRequestDispatcher("/JSTL.jsp");
        rd.forward(req, resp);
    }
}
