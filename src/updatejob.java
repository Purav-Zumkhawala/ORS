

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.createjob_bean;
import util.Dao;

/**
 * Servlet implementation class updatejob
 */
@WebServlet("/updatejob")
public class updatejob extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updatejob() {
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
		createjob_bean crj = new createjob_bean();
		Dao obj = new Dao();
		int id =Integer.parseInt(request.getParameter("id"));
		String jobtype= request.getParameter("jobtype");
		String location=request.getParameter("joblocation");
		String part_time=request.getParameter("part_time");
		int openings = Integer.parseInt(request.getParameter("num_openings"));
		int salary= Integer.parseInt(request.getParameter("salary"));
		int i=obj.updatejob(id,jobtype,location,part_time,openings,salary);
		if(i>0)
		response.sendRedirect("my_jobs.jsp");
		else
			out.println("failed");
		
	}

}
