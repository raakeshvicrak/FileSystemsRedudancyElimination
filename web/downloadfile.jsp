<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,home.*"%>
    <%@page import  = "javax.servlet.http.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<script type = "text/javascript">
function download(str){
	document.getElementById("fd").value = str;
	document.getElementById("myForm").submit();
	
}
</script>



<title>Welcome</title>
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
 
  }
th
{
text-align:left;
}

.CSSTableGenerator {
	margin:0px;padding:0px;
	width:100%;
	box-shadow: 10px 10px 5px #888888;
	border:1px solid #000000;
	
	-moz-border-radius-bottomleft:0px;
	-webkit-border-bottom-left-radius:0px;
	border-bottom-left-radius:0px;
	
	-moz-border-radius-bottomright:0px;
	-webkit-border-bottom-right-radius:0px;
	border-bottom-right-radius:0px;
	
	-moz-border-radius-topright:0px;
	-webkit-border-top-right-radius:0px;
	border-top-right-radius:0px;
	
	-moz-border-radius-topleft:0px;
	-webkit-border-top-left-radius:0px;
	border-top-left-radius:0px;
}.CSSTableGenerator table{
    border-collapse: collapse;
        border-spacing: 0;
	width:100%;
	height:100%;
	margin:0px;padding:0px;
}.CSSTableGenerator tr:last-child td:last-child {
	-moz-border-radius-bottomright:0px;
	-webkit-border-bottom-right-radius:0px;
	border-bottom-right-radius:0px;
}
.CSSTableGenerator table tr:first-child td:first-child {
	-moz-border-radius-topleft:0px;
	-webkit-border-top-left-radius:0px;
	border-top-left-radius:0px;
}
.CSSTableGenerator table tr:first-child td:last-child {
	-moz-border-radius-topright:0px;
	-webkit-border-top-right-radius:0px;
	border-top-right-radius:0px;
}.CSSTableGenerator tr:last-child td:first-child{
	-moz-border-radius-bottomleft:0px;
	-webkit-border-bottom-left-radius:0px;
	border-bottom-left-radius:0px;
}.CSSTableGenerator tr:hover td{
	
}
.CSSTableGenerator tr:nth-child(odd){ background-color:#ffaa56; }
.CSSTableGenerator tr:nth-child(even)    { background-color:#ffffff; }.CSSTableGenerator td{
	vertical-align:middle;
	
	
	border:1px solid #000000;
	border-width:0px 1px 1px 0px;
	text-align:left;
	padding:7px;
	font-size:10px;
	font-family:Arial;
	font-weight:bold;
	color:#000000;
}.CSSTableGenerator tr:last-child td{
	border-width:0px 1px 0px 0px;
}.CSSTableGenerator tr td:last-child{
	border-width:0px 0px 1px 0px;
}.CSSTableGenerator tr:last-child td:last-child{
	border-width:0px 0px 0px 0px;
}
.CSSTableGenerator tr:first-child td{
		background:-o-linear-gradient(bottom, #ff7f00 5%, #bf5f00 100%);	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ff7f00), color-stop(1, #bf5f00) );
	background:-moz-linear-gradient( center top, #ff7f00 5%, #bf5f00 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#ff7f00", endColorstr="#bf5f00");	background: -o-linear-gradient(top,#ff7f00,bf5f00);

	background-color:#ff7f00;
	border:0px solid #000000;
	text-align:center;
	border-width:0px 0px 1px 1px;
	font-size:14px;
	font-family:Arial;
	font-weight:bold;
	color:#ffffff;
}
.CSSTableGenerator tr:first-child:hover td{
	background:-o-linear-gradient(bottom, #ff7f00 5%, #bf5f00 100%);	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ff7f00), color-stop(1, #bf5f00) );
	background:-moz-linear-gradient( center top, #ff7f00 5%, #bf5f00 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#ff7f00", endColorstr="#bf5f00");	background: -o-linear-gradient(top,#ff7f00,bf5f00);

	background-color:#ff7f00;
}
.CSSTableGenerator tr:first-child td:first-child{
	border-width:0px 0px 1px 0px;
}
.CSSTableGenerator tr:first-child td:last-child{
	border-width:0px 0px 1px 1px;
}
</style>
</head>
<body>
<form action = "DownloadOption.jsp" id = "myForm" method = "post">

<input type = "hidden" name=  "fn" id = "fd"/>
</form>
	<div class="menu">
	 <li><a href="uploadFile.jsp"><b>Home  </b></a></li>&nbsp;
        <li><a href="logout.jsp"><b>Log out  </b></a></li>
	</div>
	<div class="content">
	<br>
	<b style="font-family:arial; font-size:23px; color:rgb(250, 96, 16);text-transform:uppercase;position:relative; left:450px;top:15px;">Shared File List</b>
	<br>
	<br>
	<br>
	<p style="color:Green;position:relative; left:150px; text-transform:uppercase;"><%
	
	
	HttpSession ses=request.getSession(false);
	String u1 = (String)ses.getAttribute("uid");
	int u = Integer.parseInt(u1);
	//int u=2;
	out.println("Your Current UserID==> "+u);
	
	%>

	</p>
	
		
<%
int uid,fid;
Connection c= Dbconnection.conn();
PreparedStatement st,st1;

ResultSet rs,rs1;

%>
	
	
	<center>
           
            <table border="1" style="width:80%; background-color:#D7D8BD;color:#000;" >
	<tr>
	<th>Shared From UserID</th>
	
	
	<th>Access Token Number</th>
	<th>Key</th>
	<th>Download File</th>
	</tr>
	
	
	
	
	<% 


st= c.prepareStatement("select * from share1 where sto_uid=?");
	st.setInt(1,u);
 rs =st.executeQuery();
 int i=1;
while(rs.next())
{
	st1= c.prepareStatement("select * from owner where fid=?");
	st1.setInt(1, rs.getInt(3));
	rs1 = st1.executeQuery();
	String FileName = "";
	if(rs1.next()){
		FileName = rs1.getString("fname");
	}


%>
	
	<form action = "DownloadOption.jsp" method = "post">
	<tr>
	<td><%=rs.getInt(1)%>
	<input type = "hidden" name= "fid" value='<%= rs.getInt(3)%>'/>
	
	</td>
	
	<%
	HttpSession ss = request.getSession();
	ss.setAttribute("fid", Integer.toString(rs.getInt(3)));
	
	%>
	
	<td><%=rs.getInt(4)%>
	
	<input type=  "hidden" name=  "fn" value='<%=FileName %>'/>
	
	</td>
	
	<td><input type= "text" name  ="skey"/></td>

 	<td><input type= "submit"  value=  "<%=FileName %>"/></td>
	</tr>
	</form>
	
<%
i++;
}

%>	
	
	
	
	
	
	
               
            </table>
           
            </center>
    <br>
	<br>
	<br><br>
	<br>
<br><br>
	<br>
		
</div>
	
	
<script src="assets-new/js/jquery-1.8.2.min.js"></script>
        <script src="assets-new/bootstrap/js/bootstrap.min.js"></script>
       
        <script src="assets-new/js/scripts.js"></script>	
</body>
</html>