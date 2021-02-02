<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=ISO-8859-1>
<title>Hotel Search</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="css/search.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
	<%
		if (request.getSession().getAttribute("client_Id") != null) {
	%>

	<div class="w3-bar w3-white w3-large">
		<a href="customerhome.jsp"
			class="w3-bar-item w3-button w3-blue w3-mobile"><i
			class="fa fa-bed w3-margin-right"></i>Home Away</a> <a
			href="customerhome.jsp" class="w3-bar-item w3-button w3-mobile">Cancel
			reservation</a> <a href="profile.jsp"
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
	ResultSet RS = null;
	ResultSet RS1 = null;
	ResultSet RS2 = null;
	ResultSet RS3 = null;
	ResultSet RS4 = null;
	int expectedPrice = 0;
	int size = 0;
	Con = DriverManager.getConnection(url, user, password);

	int Rate = 0;
	int size1 = 0;
	String id = "";
	float avg = 0;
	int count = 0;

	if (request.getParameter("loc") != null && request.getParameter("CheckIn") != null
			&& request.getParameter("CheckOut") != null && request.getParameter("Kids") != null
			&& request.getParameter("Adults") != null) {
	String location = request.getParameter("loc");
	String CheckIn = request.getParameter("CheckIn");
	String CheckOut = request.getParameter("CheckOut");
	String Kids = request.getParameter("Kids");
	String Adults = request.getParameter("Adults");

	String roomId = "";
	%>
	<div class="row">
		<%
			PreparedStatement ps = Con.prepareStatement("select * FROM `hotel` where `Address` Like ?");
		ps.setString(1, "%" + location + "%");
		RS = ps.executeQuery();
		if (RS.next()) {
			do {
				id = RS.getString("hotel_id");
				expectedPrice = 0;
				size = 0;
				PreparedStatement ps3 = Con.prepareStatement(
				"select * FROM `room` where  `hotel_id`=? and `number_of_children`=? and `number_of_adult`=?");
				ps3.setString(1, id);
				ps3.setString(2, Kids);
				ps3.setString(3, Adults);
				RS3 = ps3.executeQuery();
				if (RS3.next()) {
			do {

				expectedPrice = expectedPrice + RS3.getInt("price");
				size++;

			} while (RS3.next());

			PreparedStatement ps1 = Con.prepareStatement("select * FROM `hotel_image` WHERE `hotel_id`=" + id);
			RS1 = ps1.executeQuery();
			if (RS1.next()) {
				PreparedStatement ps2 = Con.prepareStatement("select * FROM `Rate` where `hotel_id`=" + id);
				RS2 = ps2.executeQuery();
				if (RS2.next()) {
					do {
						Rate = Rate + RS2.getInt("client_Rate");
						size1++;
					} while (RS2.next());
					avg = (float) Rate / (float) size1;
				}
		%>

		<div class="column">

			<div class="card">

				<img src="<%=RS1.getString("dir")%>" alt="Jane"
					style="width: 100%; height: 400px;">
				<div class="container">
					<h2><%=RS.getString("hotel_Name")%></h2>
					<p class="title">
						Mobile:<%=RS.getString("contact_information_mobile")%></p>
					<p class="title">
						Email:<%=RS.getString("contact_information_email")%></p>
					<p>
						Address:<%=RS.getString("Address")%></p>
					<p>
						Rate:<%=avg%></p>


					<%
						int i = 0;
					int star = RS.getInt("hotel_stars");
					while (i < star) {
					%>
					<span class="fa fa-star checked"></span>
					<%
						i++;
					}
					%>

					<p>
						Meals:<%=RS.getString("meals")%>
					<p>
						expectedPrice:<%=(expectedPrice / size)%>
					<p>
						<a class="button"
							href="viewRoom.jsp?id=<%=RS1.getInt("hotel_id")%>&Adults=<%=Adults%>&Kids=<%=Kids%>&In=<%=CheckIn%>&out=<%=CheckOut%>">View</a>
					</p>
					<p>
						<a href="Googlemap.jsp?id=<%=RS1.getInt("hotel_id")%>"
							class="button">View on Google maps</a>
					</p>

				</div>
			</div>
		</div>

		<%
			} else {
		out.print("invalid Query");
		}
		} else {
		count++;
		}
		} while (RS.next());
		} else {
		%>
		<p>not found
		<p>
			<%
				}
			}
			if (count != 0) {
			%>
		
		<p style="font-size: 20px; color: blue; font-weight: bold;">not
			found
		<p>

			<% }%>
		
	</div>

</body>
</html>