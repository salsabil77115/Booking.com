

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/saveComment")
public class saveComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
            try {
            	  String url = "jdbc:mysql://localhost:3306/hotelbook";
                  String user = "salsabil";
                  String password = "123";
                      Connection Con = null;                
                      Con = DriverManager.getConnection(url, user, password);
                      Random rand= new Random();
                  String Rate=request.getParameter("rate");
                  String comment=request.getParameter("comment");
              	String id=request.getParameter("id");
            	String clientID = request.getSession().getAttribute("client_Id").toString();
            int rate=rand.nextInt(1000);
              		String query1 = "INSERT INTO `Rate`( `hotel_id`, `client_Rate`)" + "VALUES (?,?)";

              	   	PreparedStatement ps4= Con.prepareStatement(query1);
              	   	ps4.setString(1,id );
              	   	ps4.setString(2, Rate);
              	    int x1=ps4.executeUpdate();
              	    if(x1!=0){
              			String query = "INSERT INTO `comments`( `id`,`client_id`, `comment`,`hotel_id`)" + "VALUES (?,?,?,?)";

              		   	PreparedStatement ps= Con.prepareStatement(query);
              		   	ps.setInt(1,rate);

              		   	ps.setString(2,clientID );
              		   	ps.setString(3, comment);
              		   	ps.setString(4, id);
              		    int x=ps.executeUpdate();
              		    if(x!=0){
              	    	out.print("<p style='color:blue; font-size:20px;font-weight:bold;'>thanks for your opinion.</p>");
              	    }else{
              	    	out.print("<p style=' color:blue; font-size:20px;font-weight:bold;'>Can't insert!!</p>");
              	
              	    }
              	}else{
                  	out.print("<p style=' color:blue; font-size:20px;font-weight:bold;'>Can't insert!!</p>");
              	}
              	
                 
              	    Con.close();
 	
                 } catch (Exception e) {
                	 e.printStackTrace();
                	 }


                	 }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
processRequest(request, response);	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);	}
	}


