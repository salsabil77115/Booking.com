<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<title>Hotel Photos</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body class="w3-light-grey">
	<div class="w3-bar w3-white w3-large">
		<a href="customerhome.jsp"
			class="w3-bar-item w3-button w3-blue w3-mobile"><i
			class="fa fa-bed w3-margin-right"></i>Home Away</a> <a
			href="customerhome.jsp" class="w3-bar-item w3-button w3-mobile">Book
			Now</a> <a href="customerhome.jsp"
			class="w3-bar-item w3-button w3-mobile">Cancel Booking</a> <a
			href="profile.jsp" class="w3-bar-item w3-button w3-mobile">Profile</a>

		<a href="Logout"
			class="w3-bar-item w3-button w3-right w3-light-grey w3-mobile">LogOut</a>
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
int size=0;
int Rate=0;
float avg=0;
  
    Con = DriverManager.getConnection(url, user, password);
    PreparedStatement ps1=Con.prepareStatement("select * FROM `hotel`");
    RS1=ps1.executeQuery();
    if(RS1.next()){
    	
  do{
	  size=0;
	  Rate=0;
    	int id=RS1.getInt("hotel_id");

    PreparedStatement ps=Con.prepareStatement("select * FROM `hotel_image` where `hotel_id`="+id);
    RS=ps.executeQuery(); 
    	if(RS.next()){  
    		PreparedStatement ps2=Con.prepareStatement("select * FROM `Rate` where `hotel_id`="+id);
    	    RS2=ps2.executeQuery();
    	    if(RS2.next()){
    	    	do{
    	    		Rate=Rate+RS2.getInt("client_Rate");
    	    		size++;
    	    	}while(RS2.next());
    	    }
    	    avg=(float)Rate/(float)size;
    		if(Rate==0&&size==0){
    			avg=0;
    		}
    		%>



	<div class="column">
		<div class="card">
			<p style="text-align: center; font-size: 20px; font-weight: bold;"><%=RS1.getString("hotel_Name") %>
			<p>
				<% do{%>

				<img src="<%=RS.getString("dir") %>" alt="Jane"
					style="width: 30%; margin-left: 10px; height: 150px;">
				<%}while(RS.next()); %>
			
			<div class="container">
				<p class="title">
					Rate:<%=avg %></p>
				<%int i=0;
        int star=RS1.getInt("hotel_stars"); 
        while(i<star){%>
				<span class="fa fa-star checked"></span>
				<%i++;} %>
			</div>
		</div>
	</div>
	<%}
  }while(RS1.next());} %>

</body>
</html>
