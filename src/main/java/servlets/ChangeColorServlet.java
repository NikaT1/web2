package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet("/changeColorServlet")
public class ChangeColorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        ArrayList<Boolean> arrayList;
        if (session.getAttribute("color") != null) {
            arrayList = (ArrayList<Boolean>) session.getAttribute("color");
        } else arrayList = new ArrayList<>();
        if (Integer.parseInt(String.valueOf(req.getParameter("args"))) == 1) {
            arrayList.add(true);
        } else arrayList.add(false);
        session.setAttribute("color", arrayList);
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }
}