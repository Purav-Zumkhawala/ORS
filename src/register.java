

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.Dao;

/**
 * Servlet implementation class register
 */
@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public register() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html;charset=UTF-8");
		//PrintWriter out=response.getWriter();
		int i;
		String pwd=request.getParameter("passwordsignup");
		String cpwd=request.getParameter("passwordsignup_confirm");
		if(pwd.equals(cpwd))
		{
			
			String uname=request.getParameter("usernamesignup");
			String ins_name=request.getParameter("institutenamesignup");
			String email=request.getParameter("emailsignup");
			String type=request.getParameter("usertypesignup");

			HttpSession session = request.getSession();
			session.setAttribute("uname", uname);
			
			Dao obj = new Dao();
			
			if(type.equals("job_aspirant"))
			{	
				i=obj.insert_job_aspirant_register(uname,pwd,email,ins_name);
				response.sendRedirect("home_job_aspirant.jsp");
			}
			else if(type.equals("company"))
			{
				i=obj.insert_company_register(uname,pwd,email,ins_name);
				response.sendRedirect("home_company.jsp");
			}
			
						
		}
		
	}

}
