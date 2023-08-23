Package AttendanceManagement;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/LoginServer")
class LoginServer{

	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		String id = request.getParameter("userid");
		String password = request.getParameter("password");

		RequestDispatcher dispatcher = null;

		HttpSession session = null;

		if(isvalid(id,pass) == true ) // check for the valid user.
		{
		 String role = getRole(id); // extract the role of the id to present the next view

		 dispatcher = request.getRequestDispatcher(role+".jsp");
	     dispatcher.forward(request, response);
		}
		
		else{
		 dispatcher = request.getRequestDispatcher("popup.jsp");
	     dispatcher.forward(request, response);
		}

		dispatcher.close();

	}
}