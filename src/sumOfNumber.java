

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class sumOfNumber
 */
@WebServlet(description = "Input a and b. Output a+b.", urlPatterns = { "/sumOfNumber" })
public class sumOfNumber extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sumOfNumber() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String a = request.getParameter("a");
		String b = request.getParameter("b");
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		out.println("<h2>Input url-parameters a and b.</h2><br>");
		if ((a != null) && (b !=null)) {
			try {
				double c = Double.parseDouble(a) + Double.parseDouble(b);
				out.println("<h1>" + a + "+" + b + "=" + c + "</h1>");
			} catch (NumberFormatException e) {
				out.println("<h2>Incorrectly type of parameters a and/or b</h2>");
			}
		} else
			out.println("<h2>a and/or b is not defined.</h2>");
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
