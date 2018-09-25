package listeners;

import java.util.TreeMap;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class MyListener implements ServletContextListener, HttpSessionListener {
    public void sessionCreated(HttpSessionEvent se)  {
    	System.out.println("sessionCreated()");
    }
    public void sessionDestroyed(HttpSessionEvent se)  {
    	System.out.println("sessionDestoryed()");
    }

    public void contextDestroyed(ServletContextEvent sce)  {
    	System.out.println("contextDestroyed()");
    }

    public void contextInitialized(ServletContextEvent sce)  {
    	 TreeMap<String,String> jobs = new TreeMap<>();
    	 // load data from JOBS table 
    	 sce.getServletContext().setAttribute("jobs",jobs);
    	 sce.getServletContext().setAttribute("count",0);
    	 
    	 
         System.out.println("contextInitialized()");
         
    }
	
}
