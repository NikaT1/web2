package servlets;

import data.DataFromTable;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/clearTable")
public class ClearTableServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        ArrayList<DataFromTable> arrayList;
        if (session.getAttribute("resultData") != null) {
            arrayList = (ArrayList<DataFromTable>) session.getAttribute("resultData");
        } else arrayList = new ArrayList<>();
        arrayList.clear();
        session.setAttribute("resultData", arrayList);
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }
}