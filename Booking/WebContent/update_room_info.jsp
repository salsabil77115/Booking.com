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
<title>Update Room info</title>
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
	if (request.getParameter("room_id") != null && request.getParameter("statues") != null
			&& request.getParameter("room_type") != null && request.getParameter("room_facilities") != null
			&& request.getParameter("price") != null && request.getParameter("number_of_adult") != null
			&& request.getParameter("number_of_children") != null && request.getParameter("room_numberPhone") != null) {

		String room_id = request.getParameter("room_id");
		String statues = request.getParameter("statues");
		String room_type = request.getParameter("room_type");
		String room_facilities = request.getParameter("room_facilities");
		String price = request.getParameter("price");
		String number_of_adult = request.getParameter("number_of_adult");
		String number_of_children = request.getParameter("number_of_children");
		String room_numberPhone = request.getParameter("room_numberPhone");
		PreparedStatement ps2 = Con.prepareStatement(
		"Update `room` set `room_type`=?,`room_facilities`=?,`price`=?,`room_numberPhone`=?,`number_of_children`=?,`number_of_adult`=?,`statue`=? where `room_id`=?");
		ps2.setString(1, room_type);
		ps2.setString(2, room_facilities);
		ps2.setString(3, price);
		ps2.setString(4, room_numberPhone);
		ps2.setString(5, number_of_children);
		ps2.setString(6, number_of_adult);
		ps2.setString(7, statues);
		ps2.setString(8, room_id);
		int x = ps2.executeUpdate();
		if (x != 0) {
			response.sendRedirect("adminHome.jsp?updateRoom=Room information Updated Successfully");
		} else {
			response.sendRedirect("adminHome.jsp?updateRoom=There is a problem in updating information");
		}
	} else {

		String room_id = request.getParameter("id");
		String path = "";
		statement = Con.createStatement();
		String sql = "select * from room where room_id=" + room_id;
		resultSet = statement.executeQuery(sql);
		if (resultSet.next()) {

			PreparedStatement ps = Con.prepareStatement("select * FROM `room_image` WHERE `room_id`=" + room_id);
			RS = ps.executeQuery();
			if (RS.next()) {
		path = RS.getString("dir");
			}
	%>

	<div class="column">

		<div class="card">
			<form method="post" action="update_room_info.jsp">
				<img src="<%=path%>" style="width: 100%; height: 300px;"> <input
					type="hidden" name="room_id"
					value="<%=resultSet.getString("room_id")%>"> <br>
				statues:<br> <input type="text" name="statues"
					value="<%=resultSet.getString("statue")%>"> <br>
				room_type:<br> <input type="text" name="room_type"
					value="<%=resultSet.getString("room_type")%>"> <br>
				room_facilities:<br> <input type="text" name="room_facilities"
					value="<%=resultSet.getString("room_facilities")%>"> <br>
				price:<br> <input type="text" name="price"
					value="<%=resultSet.getString("price")%>"> <br>
				room_numberPhone:<br> <input type="text"
					name="room_numberPhone"
					value="<%=resultSet.getString("room_numberPhone")%>"> <br>
				number_of_children:<br> <input type="text"
					name="number_of_children"
					value="<%=resultSet.getString("number_of_children")%>"> <br>
				number_of_adult:<br> <input type="text" name="number_of_adult"
					value="<%=resultSet.getString("number_of_adult")%>"> <br>
				<br> <input type="submit" value="submit">
			</form>
		</div>
	</div>
	<%
		} else {
	response.sendRedirect("adminHome.jsp?updateRoom=Invalid ID");

	}
	}
	Con.close();
	%>
</body>
</html>
