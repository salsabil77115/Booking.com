<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import = "javax.servlet.*,java.text.*" %>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import ="java.util.*"%>
<%@ page import ="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
    <title>Add Room</title>
      <meta name="viewport" content="width=device-width, initial-scale=1">    
    </head>
    <style>
table {
  border-collapse: collapse;
  margin-left: 10px;
}
th, td {
  text-align: left;
  padding: 8px;
  font-weight:bold 
}
tr:nth-child(even) {background-color: buttonhighlight;} 
    </style>
 
    <form action="addroom.jsp" method="post">
    <div class="w3-container w3-white w3-padding-16">
       <table border="1" >
         <tr> 
         			<td> Room Type:</td>
          			<td><input type="text" name="room_type"  /></td>  
        </tr>
        <tr> 
			          <td> Room Facilities:</td>
			          <td><input type="text" name="room_facilities"/></td>  
       </tr>
        <tr> 
			         <td> hotel Id:</td>
			         <td><input type="number" name="hotel_id"  /></td>  
        </tr>
        <tr> 
			     	<td> Price:</td>
			        <td><input type="number" name="price"  /></td>  
        </tr>
	    <tr> 
                    <td> Room Rate:</td>
                    <td><input type="text" name="room_rate"  /></td>  
        </tr>
        <tr> 
                    <td> Room Number:</td>
                    <td><input type="number" name="room_number"  /></td>  
        </tr>
         <tr> 
                    <td> Room Phone Number:</td>
                    <td><input type="text" name="room_numberPhone"  /></td>  
        </tr>
         <tr> 
                    <td> Number Of children:</td>
                    <td><input type="number" name="number_of_children"  /></td>  
        </tr>
         <tr> 
                    <td> Number Of Adult:</td>
                    <td><input type="number" name="number_of_adult"  /></td>  
        </tr>
        <tr> 
                    <td> choose photo:</td>
                    <td><input type="file" name="image"  /></td>  
        </tr>
        <tr>
                    <td colspan="2">  
       <button style="padding-left:40px;padding-right:50px;"class="w3-button w3-dark-grey" name="sub" type="submit"><i class="fa fa-search w3-margin-right"></i>Add Room </button>
					</td>
                </tr>
        </table>
        </div>
          
  </form>
  <% 
       	   String url = "jdbc:mysql://localhost:3306/hotelbook";
	        	   String user = "salsabil";
	        	   String password = "123";
            Connection Con = null;
       ResultSet RS=null;
            Random rand= new Random();
            int room_id =rand.nextInt(500);
            Con = DriverManager.getConnection(url, user, password);
            if(request.getParameter("sub")!=null){
            String room_type =request.getParameter("room_type"); 
            String room_facilities =request.getParameter("room_facilities");  
            int hotel_id =Integer.parseInt(request.getParameter("hotel_id")); 
            int price =Integer.parseInt(request.getParameter("price")); 
            String room_rate =request.getParameter("room_rate"); 
            int room_number = Integer.parseInt(request.getParameter("room_number")); 
            int room_numberPhone = Integer.parseInt(request.getParameter("room_numberPhone")); 
            int number_of_children =Integer.parseInt(request.getParameter("number_of_children"));  
            int number_of_adult =Integer.parseInt(request.getParameter("number_of_adult")); 
            String image =request.getParameter("image"); 
        	PreparedStatement ps2 = Con.prepareStatement("select * FROM `room` where `room_number`=" + room_number+"or `room_numberPhone`="+room_numberPhone);
			RS = ps2.executeQuery();
			if (RS.next()) {
				response.sendRedirect("adminHome.jsp?addRoom=Room number or Room Phone is exist!");

			}else{
    	String query = "INSERT INTO `room`(`room_id`, `room_type`, `room_facilities`, `hotel_id`, `price`, `room_rate`, `room_number`, `room_numberPhone`, `number_of_children`, `number_of_adult`, `statue`)"
    			
    				+ " values (?,?,?,?,?,?,?,?,?,?,?)";
    				
    				PreparedStatement preparedStmt = Con.prepareStatement(query);
    				preparedStmt.setInt(1, room_id);
    				preparedStmt.setString(2, room_type);
    				preparedStmt.setString(3, room_facilities);
    				preparedStmt.setInt(4, hotel_id);
    				preparedStmt.setInt(5, price);
    				preparedStmt.setString(6, room_rate);
    				preparedStmt.setInt(7, room_number);
    				preparedStmt.setInt(8,room_numberPhone);
    				preparedStmt.setInt(9,number_of_children);
    				preparedStmt.setInt(10,number_of_adult);
    				preparedStmt.setString(11,"available");

    				int x=preparedStmt.executeUpdate();
    				if(x!=0){
    				String query2 = "INSERT INTO `room_image`(`room_id`,`dir`)"
    		        			
    				+ " values ( ?,?)";
    					
    					PreparedStatement ps = Con.prepareStatement(query2);
        				ps.setInt(1, room_id);
        				ps.setString(2, image);

        				int y=ps.executeUpdate();
        				if(y!=0){
        					response.sendRedirect("adminHome.jsp?addRoom=Add successfully");

        				
    				}else{
    					out.print("Error in insert this room!");
    				}}  else {
    					response.sendRedirect("adminHome.jsp?addRoom=Error!");

    				
    				}}}
            Con.close();
            %>
    </body>
</html>