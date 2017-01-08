<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.io.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="java.sql.*,home.*,java.lang.*" %>
<%@page import ="home.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 




HttpSession ss = request.getSession();
String s=(String)ss.getAttribute("fid");

int fid = Integer.parseInt(s);
String skey=request.getParameter("skey");
System.out.println("skey"+skey);

System.out.println("file id==> "+fid);
Connection c= Dbconnection.conn();

PreparedStatement st;
ResultSet rs;
String fname=null;
st= c.prepareStatement("select * from owner where fid=(select fid from share1 where skey=?)");
st.setString(1,skey);
rs =st.executeQuery();

if(rs.next())
{
	fname = rs.getString(3);
	System.out.println(fname);
        fname  = request.getParameter("fn");
System.out.println(fname);
int BUFSIZE = 4096;
String filePath;
{
//getServletContext().getRealPath("") + File.separator +"upload"+File.separator
	
		filePath = "/Users/raakesh-pt503/Documents/upload/"+fname;
	
    System.out.println("kanhiii"+filePath);
    File file = new File(filePath);
    int length   = 0;
    ServletOutputStream outStream = response.getOutputStream();
   response.setContentType("text/html");
    response.setContentLength((int)file.length());
    String fileName = (new File(filePath)).getName();
    response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
    
    byte[] byteBuffer = new byte[BUFSIZE];
    DataInputStream in = new DataInputStream(new FileInputStream(file));
    

    while ((in != null) && ((length = in.read(byteBuffer)) != -1))
    {
        outStream.write(byteBuffer,0,length);
    }
    
    in.close();
    outStream.close();
}

}else{
    out.println("Wrong key!");
}

%>
</body>
</html>