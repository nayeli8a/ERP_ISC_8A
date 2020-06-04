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

import modelo.beans.DocumentacionEmpleado;
import modelo.datos.Constantes;
import modelo.datos.DocumentacionEmpleadoDAO;


@MultipartConfig(maxFileSize = 16177216)//15mb necesario para obtener objetos desde el formulario de envio de archivos
@WebServlet("/DocumentacionEmpleado")
public class DocumentacionEmpleadoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    
    public DocumentacionEmpleadoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    
  	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  				// aqui va todo el codigo
  				System.out.println("##Dentro de DocumentacionEmpleadoServlet##");
  				String url = Constantes.PAGINAPRINCIPAL;
  				String op = request.getParameter("op");

          switch(op)
  				{
  	          case "Listar":
  					DocumentacionEmpleadoDAO dedao = new DocumentacionEmpleadoDAO();
  				    String pagina = request.getParameter("pagina");
  					List<DocumentacionEmpleado> datos = dedao.consultar(pagina);
  					request.setAttribute("datos", datos);
  					request.setAttribute("pagina",pagina);
  					url=modelo.datos.Constantes.REGRESAR_RH_CONSULTA+"documentacionEmpleado.jsp";
  				break;
  				case "Editar":
  					dedao = new DocumentacionEmpleadoDAO();
  					DocumentacionEmpleado datosed = dedao.consultaIndividual(Integer.parseInt(request.getParameter("id")));
  					request.setAttribute("datos", datosed);
  					url=modelo.datos.Constantes.REGRESAR_RH_EDITAR+"documentacionEmpleado.jsp";
  					break;
              case "Eliminar":
    					dedao = new DocumentacionEmpleadoDAO();
    					dedao.eliminar(request.getParameter("id"));
    					url = "DocumentacionEmpleado?op=Listar&pagina=1";
    					break;
              case "Modificar":
      				    dedao = new DocumentacionEmpleadoDAO();
      					DocumentacionEmpleado de = new DocumentacionEmpleado();
      					String NombreDocumento=request.getParameter("nombreDocumento");
      					Date FechaEntrega=Date.valueOf(request.getParameter("fechaEntrega"));
      					int idEmpleado=Integer.valueOf(request.getParameter("idEmpleado"));
      					String estatus=request.getParameter("estatus");
      					int idDocumento=Integer.valueOf(request.getParameter("idDocumento"));
      					response.setContentType("text/html;charset=UFT-8");
						Part Documento = request.getPart("documento");
				        InputStream InputS = Documento.getInputStream();
      				
      					if(InputS.read()==-1){
      						//Sin imagen 
      						dedao.actualizarSinImagen(NombreDocumento, FechaEntrega, idEmpleado, estatus, idDocumento);
      						
      					}
      					else{
      						de.setNombreDocumento(request.getParameter("nombreDocumento"));
          					de.setFechaEntrega(Date.valueOf(request.getParameter("fechaEntrega")));
          					response.setContentType("text/html;charset=UFT-8");
    						Part DocumentoS = request.getPart("documento");
    				        InputStream Input = DocumentoS.getInputStream();
          					de.setDocumento(Input);
          					de.setIdEmpleado(Integer.valueOf(request.getParameter("idEmpleado")));
          					de.setEstatus(request.getParameter("estatus"));
          					de.setIdDocumento(Integer.valueOf(request.getParameter("idDocumento")));
          					dedao.actualizar(de);

      						
      					}
      					
      					
      					
      					url = "DocumentacionEmpleado?op=Listar&pagina=1";
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
