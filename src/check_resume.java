

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
 * Servlet implementation class check_resume
 */
@WebServlet("/check_resume")
public class check_resume extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public check_resume() {
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
		String choice=request.getParameter("choice");
		PrintWriter out= response.getWriter();
		if(choice.equals("yes"))
		{
			Dao obj = new Dao();
			HttpSession session=request.getSession();
			String uname=session.getAttribute("uname").toString();
			int i = obj.delete_resume(uname);
			if(i>0)
			{
				out.println("<center>");
				out.println("Resume Deleted");
				out.println("<br></center>");
				
				RequestDispatcher rd = request.getRequestDispatcher("upload.jsp");
				rd.include(request, response);
			}
			else
			{
				out.println("<center>");
				out.println("Failed to Deleted");
				out.println("</center>");
				
			}
					
		}
		else if(choice.equals("no"))
		{
			response.sendRedirect("All_job_aspirant.jsp");
		}
		
	}

}
