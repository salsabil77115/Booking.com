<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "javax.servlet.*,java.text.*" %>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import ="java.util.*"%>
<%@ page import ="java.sql.*"%>
<%@ page import ="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Google map</title>
</head>
 <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBfqLk3z4qqb6Ie4Km-NGuy4H43gDTjFcA&callback=initMap&libraries=&v=weekly"
      defer
    ></script>
<style>
     #map {
        height: 600px;
        /* The height is 400 pixels */
        width: 100%;
        /* The width is the width of the web page */
      }

</style>



<%
String url = "jdbc:mysql://localhost:3306/hotelbook";
String user = "salsabil";
String password = "123";
Connection Con = null;
ResultSet RS = null;
ResultSet RS1 = null;

Con = DriverManager.getConnection(url, user, password);
if(request.getParameter("id")!=null){
	String id=request.getParameter("id");
	PreparedStatement ps=Con.prepareStatement("select * FROM `hotel` where `hotel_id` = ?"); 
	ps.setString(1,id);
	RS=ps.executeQuery(); 
		if(RS.next()){
		double lat=RS.getDouble("lat");
		double lng=RS.getDouble("lng");
	%>	
	<button onclick="loadDoc1(<%=lat%>,<%=lng%>)">Show Now</button>
	<% 	}
		
}

%>
    <script>
      function loadDoc1(x,y) {

        var uluru ={lat:x,lng:y};
        		
       
        const map = new google.maps.Map(document.getElementById("map"), {
          zoom: 16,
          center: uluru,
        });

        const marker = new google.maps.Marker({
          position: uluru,
          map: map,
        });
      }
    </script>
    <body>
        <h3>My Google Maps Demo</h3>
    <!--The div element for the map -->
    <div id="map"></div>
</body>
</html>