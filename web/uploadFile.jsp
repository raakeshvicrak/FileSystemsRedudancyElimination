<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<title>UploadFile</title>
<style type="text/css">
fieldset { 
			width:400px;
			border:1px solid green
                        
}

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
 
  }
th
{
text-align:left;
}
</style>
<link rel="stylesheet" href="style.css" type="text/css">
</head>
<body>
  <center>

	<div class="menu">
	
	<li><a href="logout.jsp"><b>&nbsp;&nbsp;&nbsp;&nbsp;Logout</b></a></li>
	<li><a href="sharefile.jsp"><b>&nbsp;&nbsp;&nbsp;&nbsp;ShareFile</b></a></li>
	<li><a href="downloadfile.jsp"><b>DownloadFile</b></a></li>
	</div>
    </center>
	<div class="content" >
	<div class="right-con"><br><br>
	
	<p style="color:Green;position:relative; left:150px; text-transform:uppercase;">Your Current UserID ==&gt; 4


	</p>
	
	
	<center><fieldset><legend>
	<b>UploadFile</b>
	</legend>
	<form action="FileUploadServlet" method="post" enctype="multipart/form-data">
	<table>
	
		
	<tbody><tr>
	<th>
	UploadFile &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</th>
	<td>
	<input type="file" name="t2" class="textbox"> 
	<br>
	<input type="submit" value="Submit" class="myButton" style="position:relative; left:60px;">
	</td>
	</tr>
	
	
		</tbody></table></form>
		</fieldset>
		</center>
		<br>
	<br>
	<br><br>
</div>
</div>
	
<script src="assets-new/js/jquery-1.8.2.min.js"></script>
        <script src="assets-new/bootstrap/js/bootstrap.min.js"></script>
       
        <script src="assets-new/js/scripts.js"></script>	

</body>
</html>