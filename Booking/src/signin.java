import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/signin")
public class signin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        response.setContentType("text/html;charset=UTF-8");
	        PrintWriter out = response.getWriter();
	       
	           try{
	        	   String url = "jdbc:mysql://localhost:3306/hotelbook";
	        	   String user = "salsabil";
	        	   String password = "123";
	        	       Connection Con = null;
	        	       ResultSet RS=null;
	        	       ResultSet RS1=null;
	        	     
	        	       int id=0;
                       HttpSession session = request.getSession();

	        	       Con = DriverManager.getConnection(url, user, password);
	                String usermail=request.getParameter("usermail");    
	                String passwordd  = request.getParameter("password");
	                String check=request.getParameter("remember");
	                PreparedStatement ps=Con.prepareStatement("select * from client where email=? and password=?");
                    ps.setString(1,usermail);                   

                    ps.setString(2,passwordd);                   

                    RS=ps.executeQuery();
                    if(RS.next()) {
                 
	                  id=RS.getInt("client_Id");
	                  session.setAttribute("client_Id", id);
	             

	                  response.sendRedirect("customerhome.jsp?make=Login Successfully");
	            
	                
	                }else{
	                    PreparedStatement ps1=Con.prepareStatement("select * from admin where Email=? and Password=?");

                        ps1.setString(1,usermail);                   

                        ps1.setString(2,passwordd);                   

                        RS1=ps1.executeQuery();
	                    if(RS1.next()){
	               
	  	                  response.sendRedirect("adminHome.jsp?make=Login Successfully");
	                 
	                }
	                }
	            
	                Con.close();
	           }catch (Exception ex) {
	                ex.printStackTrace();}
	        }
	            
	           
	        
	                
	       
	    

	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        processRequest(request, response);
	    }

	
	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        processRequest(request, response);
	    }

	
	    @Override
	    public String getServletInfo() {
	        return "Short description";
	    }

}
