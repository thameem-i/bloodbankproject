<%@page import="java.sql.*"%>
<%@page import="Project.ConnectionProvider"%>
<%@include file="header.html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="stylesheet" href="style.css" type="text/css" media="screen">
<style>
input[type="text"], input[type="password"], input[type="email"], select,input[type="number"]
{
    border: none;
    background:silver;
    height: 50px;
    font-size: 16px;
	padding:15px;
	width:60%;	
	border-radius: 25px;
	margin-left:20%;
}
h2,h1
{	
	margin-left:20%;
}
hr
{
width:60%;	
}
</style>
</head>
<body>
<%
String msg = request.getParameter("msg");
if("valid".equals(msg)){
%>
<center><font color="red" size="5">Successfully Updated</font></center>	
<%} %>

<%
if("invalid".equals(msg)){
%>
<center><font color="red" size="5">Something Went Wrong , Try Again </font></center>	
<%} %>


<%
int id=1;
try{
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select max(id) from donor");
	if(rs.next()){
		id = rs.getInt(1);
		id=id+1;
	}%>
	<div class="container">
	<h1 style="color:red;">Donor Id: <%out.println(id);%> </h1>
	<%
}
catch(Exception e){
System.out.print(e);
}
%>
<div class ="container">
<form action="addNewDonorAction.jsp" method="post">
<input type="hidden" name="id" value="<%out.println(id);%>">
<h2>Name</h2>
<input type="text" name="name" placeholder="Enter Name">
<hr>
<h2>Father Name</h2>
<input type="text" name="father" placeholder="Enter Father Name">
<hr>
<h2>Mother Name</h2>
<input type="text" name="mother" placeholder="Enter Mother Name">
<hr>
<h2>Mobile Name</h2>
<input type="number" name="mobilenumber" placeholder="Enter Mobile Number">
<hr>
<h2>Gender</h2>
<select name="gender">
<option value="Male">Male</option>
<option value="Female">Female</option>
<option value=Others">Others</option>
</select>
<hr>
<h2>Email</h2>
<input type="email" name="email" placeholder="Enter Email ">
<hr>
<h2>Blood Group</h2>
<select name="bloodgroup">
<option value="A+">A+</option>
<option value="A-">A-</option>
<option value="B+">B+</option>
<option value="B-">B-</option>
<option value="O+">O+</option>
<option value="O-">O-</option>
<option value="AB+">AB+</option>
<option value="AB-">AB-</option>
</select>
<hr>
<h2>Address</h2>
<input type="text" name="address" placeholder="Enter Address ">
<br>
<center><button type="submit" class="button">Save</button></center>
</form>
</div>




  </div>

<br>
<br>
<br>
<br>

</body>
</html>