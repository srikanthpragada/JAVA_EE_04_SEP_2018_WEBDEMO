package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updatesalary")
public class UpdateSalaryServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");

		Connection con = null;
		// connect to oracle
		try {
			// Load jdbc driver
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "hr", "hr");
			PreparedStatement ps = con.prepareStatement("update employees set salary = ? where employee_id = ?");
			ps.setString(1, request.getParameter("salary"));
			ps.setString(2, request.getParameter("id"));

			int count = ps.executeUpdate();
			if (count == 1)
				pw.println("<h3>Updated Successfully!</h3>");
			else
				pw.println("<h3>Employee Not Found!</h3>");
		} catch (Exception ex) {
			System.out.println(ex);
			pw.println("Sorry! Could not update salary of employee!");
		} finally {
			if (con != null)
				try {
					con.close();
				} catch (Exception ex) {
					System.out.println(ex);
				}
		}

	}

}
