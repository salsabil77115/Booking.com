import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/cancel_reservation")
public class cancel_reservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        response.setContentType("text/html;charset=UTF-8");
	        try (PrintWriter out = response.getWriter()) {
	        	
	        	  String url = "jdbc:mysql://localhost:3306/hotelbook";
	              String user = "salsabil";
	              String password = "123";
	              Connection Con = null;
	              ResultSet RS = null;
	              	ResultSet RS4=null;
	                  Con = DriverManager.getConnection(url, user, password);         
	                  String CID=request.getParameter("id");                
	                  PreparedStatement ps=Con.prepareStatement("select * FROM `Booking` where Booking_id= "+CID);
	                  RS=ps.executeQuery();
	                  if(RS.next()){
	                  String Room_ID=RS.getString("room_id");

	                   	PreparedStatement ps2=Con.prepareStatement("UPDATE `room` SET `statue`=? where `room_id`=?");

	                   	ps2.setString(1,"available");
	                   	ps2.setString(2,Room_ID);
	                   	int x=ps2.executeUpdate();
	                   	if(x!=0){
	                  PreparedStatement ps3=Con.prepareStatement("UPDATE `booking` set `statues`=? where `Booking_id`=?");
	                  ps3.setString(1,"Canceled");

	                  ps3.setString(2,CID);                   
	                  int x1=ps3.executeUpdate();
	                  if(x1!=0){
	                      PreparedStatement ps4=Con.prepareStatement("select * FROM `admin`");
	                      RS4=ps4.executeQuery();
	                      if(RS4.next()){
	                      	do{
	                      	String email=RS4.getString("Email");
	                      	Gmail(email, "Cancel Booking", "This Booking_ID is cancelled:"+CID);

	                      }while(RS4.next());
	                  	out.print("<p style='font-size:20px;font-weight:bold'>Booking canceled</p>");
	                  }}
	                  }}else{
	                  	out.print("<p style='font-size:20px;font-weight:bold'>Invalid ID</p>");
	                  	  }
	                RS.close();
	                Con.close();
	        }
	        catch (Exception ex) {
	                ex.printStackTrace();
	            }
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
	    }// </editor-fold>

	    public void Gmail(String to,String sub,String msg) {
	    	
	    	
	    	String from="notificationsystem658@gmail.com";
	    	String password="123456System";

	    	 //Get properties object    
	        Properties props = new Properties();    
	        props.put("mail.smtp.host", "smtp.gmail.com");    
	        props.put("mail.smtp.socketFactory.port", "465");    
	        props.put("mail.smtp.socketFactory.class",    
	                  "javax.net.ssl.SSLSocketFactory");    
	        props.put("mail.smtp.auth", "true");    
	        props.put("mail.smtp.port", "465");    
	        //get Session   
	        Session session = Session.getDefaultInstance(props,    
	         new javax.mail.Authenticator() {    
	         protected PasswordAuthentication getPasswordAuthentication() {    
	         return new PasswordAuthentication(from,password);  
	         }    
	        });    
	        //compose message    
	        try {    
	         MimeMessage message = new MimeMessage(session);    
	         message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));    
	         message.setSubject(sub);    
	         message.setText(msg);    
	         //send message  
	         Transport.send(message);    
	         System.out.println("message sent successfully");    
	        } catch (MessagingException e) {throw new RuntimeException(e);}    
	        
	           
	    	
	    	
	    }
	    

}
