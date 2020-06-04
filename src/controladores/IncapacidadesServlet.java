package controladores;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import modelo.beans.Incapacidades;
import modelo.datos.Constantes;
import modelo.datos.IncapacidadesDAO;


@MultipartConfig(maxFileSize = 16177216)//15mb necesario para obtener objetos desde el formulario de envio de archivos
@WebServlet("/Incapacidades")
public class IncapacidadesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public IncapacidadesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				// aqui va todo el codigo
				System.out.println("##Dentro de IncapacidadesServlet##");
				String url = Constantes.PAGINAPRINCIPAL;
				String op = request.getParameter("op");
				
				switch(op)
				{
				case "Listar":
					IncapacidadesDAO indao = new IncapacidadesDAO();
				    String pagina = request.getParameter("pagina");
					List<Incapacidades> datos = indao.consultar(pagina);
					request.setAttribute("datos", datos);
					request.setAttribute("pagina",pagina);
					url=modelo.datos.Constantes.REGRESAR_RH_CONSULTA+"incapacidades.jsp";
				break;
				case "Editar":
					indao = new IncapacidadesDAO();
					Incapacidades datosIncapacidades = indao.consultaIndividual(Integer.parseInt(request.getParameter("id")));
					request.setAttribute("datosIncapacidades", datosIncapacidades);
					url=modelo.datos.Constantes.REGRESAR_RH_EDITAR+"incapacidades.jsp";
					break;
				case "Eliminar":
					indao = new IncapacidadesDAO();
					indao.eliminar(request.getParameter("id"));
					url = "Incapacidades?op=Listar&pagina=1";
					break;
				case "Modificar":
				    indao = new IncapacidadesDAO();
					Incapacidades in = new Incapacidades ();
					Date FechaInicio=Date.valueOf(request.getParameter("fechaInicio"));
					Date FechaFin=Date.valueOf(request.getParameter("fechaFin"));
					String Enfermedad=(request.getParameter("enfermedad"));
					response.setContentType("text/html;charset=UFT-8");
					Part Documento = request.getPart("evidencianueva");
			        InputStream InputS = Documento.getInputStream();
			        int idEmpleado=(Integer.valueOf(request.getParameter("idEmpleado")));
					String Estatus=(request.getParameter("estatus"));
					int idIncapacidad =(Integer.valueOf(request.getParameter("idIncapacidad")));
					if(InputS.read()==-1){
						
						System.out.println("##actualizacion Sin imagen##");
						System.out.println(InputS.read());
						indao.actualizarSinImagen(FechaInicio, FechaFin, Enfermedad, idEmpleado, Estatus, idIncapacidad);
					}
					else{
						System.out.println("##actualizacion CON imagen##");
						in.setFechaInicio(Date.valueOf(request.getParameter("fechaInicio")));
						in.setFechaFin(Date.valueOf(request.getParameter("fechaFin")));
						in.setEnfermedad(request.getParameter("enfermedad"));
						response.setContentType("text/html;charset=UFT-8");
						Documento = request.getPart("evidencianueva");
				        InputS = Documento.getInputStream();
				        in.setEvidencia(InputS);
				        in.setIdEmpleado(Integer.valueOf(request.getParameter("idEmpleado")));
						in.setEstatus(request.getParameter("estatus"));
						in.setIdIncapacidad(Integer.valueOf(request.getParameter("idIncapacidad")));
						indao.actualizar(FechaInicio, FechaFin, Enfermedad, InputS, idEmpleado, Estatus, idIncapacidad);
						
					}
					
					
					url = "Incapacidades?op=Listar&pagina=1";

					
					break;
						
				}
				
				RequestDispatcher rd = request.getRequestDispatcher(url);
				rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
