package com.netcracker;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class EquationServlet extends HttpServlet {

    private static List<Helper> numList = new ArrayList<>();

    public static void remove(int index, HttpServletRequest request, HttpServletResponse response) {
        numList.remove(index);
        request.getSession().setAttribute("numList", numList);
        try {
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        double a = Double.parseDouble(req.getParameter("A"));
        double b = Double.parseDouble(req.getParameter("B"));
        double c = Double.parseDouble(req.getParameter("C"));

        double d = b * b - 4 * a * c;

        String x1 = null, x2 = null;

        if (d > 0) {
            x1 = String.valueOf(b * (-1) - Math.sqrt(d) / (2 * a));
            x2 = String.valueOf(b * (-1) + Math.sqrt(d) / (2 * a));
        } else if (d == 0) {
            x1 = String.valueOf(b * (-1) / (2 * a));
            x2 = "-";
        } else {
            x1 = "-";
            x2 = "-";
        }
        numList.add(new Helper().setA(a).setB(b).setC(c).setX1(String.valueOf(x1)).setX2(String.valueOf(x2)));

        req.getSession().setAttribute("numList", numList);
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

}
