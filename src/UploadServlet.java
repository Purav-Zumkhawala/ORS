

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import util.Dao;
 
/**
 * A Java servlet that handles file upload from client.
 * @author www.codejava.net
 */
@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    private static final int THRESHOLD_SIZE     = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB
 
    /**
     * handles file upload via HTTP POST method
     */
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // checks if the request actually contains upload file
    	System.out.println("Servlet call");
        if (!ServletFileUpload.isMultipartContent(request)) {
            PrintWriter writer = response.getWriter();
            writer.println("Request does not contain upload data");
            writer.flush();
            return;
        }
         
        // configures upload settings
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(THRESHOLD_SIZE);
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
         
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setFileSizeMax(MAX_FILE_SIZE);
        upload.setSizeMax(MAX_REQUEST_SIZE);
         
       
        File uploadDir = new File("D:/NeonWorkspace/ORS1Project/WebContent/upload");
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
         
        try {
        	PrintWriter out= response.getWriter();
            // parses the request's content to extract file data
            List formItems = upload.parseRequest(request);
            Iterator iter = formItems.iterator();
            // iterates over form's fields
            HttpSession session= request.getSession();
            String uname=session.getAttribute("uname").toString();
            /*int id= Integer.parseInt(request.getParameter("id"));*/
            int i=0;
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();
                // processes only fields that are not form fields
                if (!item.isFormField()) {
                    String fileName = new File(item.getName()).getName();
                    String filePath = "D:/NeonWorkspace/ORS1Project/WebContent/upload/" + File.separator + fileName;
                    File storeFile = new File(filePath);

                    // saves the file on disk
                    item.write(storeFile);
                    
                    Dao obj = new Dao();
                    String path="upload/"+fileName;
                    i=obj.insert_resume(uname, path);
                }
            }
            if(i>0)
            	response.sendRedirect("All_job_aspirant.jsp");
            else
            	out.println(" not inserted");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        //getServletContext().getRequestDispatcher("/message.jsp").forward(request, response);
    }
}