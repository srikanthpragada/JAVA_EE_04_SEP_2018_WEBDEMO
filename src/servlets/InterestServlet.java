package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/interest")
public class InterestServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();

		try {
			int amount = Integer.parseInt(request.getParameter("amount"));
			int period = Integer.parseInt(request.getParameter("period"));
			double interest;

			if (period <= 24)
				interest = amount * 0.9;
			else
				interest = amount * 0.95;

			// Send response to client
			pw.println("<h2>Interest = " + interest + "</h2>");
		} catch (Exception ex) {
			System.out.println(ex);
			pw.println("<h3>Sorry! Invalid input. Please try again!</h3>");
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

}
