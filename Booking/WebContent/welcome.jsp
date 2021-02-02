<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Welcome to our Booking Website</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="css/welcome.css">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
	<nav>
		<input type="checkbox" id="check"> <label for="check"
			class="checkbtn"> <i class="fas fa-bars"></i>
		</label> <label class="book">Home Away</label>
		<ul>
			<li><a href="#">Home</a></li>
			<li><a href="#">About</a></li>
			<li><a href="#">Contact</a></li>
			<li><a href="#">Feedback</a></li>
			<li><a href="register.jsp">Register oR Log IN</a></li>
		</ul>
	</nav>
	<header class="w3-display-container w3-content"
		style="max-width: 1500px; margin-top: 300px;"  id="search">
		<div class="w3-display-left w3-padding w3-col l6 m8" id="Book">
			<div class="w3-container w3-orange">
				<h2>
					<i class="fa fa-bed w3-margin-right"></i>Hotel Name
				</h2>
			</div>
			<div class="w3-container w3-white w3-padding-16">
					<div class="w3-row-padding" style="margin: 8px -16px;">
						<div class="w3-half w3-margin-bottom">
							<label><i class="fa fa-male"></i> Location</label> <input
								class="w3-input w3-border" type="text" name="loc" min="1"
								max="6">
						</div>
						<div class="w3-half">
							<br>
							<button class="w3-button w3-dark-grey" type="submit" onclick="loadDoc3()">
								<i class="fa fa-search w3-margin-right"></i> Search availability
							</button>
						</div>

					</div>
					<div class="w3-row-padding" style="margin: 0 -16px;">
						<div class="w3-half w3-margin-bottom">
							<label><i class="fa fa-calendar-o"></i> Check In</label> <input
								class="w3-input w3-border" type="date" placeholder="DD MM YYYY"
								name="CheckIn" required>
						</div>
						<div class="w3-half">
							<label><i class="fa fa-calendar-o"></i> Check Out</label> <input
								class="w3-input w3-border" type="date" placeholder="DD MM YYYY"
								name="CheckOut" required>
						</div>

					</div>
					<div class="w3-row-padding" style="margin: 8px -16px;">
						<div class="w3-half w3-margin-bottom">
							<label><i class="fa fa-male"></i> Adults</label> <input
								class="w3-input w3-border" type="number" value="1" name="Adults"
								min="1" max="6">
						</div>
						<div class="w3-half">
							<label><i class="fa fa-child"></i> Kids</label> <input
								class="w3-input w3-border" type="number" value="0" name="Kids"
								min="0" max="6">
						</div>

					</div>
			</div>
		</div>
	</header>
<script type="text/javascript">

function loadDoc3() {

	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			document.getElementById("search").innerHTML = this.responseText;
		}
	};
	xhttp.open("GET", "searchHotel.jsp", true);
	xhttp.send();
}


</script>
</body>
</html>