

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.Dao;

/**
 * Servlet implementation class appliedjob
 */
@WebServlet("/appliedjob")
public class appliedjob extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public appliedjob() {
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
		PrintWriter out = response.getWriter();
		int id =Integer.parseInt(request.getParameter("id"));
		HttpSession session = request.getSession();
		String uname=session.getAttribute("uname").toString();
		Dao obj = new Dao();
		int i = obj.jobapplied(id, uname);
		int j = obj.insert_status(id, uname);
		if(i>0 && j>0)
		{
			response.sendRedirect("applied.jsp");
		}
		else
		{
			out.println("failed  to apply");
		}
	}
}