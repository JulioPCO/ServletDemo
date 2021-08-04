package packagefolder;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

@WebFilter(urlPatterns = {"/VideoPost", "/VideoPost.jsp"})
public class FilterDuration implements javax.servlet.Filter {

    public void destroy(){

    }

    public void init(FilterConfig fConfig) throws ServletException{

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        // TODO Auto-generated method stub

        System.out.println("hello from filter");

        HttpServletRequest req = (HttpServletRequest) request;//cast to http request
        PrintWriter out = response.getWriter();

        int duration = Integer.parseInt(req.getParameter("duration"));

        if(duration > 1)
            chain.doFilter(request,response);
        else
            out.print("Invalid Input");

        
    }
    
}
