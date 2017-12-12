package classAx.control;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet("/Table")
public class Table extends HttpServlet {
	private static final long serialVersionUID = 4L;

	/*
	 * Launcher for index.jsp with set form parameters for the specifications
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Enumeration<String> specNames = request.getParameterNames();
			while (specNames.hasMoreElements()) {
				String specName = (String) specNames.nextElement();
				request.setAttribute(specName, request.getParameter(specName));
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
