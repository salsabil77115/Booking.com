 <%@ page language="java" contentType="text/html; charset=windows-1256" pageEncoding="windows-1256"%>
    <%@ page import = "javax.servlet.*,java.text.*" %>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import ="java.util.*"%>
<%@ page import ="java.sql.*"%>
<%@ page import ="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Home</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="css/customer.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
</head>

<body class="w3-light-grey" >

<div class="w3-bar w3-white w3-large">
  <a href="customerhome.jsp" class="w3-bar-item w3-button w3-blue w3-mobile"><i class="fa fa-bed w3-margin-right"></i>Home Away</a>
  <a href="#rooms" class="w3-bar-item w3-button w3-mobile">Rooms</a>
   <a href="#hotels" class="w3-bar-item w3-button w3-mobile">Hotels</a>
          <a href="#Book" class="w3-bar-item w3-button w3-mobile">Book Now</a>
  
    <a href="#cancel" class="w3-bar-item w3-button w3-mobile">Cancel reservation</a>
      <a href="#Borge" class="w3-bar-item w3-button w3-mobile">My Booking</a>
    
  <a href="profile.jsp" class="w3-bar-item w3-button w3-mobile">Profile</a>
    
  <a href="#about" class="w3-bar-item w3-button w3-mobile">About</a>
  <a href="#contact" class="w3-bar-item w3-button w3-mobile">Contact</a>
  <a href="Logout" class="w3-bar-item w3-button w3-right w3-light-grey w3-mobile">LogOut</a>
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
	String clientID = request.getSession().getAttribute("client_Id").toString();


    Con = DriverManager.getConnection(url, user, password);
if(request.getParameter("msg")!=null){
	String msg=request.getParameter("msg");
	out.print("<p>"+msg+"</p>");
	
}
if(request.getParameter("make")!=null){
	
	String x=	request.getParameter("make");

%>
<p><%=x%></p>
<%} %>
<!-- Header -->
<header class="w3-display-container w3-content" style="max-width:1500px;" >
  <img class="w3-image" src="image/book.jpg" alt="The Hotel" style="min-width:1000px" width="1500" height="500">
  <div class="w3-display-left w3-padding w3-col l6 m8" id="Book">
    <div class="w3-container w3-blue">
      <h2><i class="fa fa-bed w3-margin-right"></i>Hotel Name</h2>
    </div>
    <div class="w3-container w3-white w3-padding-16">
      <form action="searchHotel.jsp">
        <div class="w3-row-padding" style="margin:8px -16px;">
          <div class="w3-half w3-margin-bottom">
            <label><i class="fa fa-male"></i> Location</label>
            <input class="w3-input w3-border" type="text" name="loc" min="1" max="6">
          </div>
          <div class="w3-half"><br>
                <button class="w3-button w3-dark-grey" type="submit"><i class="fa fa-search w3-margin-right"></i> Search availability</button>
        </div>
          
        </div>
        <div class="w3-row-padding" style="margin:0 -16px;">
          <div class="w3-half w3-margin-bottom">
            <label><i class="fa fa-calendar-o"></i> Check In</label>
            <input class="w3-input w3-border" type="date" placeholder="DD MM YYYY" name="CheckIn" required>
          </div>
          <div class="w3-half">
            <label><i class="fa fa-calendar-o"></i> Check Out</label>
            <input class="w3-input w3-border" type="date" placeholder="DD MM YYYY" name="CheckOut" required>
          </div>
          
        </div>
        <div class="w3-row-padding" style="margin:8px -16px;">
          <div class="w3-half w3-margin-bottom">
            <label><i class="fa fa-male"></i> Adults</label>
            <input class="w3-input w3-border" type="number" value="1" name="Adults" min="1" max="6">
          </div>
          <div class="w3-half">
            <label><i class="fa fa-child"></i> Kids</label>
          <input class="w3-input w3-border" type="number" value="0" name="Kids" min="0" max="6">
          </div>
          
        </div>
         
      </form>
    </div>
  </div>
</header>

<!-- Page content -->
<div class="w3-content" style="max-width:1532px;">

  <div class="w3-container w3-margin-top" id="rooms">
    <h3>Rooms</h3>
    <p>Make yourself at home is our slogan. We offer the best beds in the industry. Sleep well and rest well.</p>
  </div>
 

  <div class="w3-row-padding w3-padding-16">
    <div class="w3-third w3-margin-bottom">
      <img src="image/31.jpg" alt="Norway" style="width:100%">
      <div class="w3-container w3-white">
        <h3>Single Room</h3>
        <h6 class="w3-opacity">From $99</h6>
        <p>Single bed</p>
        <p>15m<sup>2</sup></p>
        <p class="w3-large"><i class="fa fa-bath"></i> <i class="fa fa-phone"></i> <i class="fa fa-wifi"></i></p>
      </div>
    </div>
    <div class="w3-third w3-margin-bottom">
      <img src="image/22.jpg" alt="Norway" style="width:100% ;height: 285px;" >
      <div class="w3-container w3-white">
        <h3>Double Room</h3>
        <h6 class="w3-opacity">From $149</h6>
        <p>Queen-size bed</p>
        <p>25m<sup>2</sup></p>
        <p class="w3-large"><i class="fa fa-bath"></i> <i class="fa fa-phone"></i> <i class="fa fa-wifi"></i> <i class="fa fa-tv"></i></p>
      </div>
    </div>
    <div class="w3-third w3-margin-bottom">
      <img src="image/2.jpg" alt="Norway" style="width:100%">
      <div class="w3-container w3-white">
        <h3>Deluxe Room</h3>
        <h6 class="w3-opacity">From $199</h6>
        <p>King-size bed</p>
        <p>40m<sup>2</sup></p>
        <p class="w3-large"><i class="fa fa-bath"></i> <i class="fa fa-phone"></i> <i class="fa fa-wifi"></i> <i class="fa fa-tv"></i> <i class="fa fa-glass"></i> <i class="fa fa-cutlery"></i></p>
      </div>
    </div>
  </div>

  <div class="w3-row-padding" id="about">
    <div class="w3-col l4 12">
      <h3>About</h3>
      <h6>Our hotel is one of a kind. It is truely amazing. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</h6>
    <p>We accept: <i class="fa fa-credit-card w3-large"></i> <i class="fa fa-cc-mastercard w3-large"></i> <i class="fa fa-cc-amex w3-large"></i> <i class="fa fa-cc-cc-visa w3-large"></i><i class="fa fa-cc-paypal w3-large"></i></p>
    </div>
    <div class="w3-col l8 12">
      <img src="image/map.jpg" class="w3-image" style="width:100%;">    </div>
  </div>
  
  <div class="w3-row-padding w3-large w3-center" style="margin:32px 0">
    <div class="w3-third"><i class="fa fa-map-marker w3-text-blue"></i> 423 Some adr, Chicago, US</div>
    <div class="w3-third"><i class="fa fa-phone w3-text-blue"></i> Phone: +00 151515</div>
    <div class="w3-third"><i class="fa fa-envelope w3-text-blue"></i> Email: mail@mail.com</div>
  </div>

  <div class="w3-container" id="hotels">
    <h3>Our Hotels</h3>
    <h6>You can find our hotels anywhere in the world:</h6>
  </div>
  <a href="viewHotelphoto.jsp" style="float: right; font-size: 20px; margin-right: 30px; color: blue;">More..</a>
  <div class="w3-row-padding w3-padding-16 w3-text-white w3-large">
    <div class="w3-half w3-margin-bottom">
      <div class="w3-display-container">
        <img src="image/9.jpg" alt="Cinque Terre" style="width:100%">
      </div>
    </div>
    <div class="w3-half">
      <div class="w3-row-padding" style="margin:0 -16px">
        <div class="w3-half w3-margin-bottom">
          <div class="w3-display-container">
            <img src="image/150.jpeg" alt="New York" style="width:100%;height: 210px;">
          </div>
        </div>
        <div class="w3-half w3-margin-bottom">
          <div class="w3-display-container">
            <img src="image/15.jpg" alt="San Francisco" style="width:100%">
          </div>
        </div>
      </div>
      <div class="w3-row-padding" style="margin:0 -16px">
        <div class="w3-half w3-margin-bottom">
          <div class="w3-display-container">
         
            <img src="image/14.jpg" alt="Pisa" style="width:100%; height: 210px;">
            
       
	     
	      </div>
          </div>
        <div class="w3-half w3-margin-bottom">
          <div class="w3-display-container">
            <img src="image/image/11.jpg" alt="Paris" style="width:100%;height: 210px;">
          </div>
        </div>
      </div>
    </div>
  </div>

<div id="Borge" class="w3-container person" >
  <p style=" font-size: 20px;">Booking Info</p>

       <%

    PreparedStatement ps1=Con.prepareStatement("select * FROM `Booking` where `statues`='Reserved' AND `client_Id`="+clientID);
    RS1=ps1.executeQuery();
if(RS1.next()){
	int hotel_id=RS1.getInt("hotel_id");

	do{
	    PreparedStatement ps=Con.prepareStatement("select * FROM `hotel_image` where `hotel_id`="+hotel_id);
	    RS=ps.executeQuery();
	    if(RS.next()){
	    	%>
	  	  <div class="column" >
	  	    <div class="card">
	  	 
	  	      <img src="image/<%=RS.getString("dir")%>" alt="Jane" style="width:20%; height:150px;  margin-left:10px; ">
	  	  
	  	      <div class="container">
	  	        <h2>Booking ID:<%=RS1.getString("Booking_id")%></h2>
	  	        <p class="title">Arrival Date:<%=RS1.getString("arrival_date") %></p>
	  	        
	  	        <p class="title">Departure Date:<%=RS1.getString("departure_date") %></p>
.
<h1>Rate Hotel</h1>
<div id="demo">
  <label class="con">Excellent +5
  <input type="radio" checked="checked"  id="radio" value="5" name="radio">
  <span class="checkmark"></span>
</label>
<label class="con">Very Good +4
  <input type="radio" id="radio" value="4" name="radio">
  <span class="checkmark"></span>
</label>
<label class="con">Good +3
  <input type="radio" id="radio"  value="3"  name="radio">
  <span class="checkmark"></span>
</label>
<label class="con">Satisfied +2
  <input type="radio" id="radio"  value="2"  name="radio">
  <span class="checkmark"></span>
</label>
<label class="con">Not good +1
  <input type="radio" id="radio" value="1"  name="radio">
  <span class="checkmark"></span>
</label>
<label style="font-weight:bold;font-size:20px;">Comment</label><br>
<textarea rows="3" cols="100" id="comment"></textarea><br>
<button style="padding-left:20px;padding-right:20px;font-weight:bold;font-size:20px;cursor: pointer;" onclick="loadDoc1(<%=hotel_id%>)">Rate</button>
 	</div>  
 	      </div>
	  	   
	  	
	  <%}
	  else{
	  	out.print("not found photos");
	  }
	
	}while(RS1.next());
	
	%>
	<br>
	 </div>
	  	  </div>
	  	  <% 
}else{
	out.print("<br>");
	out.print("<p style='color:blue;'>you haven't Booking yet!</p>");
}

%>
</div>

 <header class="w3-display-container w3-content" style="max-width:1500px;margin-top: 150px;" >
  
  <div class="w3-display-left w3-padding w3-col l6 m8" id="cancel">
    <div class="w3-container w3-blue">
      <h2><i class="fa fa-bed w3-margin-right"></i>Cancel Booking</h2>
    </div>
    <div class="w3-container w3-white w3-padding-16">
        <div class="w3-row-padding" style="margin:0 -16px;">
          <div class="w3-half w3-margin-bottom">
            <label><i class="fa fa-calendar-o"></i> Booking ID</label>
            <input class="w3-input w3-border" type="number" placeholder=" ID..." id="Id" required>
          </div>
          
        </div>
          <div class="w3-half"><br>
                <button onclick="loadDoc()"style="padding-left:40px;padding-right:50px;"class="w3-button w3-dark-grey" type="submit"><i class="fa fa-search w3-margin-right"></i> Cancel </button>
        </div>
          
        </div>
     
         
    </div>
  </header>
  <br><br><br>
  <div class="w3-container" id="contact" >
    <h2>Contact</h2>
    <p>If you have any questions, do not hesitate to ask them.</p>
    <i class="fa fa-map-marker w3-text-blue" style="width:30px"></i> Cairo,Helwan<br>
    <i class="fa fa-phone w3-text-blue" style="width:30px"></i> Phone: 01027219930<br>
    <i class="fa fa-envelope w3-text-blue" style="width:30px"> </i> Email: szzz123t0@gmail.com<br>
    <form action="/action_page.php" target="_blank">
      <p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="Name" required name="Name"></p>
      <p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="Email" required name="Email"></p>
      <p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="Message" required name="Message"></p>
      <p><button class="w3-button w3-black w3-padding-large" type="submit">SEND MESSAGE</button></p>
    </form>
  </div>
</div>
<!-- Footer -->
<footer class="w3-padding-32 w3-black w3-center w3-margin-top" >
  <h5>Find Us On</h5>
  <div class="w3-xlarge w3-padding-16">
    <i class="fa fa-facebook-official w3-hover-opacity"></i>
    <i class="fa fa-instagram w3-hover-opacity"></i>
    <i class="fa fa-snapchat w3-hover-opacity"></i>
    <i class="fa fa-pinterest-p w3-hover-opacity"></i>
    <i class="fa fa-twitter w3-hover-opacity"></i>
    <i class="fa fa-linkedin w3-hover-opacity"></i>
  </div>
   <p class="copyright-text">Copyright &copy; 2021 All Rights Reserved by  <a href="#">FCAI</a>.
            </p>
  <p class="w3-hover-text-green">Powered by Salsabil Mohamed</p>
</footer>
<script>
function loadDoc1(x) {
	  var ele = document.getElementsByName('radio'); 
      var rate;
      for(i = 0; i < ele.length; i++) { 
          if(ele[i].checked) 
        
              rate    = ele[i].value; 
      } 
    var comment = document.getElementById("comment").value;

	  var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	     document.getElementById("Borge").innerHTML = this.responseText;
	    }
	  };
	  xhttp.open("get", "saveComment.jsp?rate="+rate+"&comment="+comment+"&id="+x, true);
	  xhttp.send();
	}
function loadDoc() {
    var id = document.getElementById("Id").value;
	  var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	     document.getElementById("cancel").innerHTML = this.responseText;
	    }
	  };
	  xhttp.open("GET", "cancel_reservation?id="+id, true);
	  xhttp.send();
	}
</script>



</body>
</html>