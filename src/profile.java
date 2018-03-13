

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.user_profile;
import util.Dao;

/**
 * Servlet implementation class profile
 */
@WebServlet("/profile")
public class profile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public profile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out =response.getWriter();
		HttpSession session= request.getSession(false);
		user_profile profile=new user_profile();
		Dao obj = new Dao();
		
		profile.setUname(session.getAttribute("uname").toString());
		profile.setFname(request.getParameter("fname"));
		profile.setLname(request.getParameter("lname"));
		profile.setCity(request.getParameter("city"));
		profile.setState(request.getParameter("state"));
		profile.setAddress(request.getParameter("address"));
		profile.setSex(request.getParameter("sex"));
		profile.setMobileno(request.getParameter("mobileno"));
		
		if(request.getParameter("submit").equalsIgnoreCase("Submit"))
		{
			int i= obj.insert_profile(profile);
			if(i>0)
			{
				response.sendRedirect("All_job_aspirant.jsp");
			}
			else
			{
				out.println("failed to insert");
			}	
		}
		else if(request.getParameter("submit").equalsIgnoreCase("Update"))
		{
			int i=obj.update_profile(profile);
			if(i>0)
			{
				response.sendRedirect("All_job_aspirant.jsp");
			}
			else
			{
				out.println("failed to update");
			}	
			
		}
		
	}

}
