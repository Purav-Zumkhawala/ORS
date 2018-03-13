

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.createjob_bean;
import util.Dao;

/**
 * Servlet implementation class createjob
 */
@WebServlet("/createjob")
public class createjob extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public createjob() {
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
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		createjob_bean crj = new createjob_bean();
		
		HttpSession session = request.getSession();
		
		crj.setUname(session.getAttribute("uname").toString());
		crj.setInstitute(session.getAttribute("institute").toString());
		crj.setProfile(request.getParameter("profile"));
		crj.setJobtype(request.getParameter("jobtype"));
		crj.setLocation(request.getParameter("joblocation"));
		crj.setPart_time(request.getParameter("part_time"));
		crj.setOpenings(Integer.parseInt(request.getParameter("num_openings")));
		crj.setResponsibility(request.getParameter("job_description"));
		crj.setSalary(Integer.parseInt(request.getParameter("salary")));
		
		Dao obj = new Dao();
		int i=obj.insert_job(crj);
		if(i>0)
		{
			response.sendRedirect("my_jobs.jsp");
		}
		else
		{
			out.println("failed to create job");
		}

	}

}
