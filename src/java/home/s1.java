package home;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class s1
 */
@WebServlet("/s1")
public class s1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public s1() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String u = request.getParameter("t1");
		String p = request.getParameter("t2");
		
		
		response.setContentType("text/html");
		
		Dbmanipulation db = new Dbmanipulation();
		
		int ss = db.getUserId(u, p);
		String ss1=Integer.toString(ss);
		if(db.logintest(u, p))
		{
			
			HttpSession ses=request.getSession();
			ses.setAttribute("uid",ss1 );
			
			
			
			//out.println("Login success!!");
			response.sendRedirect("uploadFile.jsp");
		}
		else
		{
			response.sendRedirect("Loginpage.jsp?msg=Login Failed");
		}
		
		
		
		
	}

}
