package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.CachedRowSet;

import com.google.gson.Gson;

import beans.Employee;
import oracle.jdbc.rowset.OracleCachedRowSet;

@WebServlet("/employeeSearch")
public class EmployeeSearchServlet extends HttpServlet {
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    try(CachedRowSet crs = new OracleCachedRowSet()) 
	    {
			crs.setUrl("jdbc:oracle:thin:@localhost:1521:XE");
			crs.setUsername("hr");
			crs.setPassword("hr");
			crs.setCommand("select * from employees where first_name like ?");
			String name = request.getParameter("name");
			crs.setString(1, "%" + name + "%");
			crs.execute();
			ArrayList<Employee>  emps = new ArrayList<>();
			while (crs.next()) {
				Employee e = new Employee();
				e.setName(crs.getString("first_name"));
				e.setJob(crs.getString("job_id"));
				e.setSalary(crs.getInt("salary"));
				e.setDept(crs.getInt("department_id"));
				emps.add(e);
			}
			// Convert list to json and send to client 
			response.setContentType("application/json");
			Gson gson = new Gson();
			response.getWriter().println( gson.toJson(emps));
	    }
	    catch(Exception ex) {
	    	// send error to client
	    	response.sendError(500,ex.getMessage());
	    }
	}

}
