package controladores;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.beans.FormasPago;
import modelo.datos.FormasPagoDAO;

@WebServlet("/FormasPago")
public class FormasPagoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public FormasPagoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("##Dentro de FormasPagoServlet##");
		String url = "index.jsp";
		HttpSession sesion;
		String op = request.getParameter("op");
		
		switch(op)
		{
			case "Listar":
				FormasPagoDAO pagodao = new FormasPagoDAO();
				String pagina = request.getParameter("pagina");
				List<FormasPago> datos =pagodao.consultar(pagina);
				request.setAttribute("datos", datos);
				request.setAttribute("pagina",pagina);
				url=modelo.datos.Constantes.REGRESAR_RH_CONSULTA+"formasPago.jsp";
			break;
			case "ListarPNominas":
				pagodao = new FormasPagoDAO();
				datos =pagodao.consultar();
				request.setAttribute("datos", datos);
				url="/comunes/RecursosHumanos/registrar-nominas.jsp";
			break;
			case "Eliminar":
				pagodao = new FormasPagoDAO();
				pagodao.eliminar(request.getParameter("id"));
				url="FormasPago?op=Listar&pagina=1";
				break;
			case "Editar":
				pagodao = new FormasPagoDAO();
				FormasPago datosformaspago = pagodao.consultaIndividual(Integer.parseInt(request.getParameter("id")));
				request.setAttribute("datosformaspago", datosformaspago);
				url=modelo.datos.Constantes.REGRESAR_RH_EDITAR+"formasPago.jsp";
				break;
			case "Modificar":
				pagodao = new FormasPagoDAO();
				FormasPago pago = new FormasPago();
				pago.setIdFormaPago(Integer.parseInt(request.getParameter("id")));
				pago.setNombre(request.getParameter("nombre"));
				pago.setEstatus(request.getParameter("estatus"));
				pagodao = new FormasPagoDAO();
				pagodao.actualizar(pago);
				url="FormasPago?op=Listar&pagina=1";
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
