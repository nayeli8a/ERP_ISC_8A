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
import modelo.datos.EmpleadosDAO;
import modelo.datos.IncapacidadesDAO;


@MultipartConfig(maxFileSize = 16177216)//15mb
@WebServlet("/IMG")
public class IMGServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public IMGServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("### IMG Servlet ###");
		
		String op = request.getParameter("op");
		
		
		switch (op) {
		case "documentacion":
			DocumentacionEmpleadoDAO dedao = new DocumentacionEmpleadoDAO();
			//este metodo servira para mandar la imagen de las personas
			int id = Integer.parseInt(request.getParameter("idDocumento"));
			dedao.ListarPDF(id, response);
			break;

		case "fotoempleado":
			EmpleadosDAO edao = new EmpleadosDAO();
			id = Integer.parseInt(request.getParameter("idFoto"));
			edao.ListarImagen(id, response);
			break;
			
		case "incapacidad":
			IncapacidadesDAO idao = new IncapacidadesDAO();
			id = Integer.parseInt(request.getParameter("evidencia"));
			System.out.println(id);
			idao.ListarPDF(id, response);
			break;	
			
		}
		
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
