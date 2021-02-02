

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
/**
 * Servlet implementation class updatePhoto
 */
@WebServlet("/updatePhoto")
public class updatePhoto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
            try {
            	 String url = "jdbc:mysql://localhost:3306/hotelbook";
                 String user = "salsabil";
                 String password = "123";
                 Connection Con = null;
                 ResultSet RS= null;
                 ResultSet RS1= null;

                 Con = DriverManager.getConnection(url, user, password);
        String hotel_id=request.getParameter("id");
        String path=request.getParameter("path");
        String state = request.getParameter("radio"); 
        PreparedStatement ps=Con.prepareStatement("select * FROM `hotel` WHERE `hotel_id`="+hotel_id);
        RS=ps.executeQuery(); 
        if(RS.next()){
        if(state.equals("add")){
        	String query = "INSERT INTO `hotel_image`(`dir`, `hotel_id`)"
        			+ "values ( ?, ?)";
        			
        PreparedStatement preparedStmt = Con.prepareStatement(query);
        preparedStmt.setString(1, path);
        preparedStmt.setString(2, hotel_id);
        int x=preparedStmt.executeUpdate(); 

        	if(x!=0){
        		response.sendRedirect("adminHome.jsp?add= Add Successfully");
        	}else{
        		response.sendRedirect("adminHome.jsp?add=Error in insert");

        	}}
        else{
        	response.sendRedirect("updatehotelphoto.jsp?id="+hotel_id+"&dir="+path);
        }
        }else{
        	response.sendRedirect("adminHome.jsp?add= invalid ID");

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


