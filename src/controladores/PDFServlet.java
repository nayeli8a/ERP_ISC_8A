package controladores;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.darwinsys.*;

import modelo.datos.DocumentacionEmpleadoDAO;


@MultipartConfig(maxFileSize = 16177216)//15mb
@WebServlet("/PDF")
public class PDFServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public PDFServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DocumentacionEmpleadoDAO dedao = new DocumentacionEmpleadoDAO();
		System.out.println("### PDF Servlet ###");
		
		//este metodo servira para mandar la imagen de las personas
		int id = Integer.parseInt(request.getParameter("idDocumento"));
		dedao.ListarPDF(id, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
