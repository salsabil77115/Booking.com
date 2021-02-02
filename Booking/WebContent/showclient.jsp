<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View Client</title>
</head>
<style>
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	text-align: left;
	padding: 8px;
	font-weight: bold;
}
</style>
<body>
	<h1 style="color: blue; font-weight: bold">Client Information</h1>
	<%
        
            String url = "jdbc:mysql://localhost:3306/hotelbook";
            String user = "salsabil";
            String password = "123";
            String Line;
            Connection Con = null;
            Statement Stmt = null;
            ResultSet RS = null;
            Con = DriverManager.getConnection(url, user, password);

            	String name=request.getParameter("name");
             
                PreparedStatement ps=Con.prepareStatement("select * FROM `client` where `Name`like ?");
              ps.setString(1,"%"+name+"%");
                RS=ps.executeQuery();
                if(RS.next()){ %>
	<table border="1">
		<tr>
			<th>Email</th>
			<th>Phone Number</th>
		</tr>
		<% do{ 	%>

		<tr>
			<td><%=RS.getString("email")%></td>
			<td>0<%=RS.getString("Phone_number")%></td>
		</tr>
		<%  }while (RS.next());
        
            }
            Con.close();%>
	</table>
	<br />
</body>
</html>

