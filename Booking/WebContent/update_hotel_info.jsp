<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<%@page import="java.sql.Statement"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Hotel Info</title>
<link rel="stylesheet" href="css/updateHotel_info.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
			class="w3-bar-item w3-button w3-blue w3-mobile"><i
			class="fa fa-bed w3-margin-right"></i>Home Away</a> <a
			href="check_in_out.jsp" class="w3-bar-item w3-button w3-mobile">in
			out</a> <a href="#Book" class="w3-bar-item w3-button w3-mobile">Book
			list</a> <a href="#history" class="w3-bar-item w3-button w3-mobile">Book
			history</a> <a href="#search" class="w3-bar-item w3-button w3-mobile">Search
			Client</a> <a href="#cancel" class="w3-bar-item w3-button w3-mobile">Cancel
			Book</a> <a href="#update" class="w3-bar-item w3-button w3-mobile">Update
			Hotel </a> <a href="upload_emage.jsp"
			class="w3-bar-item w3-button w3-mobile">Update photos</a> <a
			href="#contact" class="w3-bar-item w3-button w3-mobile">Update
			room </a> <a href="#Rate" class="w3-bar-item w3-button w3-mobile">Rating&Comments</a>

		<a href="Logout"
			class="w3-bar-item w3-button w3-right w3-light-grey w3-mobile">LogOut</a>
	</div>
	<%
		String url = "jdbc:mysql://localhost:3306/hotelbook";
	String user = "salsabil";
	String password = "123";
	String Line;
	Connection Con = null;
	Statement Stmt = null;
	ResultSet resultSet = null;
	Statement statement = null;
	ResultSet RS = null;
	Con = DriverManager.getConnection(url, user, password);
	if (request.getParameter("hotel_Name") != null && request.getParameter("address") != null
			&& request.getParameter("mobile") != null && request.getParameter("email") != null
			&& request.getParameter("meals") != null) {
		String hotel_Name = request.getParameter("hotel_Name");
		String address = request.getParameter("address");
		String mobile = request.getParameter("mobile");
		String email = request.getParameter("email");
		String id = request.getParameter("id");

		String meals = request.getParameter("meals");
		PreparedStatement ps2 = Con.prepareStatement(
		"Update `hotel` set `hotel_Name`=?,`Address`=?,`meals`=?,`contact_information_mobile`=?,`contact_information_email`=? where `hotel_id`=?");
		ps2.setString(1, hotel_Name);
		ps2.setString(2, address);
		ps2.setString(3, meals);
		ps2.setString(4, mobile);
		ps2.setString(5, email);
		ps2.setString(6, id);
		int x = ps2.executeUpdate();
		if (x != 0) {
			response.sendRedirect("adminHome.jsp?update=Hotel information Updated Successfully");
		} else {
			response.sendRedirect("adminHome.jsp?update=There is a problem in updating information");
		}
	} else {
		String hotel_id = request.getParameter("id");

		String path = "";

		String sql = "select * from hotel where hotel_id=" + hotel_id;
		statement = Con.createStatement();
		resultSet = statement.executeQuery(sql);
		if (resultSet.next()) {

			PreparedStatement ps = Con.prepareStatement("select * FROM `hotel_image` WHERE `hotel_id`=" + hotel_id);
			RS = ps.executeQuery();
			if (RS.next()) {
		path = RS.getString("dir");
			}
	%>

	<div class="column">

		<div class="card">
			<form method="get" action="update_hotel_info.jsp">
				<img src="<%=path%>" style="width: 100%; height: 200px;"> <br>
				<%
					int i = 0;
				int x = resultSet.getInt("hotel_stars");
				while (i < x) {
				%>
				<span class="fa fa-star checked"></span>

				<%
					i++;
				}
				%><br> <input name="id" type="text" readonly
					value="<%=resultSet.getString("hotel_id")%>"> <br>
				Hotel Name:<br> <input type="text" name="hotel_Name"
					value="<%=resultSet.getString("hotel_Name")%>"> <br>
				Address:<br> <input type="text" name="address"
					value="<%=resultSet.getString("Address")%>"> <br>
				Hotel Meals:<br> <input type="text" name="meals"
					value="<%=resultSet.getString("meals")%>"> <br>
				Mobile:<br> <input type="text" name="mobile"
					value="<%=resultSet.getString("contact_information_mobile")%>">
				<br> Email:<br> <input type="email" name="email"
					value="<%=resultSet.getString("contact_information_email")%>">
				<br> <br> <input style="cursor: pointer;" type="submit"
					value="submit">
			</form>
		</div>
	</div>
	<%
		} else {
	response.sendRedirect("adminHome.jsp?update= invalid ID");
	}
	}
	Con.close();
	%>
</body>
</html>