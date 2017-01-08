<%@page import="java.util.Random"%>
<%@page import="home.SendMail"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="home.Dbconnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Home</title>
<link rel="stylesheet" href="style.css" type="text/css">
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
</head>
<body>
	<div class="menu">
	<li><a href="logout.jsp"><b>Log out</b></a></li>
	<li><a href="uploadFile.jsp"><b>Home</b></a></li>
	</div>
	<div class="content">
	<div class="right-con"><br><br>
	

<%
	
	
	

String u1 = (String)session.getAttribute("uid");
int fromu = Integer.parseInt(u1);
	
	%>
<%
String u2 = request.getParameter("t1");
String p1 = request.getParameter("t2");
System.out.println(u1+"  "+p1);
int tou=Integer.parseInt(u2);
int fid=Integer.parseInt(p1);

String key = "";
String keyarr [] = new String []{"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","1","2","3","4","5","6","7","8","9","0","~","!","@","#","$","%","^","&","*","(",")","_","-","=","+"};
Random rand = new Random();
for(int i=0;i<32;i++){
	int ran = rand.nextInt(keyarr.length);
	key+=keyarr[ran];
}

Connection c = Dbconnection.conn();
PreparedStatement st;
st=c.prepareStatement("insert into share1 (sfrom_uid,sto_uid,fid,skey)values(?,?,?,?)");
st.setInt(1, fromu);
st.setInt(2, tou);
st.setInt(3,fid);
st.setString(4,key);
int  i =st.executeUpdate();
SendMail sm = new SendMail();
PreparedStatement ps = c.prepareStatement("select * from login where userid = ?");
ps.setInt(1, tou);
ResultSet rs = ps.executeQuery();
rs.next();

boolean suc  =sm.SendM(rs.getString("emailid"), "Key for "+fid, key);
if(i>0&&suc)
{
	
	
	
	%>
	<h2>File Shared successfully!!!!</h2>
	
	<%} %>

</center>
<br><br>
</div>
	</div>
</div>
	
<script src="assets-new/js/jquery-1.8.2.min.js"></script>
        <script src="assets-new/bootstrap/js/bootstrap.min.js"></script>
  
        <script src="assets-new/js/scripts.js"></script>	
</body>
</html>