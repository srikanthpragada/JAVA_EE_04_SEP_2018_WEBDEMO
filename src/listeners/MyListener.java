package listeners;

import java.util.TreeMap;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import javax.sql.rowset.CachedRowSet;

import oracle.jdbc.rowset.OracleCachedRowSet;

// @WebListener
public class MyListener implements ServletContextListener, HttpSessionListener {
	public void sessionCreated(HttpSessionEvent se) {
		System.out.println("sessionCreated()");
		int count = (Integer) se.getSession().getServletContext().getAttribute("count");
		count++;
		se.getSession().getServletContext().setAttribute("count", count);
	}

	public void sessionDestroyed(HttpSessionEvent se) {
		System.out.println("sessionDestoryed()");
		int count = (Integer) se.getSession().getServletContext().getAttribute("count");
		count--;
		se.getSession().getServletContext().setAttribute("count", count);
	}

	public void contextDestroyed(ServletContextEvent sce) {
		System.out.println("contextDestroyed()");
	}

	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("contextInitialized()");

		TreeMap<String, String> jobs = new TreeMap<>();
		// load data from JOBS table
		try {
			CachedRowSet crs = new OracleCachedRowSet();
			crs.setUrl("jdbc:oracle:thin:@localhost:1521:XE");
			crs.setUsername("hr");
			crs.setPassword("hr");

			crs.setCommand("select job_id, job_title from jobs");
			crs.execute();
			while (crs.next()) {
				jobs.put(crs.getString("job_id"), crs.getString("job_title"));
			}
			crs.close();
			
			sce.getServletContext().setAttribute("jobs", jobs);
			sce.getServletContext().setAttribute("count", 0);

		} catch (Exception ex) {
			System.out.println(ex);
		}
	}

}
