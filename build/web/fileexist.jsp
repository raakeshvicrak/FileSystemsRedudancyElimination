<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Get Access Token From Owner</title>
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
<link rel="stylesheet" href="style.css" type="text/css"/>
</head>
<body>
	<div class="menu">
	<li><a href="logout.jsp" style="margin-left:50px;">Logout</a></li>
	<li><a href='uploadFile.jsp'>Home</a></li>
	</div>
	<div class="content">
	
	<div class="right-con"><br><br>
	
<div align= "center">
<%String myfile = request.getParameter("fname"); %>
<h2>The file <u style="color:green"><%= myfile%></u> already exist in the server. Old File is used</h2><br>
</div>

</div>
</div>

<script src="assets-new/js/jquery-1.8.2.min.js"></script>
        <script src="assets-new/bootstrap/js/bootstrap.min.js"></script>
      
        <script src="assets-new/js/scripts.js"></script>	
</body>
</html>