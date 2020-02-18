package controladores;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.datos.*;

/**
 * Servlet implementation class RegistrarServlet
 */
@WebServlet("/Registrar")
public class RegistrarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrarServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		// aqui va todo el codigo
		System.out.println("##Dentro de RegistrarServlet##");
		String op = request.getParameter("op");
		String url = "index.jsp";
		
		switch(op)
		{
			case "Estado":
				//generamos el objeto a llenar
				EstadoDAO esdao = new EstadoDAO();
				
				String nom_estado = request.getParameter("nom_estado");
				String siglas = request.getParameter("siglas");
				String estatus = request.getParameter("estatus");
				
				//validamos que el estado no exista ya en la BD
				//si el estado no existe en la bd, entonces lo agregamos
				if(!esdao.ValidarEstado(nom_estado))
				{
					esdao.insertarEstado(nom_estado, siglas, estatus);
				}
				url=modelo.datos.Constantes.REGRESAR_RH;
			break;
			
			case "Ciudad":
				//generamos el objeto a llenar
				CiudadesDAO cdao = new CiudadesDAO();
				
				String nom_ciudad = request.getParameter("nom_ciudad");
				nom_estado = request.getParameter("nom_estado");
				estatus = request.getParameter("estatus");
				if(!cdao.ValidarCiudades(nom_ciudad))
				{
					cdao.insertarCiudades(nom_ciudad,nom_estado, estatus);
				}
				url=modelo.datos.Constantes.REGRESAR_RH;
				break;
				
			case "Deducciones":
				//generamos el objeto a llenar
				DeduccionesDAO ddao = new DeduccionesDAO();
				
				String nom_deducciones = request.getParameter("nom_deducciones");
				String descripcion = request.getParameter("descripcion");
				float porcentaje = 	Float.parseFloat(request.getParameter("porcentaje"));
				estatus = request.getParameter("estatus");
				
				//validamos que el estado no exista ya en la BD
				//si el estado no existe en la bd, entonces lo agregamos
				System.out.println(ddao.ValidarDeducciones(nom_deducciones));
				if(!ddao.ValidarDeducciones(nom_deducciones))
				{
					ddao.insertarDeducciones(nom_deducciones, descripcion, porcentaje, estatus);
				}
				url=modelo.datos.Constantes.REGRESAR_RH;
			break;
			case "Percepciones":
				//generamos el objeto a llenar
				PercepcionesDAO pdao = new PercepcionesDAO();
				String nom_percepciones = request.getParameter("nom_percepciones");
				String descripcion_percepciones = request.getParameter("descripcion");
				int diasPagar = Integer.parseInt(request.getParameter("diasPagar"));
				estatus = request.getParameter("estatus");
				
				//validamos que el estado no exista ya en la BD
				//si el estado no existe en la bd, entonces lo agregamos
				System.out.println(pdao.ValidarPercepciones(nom_percepciones));
				if(!pdao.ValidarPercepciones(nom_percepciones))
				{
					pdao.insertarPercepciones(nom_percepciones, descripcion_percepciones, diasPagar, estatus);
				}
				url=modelo.datos.Constantes.REGRESAR_RH;
			break;
			
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
