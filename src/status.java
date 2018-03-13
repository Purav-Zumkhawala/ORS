

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Dao;

/**
 * Servlet implementation class status
 */
@WebServlet("/status")
public class status extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public status() {
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
		PrintWriter out = response.getWriter();
		String tel=request.getParameter("tel");
		String p=request.getParameter("pi");
		String h=request.getParameter("hr");
		String uname=request.getParameter("uname");
		int id=Integer.parseInt(request.getParameter("id"));
		String pi="",hr="";
		Dao obj = new Dao();
		if(tel!=null)
		{
			if(p==null)
			{
				pi="----";
			}
			else
			{
				pi=p;
			}
			if(h==null)
			{
				hr="----";
			}
			else
			{
				hr=h;
			}
			obj.update_status(id, uname,tel,pi,hr);
			response.sendRedirect("view_applicants.jsp?id="+id+"");
		}
		else
		{
			response.sendRedirect("view_applicants.jsp?id="+id+"");
		}

	}

}
