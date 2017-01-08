<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="home.Dbconnection"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ShareFile</title>
<style type="text/css">
fieldset { 
			width:400px;
			border:1px solid green }

legend {
  padding: 0.2em 0.5em;
  border:1px solid green;
  color:green;
  font-size:90%;
  text-align:left;
  }
  li
  {
  list-style:none;
 
  
th
{
text-align:left;
}
</style>
<link rel="stylesheet" href="style.css" type="text/css"/>
</head>
<body>
	<div class="menu">
            
        <li><a href="uploadFile.jsp"><b>Home  </b></a></li>&nbsp;
        <li><a href="logout.jsp"><b>Log out  </b></a></li>
	<!-- <li><a href="uploadFile.jsp"><b>Home</b></a></li> -->
	
	</div>
	<div class="content">
	<div class="right-con"><br><br>
	
	<p style="color:Green;position:relative; left:150px; text-transform:uppercase;"><%
	
	
	
	HttpSession ses=request.getSession(false);
	String u1 = (String)ses.getAttribute("uid");
	int u = Integer.parseInt(u1);

	out.println("Your Current UserID==> "+u);
	
	%>

	</p>
	
	
	
	
	<center>
	<fieldset>
	<legend><b>Share Your Files </b></legend>
	
	
	
	
	
	
<%
int uid,fid;
Connection c= Dbconnection.conn();
PreparedStatement st;

ResultSet rs;






%>
	
		
	
	
	<form action="sharing.jsp" method="get" >
	<table>
	
	
	
	<tr>
	<th>
	Share To UserID
	</th>
	<td>
	<select name="t1" class="textbox">
	<option value="Select">Select</option>
<%


st= c.prepareStatement("select * from login");
 rs =st.executeQuery();

while(rs.next())
{
	
if(rs.getInt(1)!=u){

%>
	<option value="<%=rs.getInt(1)%>"><%=rs.getInt(1)%> - <%=rs.getString(2) %> </option>
<%
}
}
%>	
	
	</select>
	</td>
	</tr>
	
	
	
	
	
	
	
	<tr>
	<th>
	FileName
	</th>
	<td>
	<select name="t2" class="textbox">
	<option value="Select">Select</option>
<%


st= c.prepareStatement("select * from owner where userid = ?");
st.setInt(1,u);
rs =st.executeQuery();
while(rs.next())
{%>
	<option value="<%=rs.getInt(2)%>"><%=rs.getString(3)%></option>
<%
}
%>	
	
	</select>
	</td>
	</tr>
	
	
	
	<tr>
	<td><td>
	<input type="submit" value="Submit" class="myButton" style="position:relative; left:60px;">
	</td>
	</tr>
	
		</table></form>
		</fieldset>
		</center>
		<br>
	<br>
	<br>
</div>
</div>
	
<script src="assets-new/js/jquery-1.8.2.min.js"></script>
        <script src="assets-new/bootstrap/js/bootstrap.min.js"></script>
        
        <script src="assets-new/js/scripts.js"></script>	
</body>
</html>