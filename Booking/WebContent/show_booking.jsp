
<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<%@page import="java.sql.Statement"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%
	String form_date = request.getParameter("from");
String to_date = request.getParameter("to");
String url = "jdbc:mysql://localhost:3306/hotelbook";
String user = "salsabil";
String password = "123";
String Line;
Connection Con = null;
ResultSet RS = null;
Con = DriverManager.getConnection(url, user, password);
Connection connection = null;
Statement statement = null;
%>
<html>
<head>
<title>Show Booking</title>

</head>
<body>
	<h1 style="font-size: 25px;">Show booking history</h1>

	<%
		try {
		PreparedStatement ps1 = Con.prepareStatement("select * from booking where booking_date between ? and ?");
		ps1.setString(1, form_date);
		ps1.setString(2, to_date);
		RS = ps1.executeQuery();
		if (RS.next()) {
	%>
	<table border="1">
		<tr>
			<td>Booking ID</td>
			<td>Hotel Id</td>
			<td>Room id</td>
			<td>Client Id</td>
			<td>Booking Date</td>
			<td>Arrival Date</td>
			<td>departure Date</td>
			<td>Number Of Children</td>
			<td>Number Of Adult</td>

		</tr>
		<%
			do {
		%>

		<tr>
			<td><%=RS.getString("Booking_id")%></td>
			<td><%=RS.getString("hotel_id")%></td>
			<td><%=RS.getString("room_id")%></td>
			<td><%=RS.getString("client_Id")%></td>
			<td><%=RS.getString("booking_date")%></td>
			<td><%=RS.getString("arrival_date")%></td>
			<td><%=RS.getString("departure_date")%></td>
			<td><%=RS.getString("number_of_children")%></td>
			<td><%=RS.getString("number_of_adult")%></td>
		</tr>

		<%
			} while (RS.next());
		} else {
		%>
	</table>
	<%
		out.print("Not found this period!");
	}
	connection.close();
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>

</body>
</html>
