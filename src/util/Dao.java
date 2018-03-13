package util;

import java.sql.*;
import java.util.ArrayList;

import Model.applicants;
import Model.applied_job;
import Model.createjob_bean;
import Model.status;
import Model.user_data;
import Model.user_profile;

import java.util.Date;
import java.text.SimpleDateFormat;

public class Dao 
{
	public Connection connect()
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con;
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/purav","root","");
			return con;
		}
		 catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	//------------------------------------------------------------------------------------------------------------------------------------
	
	public int insert_job_aspirant_register(String uname,String pwd,String email,String ins_name)
	{
		Connection con=this.connect();
		int i=0;
		try 
		{
			PreparedStatement pst = con.prepareStatement("insert into job_aspirant_register values(?,?,?,?)");
			pst.setString(1,uname);
			pst.setString(2,pwd);
			pst.setString(3,email);
			pst.setString(4,ins_name);
			i=pst.executeUpdate();
			return i;
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return i;
	}
	
	//------------------------------------------------------------------------------------------------------------------------------------
	
	
	public int insert_company_register(String uname,String pwd,String email,String ins_name)
	{
		Connection con=this.connect();
		int i=0;
		try 
		{
			PreparedStatement pst = con.prepareStatement("insert into company_register values(?,?,?,?)");
			pst.setString(1,uname);
			pst.setString(2,pwd);
			pst.setString(3,email);
			pst.setString(4,ins_name);
			i=pst.executeUpdate();
			return i;
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return i;
	}
	
	//------------------------------------------------------------------------------------------------------------------------------------
	
	public int insert_job(createjob_bean crj)
	{
		Connection con=this.connect();
		int i=0;
		try 
		{
			PreparedStatement pst = con.prepareStatement("insert into job_description(uname,institute,profile,jobtype,location,part_time,openings,responsibility,salary) values(?,?,?,?,?,?,?,?,?)");
			
			pst.setString(1, crj.getUname());
			pst.setString(2,crj.getInstitute());
			pst.setString(3,crj.getProfile());
			pst.setString(4,crj.getJobtype());
			pst.setString(5,crj.getLocation());
			pst.setString(6,crj.getPart_time());
			pst.setInt(7,crj.getOpenings());
			pst.setString(8,crj.getResponsibility());
			pst.setInt(9,crj.getSalary());
			i=pst.executeUpdate();
			return i;
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return i;
	}
	
	//-----------------------------------------------------------------------------------------------------------------------------------------
	
	public int jobapplied(int id, String uname)
	{
		Connection con=this.connect();
		int i=-1;
		try 
		{
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			String strdate=sdf.format(date);
			PreparedStatement pst = con.prepareStatement("insert into applied values(?,?,?)");
			pst.setString(1,uname);
			pst.setInt(2,id);
			pst.setString(3, strdate);
			i=pst.executeUpdate();
			return i;
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return i;
	}
	
	//------------------------------------------------------------------------------------------------------------------------------------
	
	public user_data select_job_aspirant(String uname)
	{
		Connection con=this.connect();
		PreparedStatement pst;
		user_data obj1= new user_data();
		try 
		{
			pst = con.prepareStatement("select * from job_aspirant_register where username=?");
			pst.setString(1,uname);
			ResultSet rs=pst.executeQuery();
			if(rs.next())
			{
				obj1.setUname(rs.getString(1));
				obj1.setPassword(rs.getString(2));
				obj1.setEmail(rs.getString(3));
				obj1.setInstitute(rs.getString(4));
				return obj1;
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return null;	
	}
	
	//------------------------------------------------------------------------------------------------------------------------------------
	
	public user_data select_company(String uname)
	{
		Connection con=this.connect();
		
		PreparedStatement pst;
		user_data obj1= new user_data();
		try 
		{
			pst = con.prepareStatement("select * from company_register where username=?");
			pst.setString(1,uname);
			ResultSet rs=pst.executeQuery();
			if(rs.next())
			{
				obj1.setUname(rs.getString(1));
				obj1.setPassword(rs.getString(2));
				obj1.setEmail(rs.getString(3));
				obj1.setInstitute(rs.getString(4));
				return obj1;
				
			} 
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return null;	
	}
	
	//------------------------------------------------------------------------------------------------------------------------------------
	
	public ArrayList<createjob_bean> select_job()
	{
		Connection con=this.connect();
		try 
		{
			PreparedStatement pst = con.prepareStatement("select * from job_description");
			ResultSet rs=pst.executeQuery();
			/*createjob_bean crj = new createjob_bean();*/
			ArrayList<createjob_bean> jobs = new ArrayList<createjob_bean>(); 
			while(rs.next())
			{
				createjob_bean crj = new createjob_bean();
				crj.setInstitute(rs.getString(2));
				crj.setProfile(rs.getString(3));
				crj.setJobtype(rs.getString(4));
				crj.setLocation(rs.getString(5));
				crj.setPart_time(rs.getString(6));
				crj.setOpenings(rs.getInt(7));
				crj.setResponsibility(rs.getString(8));
				crj.setSalary(rs.getInt(9));
				crj.setId(rs.getInt(10));
				
				jobs.add(crj);
			}
			return jobs;
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return null;
	}
	
	//------------------------------------------------------------------------------------------------------------------------------------
	
	public ArrayList<createjob_bean> company_jobs(String uname)
	{
		Connection con=this.connect();
		try 
		{
			PreparedStatement pst = con.prepareStatement("select * from job_description where uname=?");
			pst.setString(1,uname);
			ResultSet rs=pst.executeQuery();
			
			ArrayList<createjob_bean> jobs = new ArrayList<createjob_bean>(); 
			while(rs.next())
			{
				createjob_bean crj = new createjob_bean();
				crj.setInstitute(rs.getString(2));
				crj.setProfile(rs.getString(3));
				crj.setJobtype(rs.getString(4));
				crj.setLocation(rs.getString(5));
				crj.setPart_time(rs.getString(6));
				crj.setOpenings(rs.getInt(7));
				crj.setResponsibility(rs.getString(8));
				crj.setSalary(rs.getInt(9));
				crj.setId(rs.getInt(10));
				
				
				jobs.add(crj);
			}
			return jobs;
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return null;
	}
	
	//------------------------------------------------------------------------------------------------------------------------------------
	
	public int deletejob(int id)
	{
		Connection con=this.connect();
		int i=-1;
		try 
		{
			PreparedStatement pst = con.prepareStatement("delete from job_description where id=?");
			pst.setInt(1,id);
			i=pst.executeUpdate();
			return i;
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return i;
		
	}
	
	//------------------------------------------------------------------------------------------------------------------------------------
	
	public createjob_bean select_update_jobs(int id)
	{
		Connection con=this.connect();
		try 
		{
			PreparedStatement pst = con.prepareStatement("select * from job_description where id=?");
			pst.setInt(1,id);
			ResultSet rs=pst.executeQuery();
			createjob_bean crj = new createjob_bean();
			if(rs.next())
			{
				crj.setUname(rs.getString(1));
				crj.setInstitute(rs.getString(2));
				crj.setProfile(rs.getString(3));
				crj.setJobtype(rs.getString(4));
				crj.setLocation(rs.getString(5));
				crj.setPart_time(rs.getString(6));
				crj.setOpenings(rs.getInt(7));
				crj.setResponsibility(rs.getString(8));
				crj.setSalary(rs.getInt(9));
				crj.setId(rs.getInt(10));
			}
			return crj;
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return null;
	}
	
	
	//------------------------------------------------------------------------------------------------------------------------------------
	
	
	public int updatejob(int id,String jobtype,String location,String part_time,int openings,int salary)
	{
		Connection con=this.connect();
		int i=-1;
		try 
		{
			PreparedStatement pst = con.prepareStatement("update job_description set jobtype=?,location=?,part_time=?,openings=?,salary=? where id=?");
			pst.setString(1,jobtype);
			pst.setString(2,location);
			pst.setString(3,part_time);
			pst.setInt(4,openings);
			pst.setInt(5,salary);
			pst.setInt(6,id);
			i=pst.executeUpdate();
			return i;
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return i;
		
	}
	
	//------------------------------------------------------------------------------------------------------------------------------------
	
		public ArrayList<applied_job> select_jobapplied(String uname)
		{
			Connection con=this.connect();
			
			try 
			{
				PreparedStatement pst = con.prepareStatement("select a.date,institute,profile,salary from applied a,job_description where a.id=job_description.id and a.username=? ");
				pst.setString(1, uname);
				ResultSet rs = pst.executeQuery();
				ArrayList<applied_job> jobs = new ArrayList<applied_job>();
			
				while(rs.next())
				{
					applied_job applied = new applied_job();
					applied.setDate(rs.getString(1));
					applied.setInstitute(rs.getString(2));
					applied.setProfile(rs.getString(3));
					applied.setSalary(rs.getInt(4));
					
					jobs.add(applied);
				}
				return jobs;
			}
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
			return null;
		}
		
		//-----------------------------------------------------------------------------------------------------------------
		
		public ArrayList<createjob_bean> searchjob(String radio,String search_value)
		{
			Connection con=this.connect();
			try 
			{
				if(radio.equals("location"))
				{
					PreparedStatement pst = con.prepareStatement("select * from job_description where location=?");
					pst.setString(1,search_value);
					ResultSet rs=pst.executeQuery();
					ArrayList<createjob_bean> jobs = new ArrayList<createjob_bean>(); 
					while(rs.next())
					{
						createjob_bean crj = new createjob_bean();
						crj.setInstitute(rs.getString(2));
						crj.setProfile(rs.getString(3));
						crj.setJobtype(rs.getString(4));
						crj.setLocation(rs.getString(5));
						crj.setPart_time(rs.getString(6));
						crj.setOpenings(rs.getInt(7));
						crj.setResponsibility(rs.getString(8));
						crj.setSalary(rs.getInt(9));
						crj.setId(rs.getInt(10));
					
						
						jobs.add(crj);
					}
					return jobs;
				}
				else if(radio.equals("salary"))
				{
					int salary=Integer.parseInt(search_value);
					PreparedStatement pst = con.prepareStatement("select * from job_description where salary>=?");
					pst.setInt(1,salary);
					ResultSet rs=pst.executeQuery();
					ArrayList<createjob_bean> jobs = new ArrayList<createjob_bean>(); 
					while(rs.next())
					{
						createjob_bean crj = new createjob_bean();
						crj.setInstitute(rs.getString(2));
						crj.setProfile(rs.getString(3));
						crj.setJobtype(rs.getString(4));
						crj.setLocation(rs.getString(5));
						crj.setPart_time(rs.getString(6));
						crj.setOpenings(rs.getInt(7));
						crj.setResponsibility(rs.getString(8));
						crj.setSalary(rs.getInt(9));
						crj.setId(rs.getInt(10));
					
						
						jobs.add(crj);
					}
					return jobs;
					
				}
				else if(radio.equals("profile"))
				{
					PreparedStatement pst = con.prepareStatement("select * from job_description where profile like '%"+search_value+"%'");
					ResultSet rs=pst.executeQuery();
					ArrayList<createjob_bean> jobs = new ArrayList<createjob_bean>(); 
					while(rs.next())
					{
						createjob_bean crj = new createjob_bean();
						crj.setInstitute(rs.getString(2));
						crj.setProfile(rs.getString(3));
						crj.setJobtype(rs.getString(4));
						crj.setLocation(rs.getString(5));
						crj.setPart_time(rs.getString(6));
						crj.setOpenings(rs.getInt(7));
						crj.setResponsibility(rs.getString(8));
						crj.setSalary(rs.getInt(9));
						crj.setId(rs.getInt(10));
					
						
						jobs.add(crj);
					}
					return jobs;
				}
				
			}
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
			return null;
		}
		
		
		//-------------------------------------------------------------------------------------------------------------
		
		public ArrayList<applicants> view_applicants(int id)
		{
			try{
			
			Connection con=this.connect();
			PreparedStatement pst = con.prepareStatement("select a.id,a.username,institute,email from applied a,job_aspirant_register where a.username=job_aspirant_register.username and a.id=?");
			pst.setInt(1,id);
			ResultSet rs = pst.executeQuery();
			ArrayList<applicants> jobs = new ArrayList<applicants>();
		
			while(rs.next())
			{
				applicants applicants = new applicants();
				applicants.setId(id);
				applicants.setUname(rs.getString(2));
				applicants.setInstitute(rs.getString(3));
				applicants.setEmail(rs.getString(4));
				
				jobs.add(applicants);
			}
			return jobs;
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return null;
	
		}
		
		//------------------------------------------------------------------------------------------------------------
		
		public int insert_resume(String uname,String filepath)
		{
			int i=0;
			try{
				
				Connection con=this.connect();
				PreparedStatement pst = con.prepareStatement("insert into resume_doc values(?,?)");
				pst.setString(1,uname);
				pst.setString(2,filepath);
				i=pst.executeUpdate();
				
			}
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
			return i;
			
		}
		//------------------------------------------------------------------------------------------------------------
		
		public String select_resume(String uname)
		{
			try{
				
				Connection con=this.connect();
				PreparedStatement pst = con.prepareStatement("select resume_path from resume_doc where uname=?");
				pst.setString(1,uname);
				ResultSet rs=pst.executeQuery();
				String path="";
				if(rs.next())
				{	
					path=rs.getString(1);
				}
				return path;
			}
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
			return null;
			
		}
		
		//-----------------------------------------------------------------------------------------------------------
		
		public int resume_present(String uname)
		{
			int i=0;
			try{
				
				Connection con=this.connect();
				PreparedStatement pst = con.prepareStatement("select resume_path from resume_doc where uname=?");
				pst.setString(1,uname);
				ResultSet rs=pst.executeQuery();
				String path="";
				if(rs.next())
				{	
					path=rs.getString(1);
				}
				if(path=="")
				{
					return i;
				}
				else
				{
					return ++i;
				}		
			}
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
			return i;
			
		}
		
		//-------------------------------------------------------------------------------------------------------------
		
		public int delete_resume(String uname)
		{
			int i=0;
			try{
				
				Connection con=this.connect();
				PreparedStatement pst = con.prepareStatement("delete from resume_doc where uname=?");
				pst.setString(1,uname);
				i=pst.executeUpdate();
				return i;
			}
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
			return i;
			
		}
		
		//--------------------------------------------------------------------------------------------------------------
		
		public int check_applied(int id, String uname)
		{
			int i=0;
			try{
			
			Connection con=this.connect();
			PreparedStatement pst = con.prepareStatement("select count(*) from applied where id=? and username=?");
			pst.setInt(1,id);
			pst.setString(2, uname);
			ResultSet rs = pst.executeQuery();
			
			if(rs.next())
			{
				i=rs.getInt(1);
			}
			return i;
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return i;
	
		}
		
		//---------------------------------------------------------------------------------------------------------------
		
		public ArrayList<user_data> all_aspirants()
		{
			Connection con=this.connect();
			
			try 
			{
				PreparedStatement pst = con.prepareStatement("select * from job_aspirant_register ");
				ResultSet rs = pst.executeQuery();
				ArrayList<user_data> aspirants = new ArrayList<user_data>();
			
				while(rs.next())
				{
					user_data user = new user_data();
					user.setUname(rs.getString(1));
					user.setPassword(rs.getString(2));
					user.setInstitute(rs.getString(3));
					user.setEmail(rs.getString(4));
					
					aspirants.add(user);
				}
				return aspirants;
			}
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
			return null;
		}
		
		//---------------------------------------------------------------------------------------------------------------
		
		public ArrayList<user_data> all_companies()
		{
			Connection con=this.connect();
			
			try 
			{
				PreparedStatement pst = con.prepareStatement("select * from company_register");
				ResultSet rs = pst.executeQuery();
				ArrayList<user_data> companies = new ArrayList<user_data>();
			
				while(rs.next())
				{
					user_data user = new user_data();
					user.setUname(rs.getString(1));
					user.setPassword(rs.getString(2));
					user.setInstitute(rs.getString(4));
					user.setEmail(rs.getString(3));
					
					companies.add(user);
				}
				return companies;
			}
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
			return null;
		}	
		
		//--------------------------------------------------------------------------------------------------------------
		
		public int delete_aspirant(String uname)
		{
			Connection con=this.connect();
			int i=0;
			try 
			{
				PreparedStatement pst = con.prepareStatement("delete from job_aspirant_register where username=?");
				pst.setString(1, uname);
				i=pst.executeUpdate();
				return i;
			}
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
			return i;
		}
		
		//--------------------------------------------------------------------------------------------------------------

		public int delete_company(String uname)
		{
			Connection con=this.connect();
			int i=0;
			try 
			{
				PreparedStatement pst = con.prepareStatement("delete from company_register where username=?");
				pst.setString(1, uname);
				i=pst.executeUpdate();
				return i;
			}
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
			return i;
		}
		
		//--------------------------------------------------------------------------------------------------------------

				public int insert_profile(user_profile profile)
				{
					Connection con=this.connect();
					int i=0;
					try 
					{
						PreparedStatement pst = con.prepareStatement("insert into user_profile values(?,?,?,?,?,?,?,?)");
						pst.setString(1, profile.getUname());
						pst.setString(2, profile.getFname());
						pst.setString(3, profile.getLname());
						pst.setString(4, profile.getCity());
						pst.setString(5, profile.getState());
						pst.setString(6, profile.getSex());
						pst.setString(7, profile.getAddress());
						pst.setString(8, profile.getMobileno());
						
						i=pst.executeUpdate();
						return i;
					}
					catch (SQLException e) 
					{
						e.printStackTrace();
					}
					return i;
				}
		//--------------------------------------------------------------------------------------------------------------
				
				public int profile_present(String uname)
				{
					int i=0;
					try{
					
					Connection con=this.connect();
					PreparedStatement pst = con.prepareStatement("select count(*) from user_profile where uname=?");
					pst.setString(1, uname);
					ResultSet rs = pst.executeQuery();
					
					if(rs.next())
					{
						i=rs.getInt(1);
					}
					return i;
				}
				catch (SQLException e) 
				{
					e.printStackTrace();
				}
				return i;
			
				}
				
		//--------------------------------------------------------------------------------------------------------------
				
				public user_profile select_profile(String uname)
				{
					int i=0;
					try{
					
					Connection con=this.connect();
					PreparedStatement pst = con.prepareStatement("select * from user_profile where uname=?");
					pst.setString(1, uname);
					ResultSet rs = pst.executeQuery();
					user_profile profile = new user_profile();
					
					if(rs.next())
					{
						profile.setFname(rs.getString(2));
						profile.setLname(rs.getString(3));
						profile.setCity(rs.getString(4));
						profile.setState(rs.getString(5));
						profile.setSex(rs.getString(6));
						profile.setAddress(rs.getString(7));
						profile.setMobileno(rs.getString(8));
						
					}
					return profile;
				}
				catch (SQLException e) 
				{
					e.printStackTrace();
				}
				return null;
			
				}
				
				//--------------------------------------------------------------------------------------------------------------

				public int update_profile(user_profile profile)
				{
					Connection con=this.connect();
					int i=0;
					try 
					{
						PreparedStatement pst = con.prepareStatement("update user_profile set fname=?,lname=?,city=?,state=?,sex=?,address=?,mobileno=?");
						//pst.setString(1, profile.getUname());
						pst.setString(1, profile.getFname());
						pst.setString(2, profile.getLname());
						pst.setString(3, profile.getCity());
						pst.setString(4, profile.getState());
						pst.setString(5, profile.getSex());
						pst.setString(6, profile.getAddress());
						pst.setString(7, profile.getMobileno());
						
						i=pst.executeUpdate();
						return i;
					}
					catch (SQLException e) 
					{
						e.printStackTrace();
					}
					return i;
				}
				
				//-----------------------------------------------------------------------------------------------------------------------------------------
				
				public int insert_status(int id, String uname)
				{
					Connection con=this.connect();
					int i=0;
					try 
					{
						PreparedStatement pst = con.prepareStatement("insert into status values(?,?,?,?,?)");
						pst.setInt(1,id);
						pst.setString(2,uname);
						pst.setString(3, "call pending");
						pst.setString(4, "----");
						pst.setString(5, "----");
						i=pst.executeUpdate();
						
						return i;
					}
					catch (SQLException e) 
					{
						e.printStackTrace();
					}
					return i;
				}
				
//-----------------------------------------------------------------------------------------------------------------------------------------
				
				public int update_status(int id, String uname,String tel,String pi,String hr)
				{
					Connection con=this.connect();
					int i=0;
					try 
					{
						PreparedStatement pst = con.prepareStatement("update status set tel=?,pi=?,hr=? where id=? and uname=? ");
						pst.setInt(4,id);
						pst.setString(5,uname);
						pst.setString(1,tel);
						pst.setString(2, pi);
						pst.setString(3, hr);
						i=pst.executeUpdate();
						
						return i;
					}
					catch (SQLException e) 
					{
						e.printStackTrace();
					}
					return i;
				}
				
//-----------------------------------------------------------------------------------------------------------------------------------------
				
				public String select_status(int id, String uname)
				{
					Connection con=this.connect();
					String st="";
					status s = new status();
					try 
					{
						PreparedStatement pst = con.prepareStatement("select * from status where id=? and uname=?");
						pst.setInt(1,id);
						pst.setString(2,uname);
						ResultSet rs = pst.executeQuery();
						if(rs.next())
						{
							s.setTel(rs.getString(3));
							s.setPi(rs.getString(4));
							s.setHr(rs.getString(5));
						
							if(s.getTel().equalsIgnoreCase("success"))
							{
								if(s.getPi().equalsIgnoreCase("success"))
								{
									if(s.getHr().equalsIgnoreCase("success"))
									{
										st="Selected";
									}
									else if(s.getHr().equalsIgnoreCase("rejected"))
									{
										st="Rejected";
									}
									else
									{
										st="HR Pending";
									}
								}
								else if(s.getPi().equalsIgnoreCase("rejected"))
								{
									st="Rejected";
								}
								else
								{
									st="PI Pending";
								}
							}
							else if(s.getTel().equalsIgnoreCase("call pending"))
							{
								st="Call Pending";
							}
							else if(s.getTel().equalsIgnoreCase("rejected"))
							{
								st="Rejected";
							}
						}
						return st;
					}
					catch (SQLException e) 
					{
						e.printStackTrace();
					}
					return st;
				}
				

//-----------------------------------------------------------------------------------------------------------------------------------------
				
				public status return_status(int id, String uname)
				{
					Connection con=this.connect();
					status s = new status();
					try 
					{
						PreparedStatement pst = con.prepareStatement("select * from status where id=? and uname=?");
						pst.setInt(1,id);
						pst.setString(2,uname);
						ResultSet rs = pst.executeQuery();
						if(rs.next())
						{
							s.setTel(rs.getString(3));
							s.setPi(rs.getString(4));
							s.setHr(rs.getString(5));
						
							return s;
						}
					}
					catch (SQLException e) 
					{
						e.printStackTrace();
					}
					return s;
				}
				
//-----------------------------------------------------------------------------------------------------------------------------------------
				
				public int delete_job_child_dependency(int id)
				{
					Connection con=this.connect();
					int i=0;
					int j=0;
					try 
					{
						PreparedStatement pst = con.prepareStatement("delete from applied where id=?");
						pst.setInt(1,id);
						i=pst.executeUpdate();
						pst = con.prepareStatement("delete from status where id=?");
						j=pst.executeUpdate();
						return i;
					}
					catch (SQLException e) 
					{
						e.printStackTrace();
					}
					return i;
				}
				

}
