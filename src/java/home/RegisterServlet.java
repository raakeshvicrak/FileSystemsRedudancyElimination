package home;
import java.net.ConnectException;
import java.security.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
public String gpwd(String p)
{
    String passwordToHash = p;
	 //   String passwordToHash = args[0];
       String generatedPassword = null;
       try {
           // Create MessageDigest instance for MD5
           MessageDigest md = MessageDigest.getInstance("MD5");
           //Add password bytes to digest
           md.update(passwordToHash.getBytes());
           //Get the hash's bytes 
           byte[] bytes = md.digest();
           //This bytes[] has bytes in decimal format;
           //Convert it to hexadecimal format
           StringBuilder sb = new StringBuilder();
           for(int i=0; i< bytes.length ;i++)
           {
               sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
           }
           //Get complete hashed password in hex format
           generatedPassword = sb.toString();
       } 
       catch (NoSuchAlgorithmException e) 
       {
           e.printStackTrace();
       }
       return generatedPassword;

}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		
		
		String uname= request.getParameter("t1");
		String email= request.getParameter("t2");
		String p1= request.getParameter("t3");
		String p2= request.getParameter("t4");
		
		//String enc_p1 = gpwd(p1);
		
		String enc;
		try
		{
			Connection c = Dbconnection.conn();
			PreparedStatement st;
			st  =  c.prepareStatement("insert into login (uname,pwd,emailid)values(?,?,?)");
			st.setString(1, uname);
			st.setString(2, p1);
			st.setString(3, email);
			//st.setString(4, p2);
									
			int i = st.executeUpdate();
			if(i>0)
			{
				response.sendRedirect("Loginpage.jsp?msg=Registered Succcessfully");
						
			}
			else
			{
				response.sendRedirect("registration.jsp?msg=Registration Failed");
			}
		}
		catch(Exception e)
		{
			
			response.sendRedirect("registration.jsp?msg=Registration Failed");
			
			e.printStackTrace();
		}
				
		
	}

}
