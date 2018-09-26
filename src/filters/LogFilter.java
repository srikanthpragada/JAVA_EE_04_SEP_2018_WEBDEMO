package filters;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

@WebFilter("/*")
public class LogFilter implements Filter {

     
    public LogFilter() {
        // TODO Auto-generated constructor stub
    }
 
	public void destroy() {
		// TODO Auto-generated method stub
	}

	 
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException { 
	    HttpServletRequest req = (HttpServletRequest) request;	
        System.out.printf("\n%s was requested at %s",
        		req.getRequestURI(), LocalDateTime.now());
        
		chain.doFilter(request, response);
		System.out.println("After Process");	
		
	}

	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
