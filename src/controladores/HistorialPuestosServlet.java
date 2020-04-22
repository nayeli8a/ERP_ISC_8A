package controladores;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.beans.*;
import modelo.datos.*;

/**
 * Servlet implementation class IncapacidadesServlet
 */
@WebServlet("/HistorialPuestos")
public class HistorialPuestosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public HistorialPuestosServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          // aqui va todo el codigo
          System.out.println("##Dentro de HistorialPuestosServlet##");
          String url = Constantes.PAGINAPRINCIPAL;
          String op = request.getParameter("op");

					switch(op)
					{
					case "Listar":
						HistorialPuestosDAO hpDAO = new HistorialPuestosDAO();
					    String pagina = request.getParameter("pagina");
						List<HistorialPuestos> datos = hpDAO.consultar(pagina);
						request.setAttribute("datos", datos);
						request.setAttribute("pagina",pagina);
						url=modelo.datos.Constantes.REGRESAR_RH_CONSULTA+"historialPuestos.jsp";
					break;
