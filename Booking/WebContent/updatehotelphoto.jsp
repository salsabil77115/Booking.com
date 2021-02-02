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
<title>update Hotel Photo</title>
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

	if (request.getParameter("image") != null && request.getParameter("dir") != null) {
		String id = request.getParameter("image");
		String dir = request.getParameter("dir");
		PreparedStatement ps4 = Con.prepareStatement("UPDATE `hotel_image` SET `dir`=? WHERE `id`=? ");
		ps4.setString(1, dir);
		ps4.setString(2, id);

		int y = ps4.executeUpdate();
		if (y != 0) {
			response.sendRedirect("adminHome.jsp?add= Update Successfully");

		} else {
			response.sendRedirect("adminHome.jsp?add=Error in Update");

		}

	} else {
		String hotel_id = request.getParameter("id");
		String dir = request.getParameter("dir");

		String sql = "select * from hotel where hotel_id=" + hotel_id;
		statement = Con.createStatement();
		resultSet = statement.executeQuery(sql);
		if (resultSet.next()) {

			PreparedStatement ps = Con.prepareStatement("select * FROM `hotel_image` WHERE `hotel_id`=" + hotel_id);
			RS = ps.executeQuery();
			if (RS.next()) {
	%>
	<div class="column">

		<div class="card">
			<%
				do {
			%>


			<form method="get" action="updatehotelphoto.jsp">
				<img src="<%=RS.getString("dir")%>"
					style="width: 100%; height: 200px;"><br> <input
					type="hidden" value="<%=dir%>" name="dir">
				<p><%=RS.getInt("id")%></p>
				<%
					} while (RS.next());
				}
				%>
				<br>Choose image ID <input type="number" name="image">
				<input style="cursor: pointer;" type="submit" value="submit">
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