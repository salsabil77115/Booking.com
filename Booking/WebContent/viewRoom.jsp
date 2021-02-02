<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Rooms</title>
</head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<body class="w3-light-grey">

	<%
if( request.getSession().getAttribute("client_Id")!=null){
	%>
	<div class="w3-bar w3-white w3-large">
		<a href="customerhome.jsp"
			class="w3-bar-item w3-button w3-blue w3-mobile"><i
			class="fa fa-bed w3-margin-right"></i>Home Away</a> <a
			href="viewHotelphoto" class="w3-bar-item w3-button w3-mobile">View
			Hotels</a> <a href="cancelBooking.jsp"
			class="w3-bar-item w3-button w3-mobile">Cancel reservation</a> <a
			href="profile.jsp"
			class="w3-bar-item w3-button w3-right w3-light-grey w3-mobile">Profile</a>

		<a href="Logout"
			class="w3-bar-item w3-button w3-right w3-light-grey w3-mobile">LogOut</a>
	</div>
	<br>
	<% 
}
String url = "jdbc:mysql://localhost:3306/hotelbook";
String user = "salsabil";
String password = "123";
    Connection Con = null;
    ResultSet RS=null;
    ResultSet RS1=null;
    ResultSet RS2=null;
    ResultSet RS3=null;

  
    Con = DriverManager.getConnection(url, user, password);
String adult=request.getParameter("Adults");
String Kids=request.getParameter("Kids");
String In=request.getParameter("In");
String Out=request.getParameter("out");
String hotelId=request.getParameter("id"); 

PreparedStatement ps3=Con.prepareStatement("SELECT * FROM `room` WHERE hotel_id=? And statue=? AND number_of_children=? AND number_of_adult=?" );
ps3.setString(1, hotelId);
ps3.setString(2,"available");
ps3.setString(3, Kids);
ps3.setString(4,adult);

RS3=ps3.executeQuery();
if(RS3.next()){
	
	String room=RS3.getString("room_id");
String room_type=RS3.getString("room_type");
String room_rate=RS3.getString("room_rate");
String price=RS3.getString("price");
String room_facilities=RS3.getString("room_facilities");
PreparedStatement ps=Con.prepareStatement("select * FROM `room_image` WHERE `room_id`=?" );
ps.setString(1,room );
RS=ps.executeQuery();

if(RS.next()){

	%>
	<div class="column">
		<div class="card">
			<% do{ %>
			<img src="<%=RS.getString("dir")%>" alt="Jane"
				style="width: 100%; height: 300px;">
			<% }while(RS.next());%>
			<div class="container">
				<h2><%=room_type%></h2>
				<p class="title"><%=room_rate %></p>
				<p class="title"><%=price%>
					For night
				</p>
				<p>
					room_facilities:<%=room_facilities%></p>
				<p>
					<a
						href="confirmBooking?price=<%=price%>&roomid=<%=room %>&Adults=<%=adult%>&Kids=<%=Kids%>&id=<%=hotelId %>&In=<%=In %>&out=<%=Out %>"
						class="button">Book now</a>
				</p>
			</div>
		</div>
	</div>
	<%}

	}
else{
	
		out.print("<p style='font-size:20px;'>This Room is Booked or Not found</p>");}

%>
</body>
</html>