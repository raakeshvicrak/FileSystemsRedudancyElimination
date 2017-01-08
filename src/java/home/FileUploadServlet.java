package home;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class FileUploadServlet
 */
@WebServlet("/FileUploadServlet")
public class FileUploadServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileUploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    private static final String UPLOAD_DIRECTORY = "upload";
    private static final String TEST_DIRECTORY = "upload//temp";
    private static final int THRESHOLD_SIZE = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

        HttpSession ses = request.getSession(false);
        String u1 = (String) ses.getAttribute("uid");
        int u = Integer.parseInt(u1);

        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        if (!ServletFileUpload.isMultipartContent(request)) {
            PrintWriter writer = response.getWriter();
            writer.println("Request does not contain upload data");
            writer.flush();
            return;
        }
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(THRESHOLD_SIZE);
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setFileSizeMax(MAX_FILE_SIZE);
        upload.setSizeMax(MAX_REQUEST_SIZE);

		//System.out.println(getServletContext());
		//String uploadPath = getServletContext().getRealPath("")
        //  + File.separator + UPLOAD_DIRECTORY;
        String uploadPath = Dbconnection.path + "//" + UPLOAD_DIRECTORY;

			// creates the directory if it does not exist
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        String fileName = "";
        try {
            List formItems = upload.parseRequest(request);
            Iterator iter = formItems.iterator();

            // iterates over form's fields
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();
                // processes only fields that are not form fields
                if (!item.isFormField()) {
                    fileName = new File(item.getName()).getName();
                    String filePath = Dbconnection.path + "//" + UPLOAD_DIRECTORY + "//" + fileName;

                    // System.out.println(filePath);
                    File storeFile = new File(filePath);

                    // saves the file on disk
                    try {
                        //Check for duplication
                        File tempdir = new File(Dbconnection.path + "//" + TEST_DIRECTORY);
                        if (!tempdir.isDirectory()) {
                            tempdir.mkdirs();
                        }

                        File tempfile = new File(Dbconnection.path + "//" + TEST_DIRECTORY, fileName);
                        tempfile.createNewFile();
                        item.write(tempfile);

                        BufferedReader br = new BufferedReader(new FileReader(tempfile));
                        String con = "", content = "";
                        while ((content = br.readLine()) != null) {
                            con += content;
                        }
                        br.close();
                        Encrypt en = new Encrypt();
                        String cipher = en.encryptfile(con);

                        Connection mycon = Dbconnection.conn();
                        PreparedStatement ps1 = mycon.prepareStatement("select * from ciphersignature where ciphersignature =?");
                        ps1.setString(1, cipher);
                        ResultSet rs = ps1.executeQuery();
                        if (rs.next()) {
                            PreparedStatement ps = mycon.prepareStatement("insert into owner (userid,fname)values(?,?)");
                            ps.setInt(1, u);
                            ps.setString(2, rs.getString("fname"));
                            //ps.executeUpdate();
                            response.sendRedirect("fileexist.jsp?fname=" + rs.getString("fname"));
                        } else {

                            PreparedStatement ps2 = mycon.prepareStatement("insert into ciphersignature (uid,fname,ciphersignature)values(?,?,?)");
                            ps2.setInt(1, u);
                            ps2.setString(2, tempfile.getName());
                            ps2.setString(3, cipher);
                            ps2.executeUpdate();

                            item.write(storeFile);
                            int userid = 0;
                            String filename = "";
                            List<FileItem> multiparts = new ServletFileUpload(
                                    new DiskFileItemFactory()).parseRequest(request);

                            for (FileItem item2 : multiparts) {

                                if (item2.isFormField()) {
                                    String formdata = item2.getFieldName();
                                    if (formdata.equals("t1")) {
                                        userid = Integer.parseInt(item2.getString());
                                        System.out.println(u);
                                    }
                                }
                            }

                            Connection c = Dbconnection.conn();
                            PreparedStatement ps = c.prepareStatement("insert into owner (userid,fname)values(?,?)");
                            ps.setInt(1, u);
                            ps.setString(2, fileName);
                            int i = ps.executeUpdate();
                            if (i > 0) {
                                response.sendRedirect("uploadsuccess.jsp");

                            } else {
                                out.println("Not uploaded!!!!");
                            }
                        }

                        tempfile.setWritable(true);
                        tempfile.delete();

                    } catch (Exception e) {

                        e.printStackTrace();
                    }
                }
            }
        } catch (FileUploadException e) {
            System.out.println("Two");
            response.sendRedirect("uploadFile.jsp?msg=Registration Failed");
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

}
