import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/signup")
public class signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        response.setContentType("text/html;charset=UTF-8");
	        try (PrintWriter out = response.getWriter()) {
	        	  String url = "jdbc:mysql://localhost:3306/hotelbook";
	        	   String user = "salsabil";
	        	   String password = "123";
	        	       Connection Con = null;
	        	       ResultSet RS=null;
	        	       Con = DriverManager.getConnection(url, user, password);
	                  String email=request.getParameter("mail");
	                  String name=request.getParameter("namee");
	                  String phone_number=request.getParameter("phone");
	                  HttpSession session = request.getSession(true);
	                   Random rand= new Random();
	               	String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
						boolean verify = VerifyRecaptcha.verify(gRecaptchaResponse);
	           		PreparedStatement ps=Con.prepareStatement("select * FROM `client` WHERE `email`=?" );
					ps.setString(1,email );            
					RS=ps.executeQuery();
					if(RS.next()){
	                    response.sendRedirect("register.jsp?make=you have an acount!");

					}else if (request.getParameter("mail")!=null&&request.getParameter("namee")!=null&&request.getParameter("phone")!=null&&verify) {
					
					
					
						 
	                 int passworddd =rand.nextInt(100000);
  
	                 Gmail(email, "Confirmation", "This is your password now:"+passworddd);
	                 
	                 
	                 
	                 int ID =rand.nextInt(200);

	                  String query="INSERT INTO `client` (`client_Id`,`email`,`Name`,`phone_number`,`password`)"+" values (?,?,?,?,?)";
	                 PreparedStatement x=Con.prepareStatement(query);
	                x.setInt(1,ID);
	                x.setString(2,email);
	                x.setString(3,name);
	                x.setString(4,phone_number );
	                x.setInt(5,passworddd);
	                int result=x.executeUpdate();
	                if(result!=0){
	                	session.setAttribute("client_id", ID);
	                    response.sendRedirect("register.jsp?make=Success, now you have an account !please,check in your email");

	             

	                }
	            
	        }else {
					if (verify) {
		
		                    response.sendRedirect("register.jsp?make=Sorry, Invalid email !");
		           } else {
	                    response.sendRedirect("register.jsp?make=You missed the Captcha.!");
					}
			
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


