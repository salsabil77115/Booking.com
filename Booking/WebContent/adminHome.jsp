<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Home</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="css/admin.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
</head>

<body class="w3-light-grey">

	<div class="w3-bar w3-white w3-large">
		<a href="adminHome.jsp"
			class="w3-bar-item w3-button w3-blue w3-mobile"> <i
			class="fa fa-bed w3-margin-right"></i>Home Away
		</a> <a href="#" class="w3-bar-item w3-button w3-mobile">in out</a> <a
			href="#Book" class="w3-bar-item w3-button w3-mobile">Book list</a> <a
			href="#history" class="w3-bar-item w3-button w3-mobile">Book
			history</a> <a href="#search" class="w3-bar-item w3-button w3-mobile">Search
			Client</a> <a href="#cancel" class="w3-bar-item w3-button w3-mobile">Cancel
			Book</a> <a href="#update" class="w3-bar-item w3-button w3-mobile">Update
			Hotel </a> <a href="#updateRoom" class="w3-bar-item w3-button w3-mobile">Update
			room </a> <a href="#Addroom" class="w3-bar-item w3-button w3-mobile">Add
			room </a> <a href="#Rate" class="w3-bar-item w3-button w3-mobile">Rating&Comments</a>
		<a href="Logout"
			class="w3-bar-item w3-button w3-right w3-light-grey w3-mobile">LogOut</a>
	</div>
	<%
		if (request.getParameter("msg") != null) {
		String msg = request.getParameter("msg");
		out.print("<p>" + msg + "</p>");

	}
	if (request.getParameter("make") != null) {

		String x = request.getParameter("make");
	%>
	<p><%=x%></p>
	<%
		}
	%>
	<!-- Header -->
	<header class="w3-display-container w3-content"
		style="max-width: 1500px;">
		<img class="w3-image" src="image/5.jpg" alt="The Hotel"
			style="min-width: 1000px" width="100%" height="300">
		<div class="w3-display-left w3-padding w3-col l6 m8" id="search">
			<div class="w3-container w3-blue">
				<h2>
					<i class="fa fa-bed w3-margin-right"></i>Client Name
				</h2>
			</div>
			<div class="w3-container w3-white w3-padding-16">
				<div class="w3-row-padding" style="margin: 8px -16px;">
					<div class="w3-half w3-margin-bottom">
						<label><i class="fa fa-male"></i> name</label> <input
							class="w3-input w3-border" type="text" id="name"
							placeholder="write Comment.. " required>
					</div>
					<div class="w3-half">
						<br>
						<button onclick="loadDoc()" class="w3-button w3-dark-grey"
							type="submit">
							<i class="fa fa-search w3-margin-right"></i> Search
						</button>
					</div>
				</div>
			</div>
		</div>
	</header>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<!-- Page content -->

	<header class="w3-display-container w3-content"
		style="max-width: 1500px;">

		<div class="w3-display-left w3-padding w3-col l6 m8" id="cancel">
			<div class="w3-container w3-blue">
				<h2>
					<i class="fa fa-bed w3-margin-right"></i>Cancel Booking
				</h2>
			</div>
			<div class="w3-container w3-white w3-padding-16">
				<div class="w3-row-padding" style="margin: 0 -16px;">
					<div class="w3-half w3-margin-bottom">
						<label><i class="fa fa-calendar-o"></i> Booking ID</label> <input
							class="w3-input w3-border" type="number" placeholder=" ID..."
							id="Id" required>
					</div>

				</div>
				<div class="w3-half">
					<br>
					<button onclick="loadDoc1()"
						style="padding-left: 40px; padding-right: 50px;"
						class="w3-button w3-dark-grey" type="submit">
						<i class="fa fa-search w3-margin-right"></i> Cancel
					</button>
				</div>

			</div>


		</div>
	</header>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<div class="w3-content" style="max-width: 1532px;">

		<div class="w3-container w3-margin-top" id="Book">
			<h3>Booking List</h3>

			<%
				String url = "jdbc:mysql://localhost:3306/hotelbook";
			String user = "salsabil";
			String password = "123";
			String Line;
			Connection Con = null;
			Statement Stmt = null;
			ResultSet RS = null;
			ResultSet RS1 = null;
			ResultSet RS2 = null;
			ResultSet RS3 = null;
			ResultSet RS4 = null;

			Con = DriverManager.getConnection(url, user, password);
			Stmt = Con.createStatement();
			RS = Stmt.executeQuery("SELECT * FROM booking;");
			if (RS.next()) {
			%>
			<table border="1">
				<tr>
					<th>Booking id</th>
					<th>Arrival date</th>
					<th>Hotel id</th>
					<th>Client id</th>
					<th>Departure date</th>
					<th>Number of children</th>
					<th>number of adults</th>
					<th>Booking date</th>
					<th>Room id</th>
					<th>statues</th>
				</tr>
				<%
					do {
				%>
				<tr>
					<td><%=RS.getString("Booking_id")%></td>
					<td><%=RS.getString("arrival_date")%></td>
					<td><%=RS.getString("hotel_id")%></td>
					<td><%=RS.getString("client_Id")%></td>
					<td><%=RS.getString("departure_date")%></td>
					<td><%=RS.getString("number_of_children")%></td>
					<td><%=RS.getString("number_of_adult")%></td>
					<td><%=RS.getString("booking_date")%></td>
					<td><%=RS.getString("room_id")%></td>
					<td><%=RS.getString("statues")%></td>
				</tr>

				<%
					} while (RS.next());
				}
				%>
			</table>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>

	<br>
	<br>
	<br>

	<header class="w3-display-container w3-content"
		style="max-width: 1532px;">

		<div class="w3-display-left w3-padding w3-col l6 m8" id="history"
			style="width: 100%">
			<div class="w3-container w3-blue">
				<h2>
					<i class="fa fa-bed w3-margin-right"></i>View Booking in Specific
					Period
				</h2>
			</div>
			<div class="w3-container w3-white w3-padding-16">
				<div class="w3-row-padding" style="margin: 0 -16px;">
					<div class="w3-half w3-margin-bottom">
						<label><i class="fa fa-calendar-o"></i> Check In</label> <input
							class="w3-input w3-border" type="date" placeholder="DD MM YYYY"
							id="in" name="CheckIn" required>
					</div>
					<div class="w3-half">
						<label><i class="fa fa-calendar-o"></i> Check Out</label> <input
							class="w3-input w3-border" type="date" placeholder="DD MM YYYY"
							id="out" name="CheckOut" required>
					</div>

				</div>
				<div class="w3-half">
					<br>
					<button onclick="loadDoc2()"
						style="padding-left: 50px; padding-right: 50px;"
						class="w3-button w3-dark-grey" type="submit">
						<i class="fa fa-search w3-margin-right"></i> View
					</button>
				</div>

			</div>


		</div>
	</header>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="w3-row-padding" id="about">
		<div class="w3-col l4 12">
			<h3>About</h3>
			<h6>Our hotel is one of a kind. It is truely amazing. Lorem
				ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
				tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
				veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex
				ea commodo consequat. Duis aute irure dolor in reprehenderit in
				voluptate velit esse cillum dolore eu fugiat nulla pariatur.
				Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
				officia deserunt mollit anim id est laborum consectetur adipiscing
				elit, sed do eiusmod tempor incididunt ut labore et dolore magna
				aliqua. Ut enim ad minim veniam.</h6>
			<p>
				We accept: <i class="fa fa-credit-card w3-large"></i> <i
					class="fa fa-cc-mastercard w3-large"></i> <i
					class="fa fa-cc-amex w3-large"></i> <i
					class="fa fa-cc-cc-visa w3-large"></i><i
					class="fa fa-cc-paypal w3-large"></i>
			</p>
		</div>
		<div class="w3-col l8 12">
			<img src="image/map.jpg" class="w3-image" style="width: 100%;">
		</div>
	</div>

	<div class="w3-row-padding w3-large w3-center" style="margin: 32px 0">
		<div class="w3-third">
			<i class="fa fa-map-marker w3-text-blue"></i> 423 Some adr, Chicago,
			US
		</div>
		<div class="w3-third">
			<i class="fa fa-phone w3-text-blue"></i> Phone: +00 151515
		</div>
		<div class="w3-third">
			<i class="fa fa-envelope w3-text-blue"></i> Email: mail@mail.com
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<header class="w3-display-container w3-content"
		style="max-width: 1500px;">

		<div class="w3-display-left w3-padding w3-col l6 m8" id="updateRoom">
			<div class="w3-container w3-blue">
				<h2>
					<i class="fa fa-bed w3-margin-right"></i>Update Room information
				</h2>
			</div>
			<form action="update_room_info.jsp">
				<div class="w3-container w3-white w3-padding-16">
					<div class="w3-row-padding" style="margin: 0 -16px;">
						<div class="w3-half w3-margin-bottom">
							<label><i class="fa fa-calendar-o"></i> Room ID</label> <input
								class="w3-input w3-border" type="number" placeholder=" ID..."
								name="id" required>
						</div>

					</div>
					<div class="w3-half">
						<br>
						<button style="padding-left: 40px; padding-right: 50px;"
							class="w3-button w3-dark-grey" type="submit">
							<i class="fa fa-search w3-margin-right"></i> View
						</button>
					</div>

				</div>
			</form>
			<%
				if (request.getParameter("updateRoom") != null) {
				String update = request.getParameter("updateRoom");
				out.print("<p>" + update + "</p>");
			}
			%>
		</div>
	</header>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="w3-container" id="Rate">
		<h2>Rating & Comments</h2>

		<div class="w3-row-padding w3-padding-16">
			<%
				float rate = 0;
			int size = 0;
			String id = "";
			float avg = 0;
			PreparedStatement ps1 = Con.prepareStatement("select * FROM `hotel`");
			RS1 = ps1.executeQuery();
			if (RS1.next()) {
				do {
					size = 0;
					rate = 0;
					id = RS1.getString("hotel_id");
					String name = RS1.getString("hotel_Name");
					PreparedStatement ps2 = Con.prepareStatement("select * FROM `hotel_image` where `hotel_id`=" + id);
					RS2 = ps2.executeQuery();
					if (RS2.next()) {
				PreparedStatement ps3 = Con.prepareStatement("select * FROM `rate` where `hotel_id`=" + id);
				RS3 = ps3.executeQuery();
				if (RS3.next()) {
					do {
						rate = rate + RS3.getInt("client_Rate");
						size++;

					} while (RS3.next());
				}
				avg = (float) rate / (float) size;
				if (rate == 0 && size == 0) {
					avg = 0;
				}
			%>
			<div class="w3-third w3-margin-bottom" style="height: 500px;">

				<img src="image/<%=RS2.getString("dir")%>" alt="Norway"
					style="width: 100%; height: 285px;">
				<div class="w3-container w3-white">
					<h3><%=name%></h3>
					<p>
						Rate:<%=avg%></p>
					<p style="font-size: 20px; font-weight: bold;">Comments</p>
					<%
						PreparedStatement ps4 = Con.prepareStatement("select * FROM `comments` where `hotel_id`=" + id);
					RS4 = ps4.executeQuery();
					if (RS4.next()) {
						do {
					%>
					<p style="font-size: 20px;"><%=RS4.getString("comment")%></p>
					<br>
					<%
						} while (RS4.next());
					} else {
					%>
					<p style="font-size: 20px;">No Comments until Now</p>
					<br>

					<%
						}
					%>

				</div>

			</div>
			<%
				}
			} while (RS1.next());
			}
			%>

		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<header class="w3-display-container w3-content"
		style="max-width: 1500px;">

		<div class="w3-display-left w3-padding w3-col l6 m8" id="update">
			<div class="w3-container w3-blue">
				<h2>
					<i class="fa fa-bed w3-margin-right"></i>Update Hotel information
				</h2>
			</div>
			<form action="update_hotel_info.jsp">
				<div class="w3-container w3-white w3-padding-16"
					style="height: 240px;">
					<div class="w3-row-padding" style="margin: 0 -16px;">
						<div class="w3-half w3-margin-bottom">
							<label><i class="fa fa-calendar-o"></i> Hotel ID</label> <input
								class="w3-input w3-border" type="number" placeholder=" ID..."
								name="id" required>
						</div>

					</div>
					<div class="w3-half">
						<br>
						<button style="padding-left: 40px; padding-right: 50px;"
							class="w3-button w3-dark-grey" type="submit">
							<i class="fa fa-search w3-margin-right"></i> View
						</button>
					</div>

				</div>
			</form>
			<%
				if (request.getParameter("update") != null) {
				String update = request.getParameter("update");
				out.print("<p>" + update + "</p>");
			}
			%>
		</div>
		<div class="w3-display-right w3-padding w3-col l6 m8" id="updatephoto">
			<div class="w3-container w3-blue">
				<h2>
					<i class="fa fa-bed w3-margin-right"></i>Add New Hotel photo
				</h2>
			</div>
			<form action="update_photo.jsp">
				<div class="w3-container w3-white w3-padding-16">
					<div class="w3-row-padding" style="margin: 0 -16px;">
						<div class="w3-half w3-margin-bottom">
							<label><i class="fa fa-calendar-o"></i> Hotel ID</label> <input
								class="w3-input w3-border" type="number" placeholder=" ID..."
								name="id" required>

						</div>
						<div class="w3-half w3-margin-bottom">
							<label><i class="fa fa-calendar-o"></i>Choose photo</label> <input
								class="w3-input w3-border" type="file" placeholder=" ID..."
								name="path" required>

						</div>
					</div>
					<div class="w3-row-padding" style="margin: 0 -16px;"></div>

					<div class="w3-half">
						<br>
						<button style="padding-left: 40px; padding-right: 50px;"
							class="w3-button w3-dark-grey" type="submit">
							<i class="fa fa-search w3-margin-right"></i> View
						</button>
					</div>

				</div>
			</form>
			<%
				if (request.getParameter("add") != null) {
				String update = request.getParameter("add");
				out.print("<p>" + update + "</p>");
			}
			%>
		</div>
	</header>
	<br>
	<br>
	<div id="Addroom">
		<button onclick="loadDoc3()">Add Room</button>
		<%
			if (request.getParameter("addRoom") != null) {
			String add = request.getParameter("addRoom");
			out.print("<p>" + add + "</p>");

		}
		%>
	</div>
	<br>
	<br>
	<br>
	<!-- Footer -->
	<footer class="w3-padding-32 w3-black w3-center w3-margin-top">
		<h5>Find Us On</h5>
		<div class="w3-xlarge w3-padding-16">
			<i class="fa fa-facebook-official w3-hover-opacity"></i> <i
				class="fa fa-instagram w3-hover-opacity"></i> <i
				class="fa fa-snapchat w3-hover-opacity"></i> <i
				class="fa fa-pinterest-p w3-hover-opacity"></i> <i
				class="fa fa-twitter w3-hover-opacity"></i> <i
				class="fa fa-linkedin w3-hover-opacity"></i>
		</div>
		<p class="copyright-text">
			Copyright &copy; 2021 All Rights Reserved by <a href="#">FCAI</a>.
		</p>
		<p class="w3-hover-text-green">Powered by Salsabil Mohamed</p>
	</footer>

	<!-- Add Google Maps -->
	<script>
		function loadDoc() {
			var name = document.getElementById("name").value;
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					document.getElementById("search").innerHTML = this.responseText;
				}
			};
			xhttp.open("GET", "showclient.jsp?name=" + name, true);
			xhttp.send();
		}
		function loadDoc1() {
			var id = document.getElementById("Id").value;
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					document.getElementById("cancel").innerHTML = this.responseText;
				}
			};
			xhttp.open("GET", "cancel_reservation.jsp?id=" + id, true);
			xhttp.send();
		}
		function loadDoc2() {
			var from = document.getElementById("in").value;
			var to = document.getElementById("out").value;

			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					document.getElementById("history").innerHTML = this.responseText;
				}
			};
			xhttp.open("GET", "show_booking.jsp?to=" + to + "&from=" + from,
					true);
			xhttp.send();
		}
		function loadDoc3() {

			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					document.getElementById("Addroom").innerHTML = this.responseText;
				}
			};
			xhttp.open("GET", "addroom.jsp", true);
			xhttp.send();
		}
	</script>
</body>
</html>