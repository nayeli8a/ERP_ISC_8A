package controladores;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.datos.EmpleadosDAO;

/**
 * Servlet implementation class IMGPersona
 */
@WebServlet("/IMGPersona")
public class IMGPersona extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IMGPersona() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EmpleadosDAO empdao = new EmpleadosDAO();
		System.out.println("### IMGPersona Servlet ###");
		
		//este metodo servira para mandar la imagen de los empleados
		int id=Integer.parseInt(request.getParameter("idfoto"));
		empdao.ListarImagen(id, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
