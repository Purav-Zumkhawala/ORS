
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.user_data;
import util.Dao;

/**
 * Servlet implementation class verify
 */
@WebServlet("/verify")
public class verify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public verify() {
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
		PrintWriter out=response.getWriter();
		String type=request.getParameter("usertypelogin");
		String uname=request.getParameter("usernamelogin");
		String pwd=request.getParameter("passwordlogin");
		
		Dao obj = new Dao();
		
		if(type.equals("job_aspirant"))
		{
			user_data u1=obj.select_job_aspirant(uname);
			
			if(u1!=null)
			{
				String databasepwd=u1.getPassword();
				if(pwd.equals(databasepwd))
				{
					HttpSession session = request.getSession(true);
					session.setAttribute("uname", uname);
					session.setAttribute("abcd","aspirant");
					RequestDispatcher rd = request.getRequestDispatcher("home_job_aspirant.jsp");
					rd.forward(request, response);
				
				}
				else
				{
					out.println("<center style='color:red'>wrong uname or password</center>");
					RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
					rd.include(request, response); 
				}
			}
			else
			{
				out.println("<center style='color:red'>wrong uname or password</center>");
				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				rd.include(request, response);
			}
		}
		else if(type.equals("company"))
		{
			user_data u1=obj.select_company(uname);
			
			if(u1!=null)
			{
				String databasepwd=u1.getPassword();
				if(pwd.equals(databasepwd))
				{
					HttpSession session = request.getSession();
					session.setAttribute("uname", uname);
					session.setAttribute("abcd","company");
					RequestDispatcher rd = request.getRequestDispatcher("home_company.jsp");
					rd.forward(request, response);
				
				}
				else
				{
					out.println("<center style='color:red'>wrong uname or password</center>");
					RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
					rd.include(request, response); 
				}
			}
			else
			{
				out.println("<center style='color:red'>wrong uname or password</center>");
				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				rd.include(request, response); 
			
			}
		}
		else if(type.equals("admin"))
		{
			if(uname.equals("admin") && pwd.equals("root"))
			{
				HttpSession session = request.getSession();
				session.setAttribute("uname", uname);
				session.setAttribute("abcd","admin");
				RequestDispatcher rd = request.getRequestDispatcher("home_admin.jsp");
				rd.forward(request, response);
				
			}
			else
			{
				out.println("<center style='color:red'>wrong uname or password</center>");
				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				rd.include(request, response); 
			}
		}
	}	
}
