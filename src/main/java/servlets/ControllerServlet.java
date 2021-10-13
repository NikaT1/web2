package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/controller")
public class ControllerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("x") != null && req.getParameter("y") != null && req.getParameter("r") != null) {
            getServletContext().getRequestDispatcher("/areaCheck").forward(req, resp);
        } else if (req.getParameter("command") != null && req.getParameter("command").equals("clear")) {
            getServletContext().getRequestDispatcher("/clearTable").forward(req, resp);
        } else if (req.getParameter("command") != null && req.getParameter("command").equals("color")) {
            getServletContext().getRequestDispatcher("/changeColorServlet").forward(req, resp);
        } else {
            getServletContext().getRequestDispatcher("/index.js").forward(req, resp);
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/index.js").forward(req, resp);
    }
}
