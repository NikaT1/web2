package servlets;

import data.DataFromTable;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import static java.lang.Math.pow;

@WebServlet("/areaCheck")
public class AreaCheckServlet extends HttpServlet {

    private double x;
    private double y;
    private double r;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long start = System.nanoTime();
        String answer = "нет";
        boolean isValid;
        String param_x = req.getParameter("x").replace(",", ".");
        String param_y = req.getParameter("y").replace(",", ".");
        String param_r = req.getParameter("r").replace(",", ".");
        if (checkAll(param_x, param_y, param_r)) {
            isValid = true;
            x = Double.parseDouble(param_x);
            y = Double.parseDouble(param_y);
            r = Double.parseDouble(param_r);
            if (rectangle(x, y, r) || triangle(x, y, r) || circle(x, y, r)) {
                answer = "да";
            }
        } else {
            isValid = false;
            answer = "нет";
        }
        HttpSession session = req.getSession();
        ArrayList<DataFromTable> arrayList;
        if (session.getAttribute("resultData") != null) {
            arrayList = (ArrayList<DataFromTable>) session.getAttribute("resultData");
        } else arrayList = new ArrayList<>();
        long finish = System.nanoTime();
        double scriptTime = ((finish - start) * pow(10, -6));
        scriptTime = getRoundDouble(scriptTime, 3);
        x = getRoundDouble(x, 3);
        y = getRoundDouble(y, 3);
        SimpleDateFormat formatter = new SimpleDateFormat("HH:mm");
        Date date = new Date(System.currentTimeMillis());
        String time = formatter.format(date);
        DataFromTable dataFromTable = new DataFromTable(x, y, r, time, scriptTime, answer, isValid);
        arrayList.add(dataFromTable);
        session.setAttribute("resultData", arrayList);
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }

    private double getRoundDouble(double value, int count) {
        BigDecimal bd = new BigDecimal(Double.toString(value));
        bd = bd.setScale(count, RoundingMode.HALF_UP);
        value = bd.doubleValue();
        return value;
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getServletContext().getNamedDispatcher("/index.jsp").forward(req, resp);
    }

    private boolean checkX(String x) {
        final double MAX = 5;
        final double MIN = -5;
        if (x.equals("")) return false;
        try {
            double doubleX = Double.parseDouble(x);
            return (doubleX > MIN && doubleX < MAX);
        } catch (NumberFormatException e) {
            return false;
        }
    }

    private boolean checkY(String y) {
        try {
            double doubleY = Double.parseDouble(y);
            return (doubleY >= -2 && doubleY <= 2);
        } catch (NumberFormatException e) {
            return false;
        }
    }

    private boolean checkR(String r) {
        List<Double> yArray = Arrays.asList(1.0, 1.5, 2.0, 2.5, 3.0);
        try {
            return yArray.contains(Double.parseDouble(r));
        } catch (NumberFormatException e) {
            return false;
        }
    }

    private boolean rectangle(double x, double y, double r) {
        return x >= 0 && x <= r && y >= 0 && y <= r;
    }

    private boolean triangle(double x, double y, double r) {
        return x >= 0 && x <= r && y <= 0 && y >= x / 2 - r / 2;
    }

    private boolean circle(double x, double y, double r) {
        return x <= 0 && x >= -r && y >= 0 && y * y <= -x * x + r * r;
    }

    private boolean checkAll(String x, String y, String r) {
        return checkR(r) && checkY(y) && checkX(x);
    }
}