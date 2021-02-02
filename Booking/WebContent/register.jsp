<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Register Page </title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="register.css">
        
        <script src="https://www.google.com/recaptcha/api.js"></script>
    </head>
    <body>
            <nav>
            <input type="checkbox" id="check">
            <label for="check" class="checkbtn">
                <i class="fas fa-bars"></i>
            </label>
            <label class="book">Home Away</label>
            <ul>
                <li>
                    <a href="welcomePage.html">Home</a>
                </li>
                <li>
                    <a href="#">About</a>
                </li>
                <li>
                    <a href="#">Contact</a>
                </li>
                <li>
                    <a href="#">Feedback</a>
                </li>
                <li>
                    <a href="register.html">Register oR Log IN</a>
                </li>
            </ul>
        </nav>
        <% if(request.getParameter("make")!=null){
        	String x=request.getParameter("make");
        	out.print("<p style='font-size:40px; font-weight:bold;color:orange;'>"+x+"</p>");
        }%>
        <div class="rehab">
            <div class="form-box">
                <div class="button-box">
                    <div id="btn"></div>
                    <button type="button" class="toggel-btn" onclick="login()">Log In</button>
                    <button type="button" class="toggel-btn" onclick="register()">Register</button>
                </div>
                <div class="icons">
                    <img src="image/fb.png">
                    <img src="image/tw.png">

                </div>
                <form id="login"class="inputs" action="signin" method="post">
                    <input name="usermail" type="text" class="input-field" placeholder="Enter user Email" required>
                    <input name="password" type="password" class="input-field" placeholder="Enter password" required>
                    <input type="checkbox" name="remember"class="chech-box"><span>Remember password</span>
                    <button type="submit" class="submit-btn">LOG IN </button>
                </form>
                <form id="register" class="inputs" action="signup" method="post">
                    <input name="mail" type="email" class="input-field" placeholder="Enter Email" required>
                    <input name="namee" type="text" class="input-field" placeholder="Enter Your Name" required>
                    <input name="phone" type="text" class="input-field" placeholder="Enter phone" required>
                     <div class="g-recaptcha"
            data-sitekey="6LdX-y0aAAAAALZLFJq3dnvUTi2f2_0xG4-heb6E"></div>  
                    <button type="submit" class="submit-btn">SIGN UP </button>
                    
      <br> 
                </form>
            </div>
           
            </div>

            <script>
                var x=document.getElementById("login");
                var y=document.getElementById("register");
                var z=document.getElementById("btn");
                function register(){
                    x.style.left="-400px";
                    y.style.left="50px";
                    z.style.left="110px";
                }
                function login(){
                    x.style.left="50px";
                    y.style.left="450px";
                    z.style.left="0";
                }
            </script>

    </body>
    </html>