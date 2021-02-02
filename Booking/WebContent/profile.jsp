<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "javax.servlet.*,java.text.*" %>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import ="java.util.*"%>
<%@ page import ="java.sql.*"%>
<%@ page import ="java.util.Date"%>
<!DOCTYPE html>
<html lang="en">
<title>My profile</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="profile.css">
<link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<body >
<div class="w3-bar w3-white w3-large">
  <a href="customerhome.jsp" class="w3-bar-item w3-button w3-blue w3-mobile"><i class="fa fa-bed w3-margin-right"></i>Home Away</a>
    <a href="viewHotelphoto.jsp" class="w3-bar-item w3-button w3-mobile">View Hotels</a>
    <a href="customerhome.jsp" class="w3-bar-item w3-button w3-mobile">Book Now</a>
    <a href="cancelBooking.jsp" class="w3-bar-item w3-button w3-mobile">Cancel reservation</a>
        
  <a href="Logout" class="w3-bar-item w3-button w3-right w3-light-grey w3-mobile">LogOut</a>
</div>

   <%
   String url = "jdbc:mysql://localhost:3306/hotelbook";
   String user = "salsabil";
   String password = "123";
       Connection Con = null;
       ResultSet RS=null;
       ResultSet RS1=null;
       ResultSet RS2=null;
       ResultSet RS3=null;
   	String clientID = request.getSession().getAttribute("client_Id").toString();


       Con = DriverManager.getConnection(url, user, password);
       PreparedStatement ps2=Con.prepareStatement("select * FROM `client` where `client_Id`="+clientID);
       RS2=ps2.executeQuery();
   if(RS2.next()){
   
   
   %>
   <form action="profile.jsp">
     <div class="column">
	  	    <div class="card">
	  	    <img src="a.jpg" style=" width: 10% ; border-radius: 200px;margin-left:150px ">
	  	      <div class="container">
	  	      <strong style="margin-left:130px; color:white;font-size:20px;"><%=RS2.getString("email") %></strong>
	  	      	  	      <br><br>
	  	      
	  	      <label>Change Name</label>
	  	        <input type="text" value="<%=RS2.getString("Name") %>" name="Name" style="margin-left:28px;"><br><br>
	  	           <label>Change Phone</label>
	  	      
	  	        <input type="text" name="phone" value="0<%=RS2.getString("Phone_number") %>"style="margin-left:25px;"><br><br>
	  	        <label>Change Password</label>
	  	        <input type="password" name="password" value="<%=RS2.getString("password")%>"><br><br>
	  	        <button  name="submit">Change</button>
	  	      </div>
	  	      	  	        <br>
	  	       <%
 if(request.getParameter("Name")!=null&&request.getParameter("phone")!=null&&request.getParameter("password")!=null&request.getParameter("submit")!=null){
	String name=request.getParameter("Name");
	String phone=request.getParameter("phone");
	String pass=request.getParameter("password");
	
	 PreparedStatement ps4=Con.prepareStatement("UPDATE `client` SET `Name`=? , `password`=? , `Phone_number`=? where `client_id`=?");
		ps4.setString(1,name);
		ps4.setString(2,pass);
		ps4.setString(3,phone);
		ps4.setString(4,clientID);

	int y=ps4.executeUpdate();
	if(y!=0){
		out.print("<p>changed Sucessefully</p>");
	}
 }
 
 %>
	  	    </div>
	  	    
	  	  </div>
	  	  </form>
	  	   <%}
   PreparedStatement ps3=Con.prepareStatement("select * FROM `comments` where `client_id`="+clientID);
       RS3=ps3.executeQuery();
       if(RS3.next()){%>
    	      <div class="column">
  	  	    	    <div class="card">
	  	 
	  	      <div class="container">
	  	      <p style="margin-right:1000px;color:white"> Comments</p>
    	<%   do{
     %> 
	  	   	  
	  	   <strong class="title" style="margin-right:1000px; color:white"><big><%=RS3.getString("comment")%></big></strong><br>
	  	        
	  
	  	  <%}while(RS3.next());}
       %>
	  	  	      </div>
	  	    </div>
	  	  </div>
<!-- Page content -->

<script>
function loadDoc() {
    var name = document.getElementById("n").value;
	  var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	     document.getElementById("demo").innerHTML = this.responseText;
	    }
	  };
	  xhttp.open("GET", "saveComment.jsp?com="+name, true);
	  xhttp.send();
	}


</script>
</body>
</html> 
