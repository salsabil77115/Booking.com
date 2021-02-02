

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/confirmBooking")
public class confirmBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	   
		protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        response.setContentType("text/html;charset=UTF-8");
	      PrintWriter out = response.getWriter();
	      try {
	            	 HttpSession session=request.getSession(); 
				String url = "jdbc:mysql://localhost:3306/hotelbook";
				String user = "salsabil";
				String password = "123";
				Connection Con = null;
				Con = DriverManager.getConnection(url, user, password);
				ResultSet RS=null;
				boolean check=false;
				String state="";
				if(request.getSession().getAttribute("client_Id")!=null) {
				String clientID = request.getSession().getAttribute("client_Id").toString();
				String children = request.getParameter("Kids");
				String Adult = request.getParameter("Adults");
				String checkIn = request.getParameter("In");
				String checkOut = request.getParameter("out");  
				String roomId=request.getParameter("roomid");
				String hotelId=request.getParameter("id");
				Random rand = new Random();
				PreparedStatement ps=Con.prepareStatement("select * FROM `booking` WHERE `room_id`=? and `statues`=?" );
				ps.setString(1,roomId ); 
				ps.setString(1,"Reserved");            

				RS=ps.executeQuery();
				if(RS.next()){
				
				String dateIn=RS.getString("arrival_date");
				String dateOut=RS.getString("departure_date");
				
				
				String format = "yyyy-MM-dd";
				      	 
				SimpleDateFormat sdf = new SimpleDateFormat(format);
				
				Date dateObj1 = sdf.parse(dateIn);
				Date dateObj2 = sdf.parse(checkIn);
				Date dateObj3 = sdf.parse(dateOut);
				Date dateObj4 = sdf.parse(checkOut);
				              	
				long diff1 = dateObj1.getTime() - dateObj2.getTime();
				
				int diffDays1 = (int) (diff1 / (24 * 60 * 60 * 1000));
				if(diffDays1==0){
				check=false;
				}else if(diffDays1>0){
				long diff2 = dateObj4.getTime() - dateObj1.getTime();
				int diffDays2 = (int) (diff2 / (24 * 60 * 60 * 1000));
				if(diffDays2>0){
				check=false;  }
				else if(diffDays2<=0){
				check=true;
				}
				}
				      		
				else if(diffDays1<0){
				long diff3 = dateObj3.getTime() - dateObj2.getTime();
				int diffDays3 = (int) (diff3/ (24 * 60 * 60 * 1000));
				      		
				if(diffDays3>0){
				
				check=false;
				}
				      		
				if(diffDays3<=0){
				check=true;}
				}
				
				}                 
				else{
					check=true;
				}
				if(check==true) {                
				int book = rand.nextInt(90000) + 10000;   
				session.setAttribute("Booking_id",book); 
				String query = "INSERT INTO `booking` (`Booking_id`, `arrival_date`, `hotel_id`, `client_Id`,`departure_date`,`number_of_children`,`number_of_adult`,`room_id`,`statues`)"
				+ " values ( ?, ?,?,?,?,?,?,?,?)";
				
				PreparedStatement preparedStmt = Con.prepareStatement(query);
				
				preparedStmt.setInt(1, book);
				preparedStmt.setString(2, checkIn);
				preparedStmt.setString(3, hotelId);
				preparedStmt.setString(4, clientID);
				preparedStmt.setString(5, checkOut);
				preparedStmt.setString(6, children);
				preparedStmt.setString (7, Adult);
				preparedStmt.setString(8,roomId);
				preparedStmt.setString(9,"Reserved");
				
				int x=preparedStmt.executeUpdate();
				if(x!=0){
				PreparedStatement ps4=Con.prepareStatement(	"UPDATE `room` SET `statue`=? where `room_id`=?");
					ps4.setString(1,"not available");
					ps4.setString(2,roomId);
				int y=ps4.executeUpdate();
				if(y!=0) {
				
					response.sendRedirect("customerhome.jsp?make= Booking successfully");
					}else{response.sendRedirect("customerhome.jsp?make=Field Booking!");}
				
				
				}}
					else {
						response.sendRedirect("customerhome.jsp?make=Sorry ! this room is booked..");
				}
	      }else {
				response.sendRedirect("register.jsp?make=Sorry, first Login");
	      }
				
				      Con.close();  

	                 } catch (Exception e) {
	                	 e.printStackTrace();
	                	 }
	            finally{out.close();}


	                	 }
	    

		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
		}

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			processRequest(request, response);
		}

	}
