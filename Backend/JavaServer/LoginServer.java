Package AttendanceManagement;


import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Functionality.Login;


@WebServlet("/LoginServer")
class LoginServer{
	
	private static final long serialVersionUID = 1L;
       
    public LoginServer() {
        super();
    }


	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		long id = Long.valueOf(request.getParameter("userid"));
		String password = request.getParameter("password");
		Login l = new Login();

		RequestDispatcher dispatcher = null;

		HttpSession session = null;

		if(l.isvalid(id,password) == true ) // check for the valid user.
		{
		 String role = l.getRole(id); // extract the role of the id to present the next view

		 dispatcher = request.getRequestDispatcher(role+".jsp");
	     dispatcher.forward(request, response);
		}
		
		else{
		 dispatcher = request.getRequestDispatcher("popup.jsp");
	     dispatcher.forward(request, response);
		}


	}
}