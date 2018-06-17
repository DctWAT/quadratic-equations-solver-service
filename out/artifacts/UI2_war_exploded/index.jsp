<%@ page import="com.netcracker.Helper" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: korya
  Date: 29.11.2017
  Time: 4:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=cp1251" %>
<%@ page pageEncoding="cp1251" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Решение квадратного уравнения</title>
    <link rel="stylesheet" type="text/css" href="css/table">
    <link rel="stylesheet" type="text/css" href="css/InputOutput.css">
    <link rel="stylesheet" type="text/css" href="css/buttons">
</head>
<body>

<div>
    <form autocomplete="on" class="input" method="post" action="/home">
        <p>
            <legend>Заполните форму:</legend>
        </p>
        <p>
            <input type="number" id="A" name="A" placeholder="A" maxlength="10" required size="5">
            <label>X <sup>
                <small>2</small>
            </sup> + </label>
            <input type="number" id="B" name="B" placeholder="B" maxlength="10" required size="5">
            <label>X + </label>
            <input type="number" id="C" name="C" placeholder="C" maxlength="10" required size="5">
            <label>= 0</label>
        </p>
        <input type="submit" class="buttons" id="add" value="Решить">
    </form>
</div>

<div>
    <form autocomplete="on" class="output">
        <p>
            <legend>Результаты вычислений:</legend>
        </p>
        <%--<p>--%>
        <%--<label>Дискриминант уравнения:</label>--%>
        <%--<input type="number" id="d" placeholder="D" value=${d}>--%>
        <%--</p>--%>
        <%--<p>--%>
        <%--<label>X1 = </label>--%>
        <%--<input type="number" id="x1" placeholder="X1" value=${x1}>--%>
        <%--</p>--%>
        <%--<p>--%>
        <%--<label>X2 = </label>--%>
        <%--<input type="number" id="x2" placeholder="X2" value=${x2}>--%>
        <%--</p>--%>
    </form>
</div>

<table id="myTab">
    <caption>Результаты:</caption>
    <tr class="title">
        <th>A</th>
        <th>B</th>
        <th>C</th>
        <th>X1</th>
        <th>X2</th>
        <th></th>
    </tr>
    <%
        List<Helper> data = (List<Helper>) request.getSession().getAttribute("numList");
        if (data != null) {
            int i = 0;
            for (Helper helper : data) {
                out.println("<tr>");

                out.println("<td>" + helper.getA() + "</td>");
                out.println("<td>" + helper.getB() + "</td>");
                out.println("<td>" + helper.getC() + "</td>");
                out.println("<td>" + helper.getX1() + "</td>");
                out.println("<td>" + helper.getX2() + "</td>");
                out.println("<td> <a href = \"/remove?index=" + i + "\" style=\"text-decoration: none; color: #656665;\">Удалить </a></td>");

                out.println("</tr>");
                i++;
            }
        }
    %>
    <%--<a href="/remove?index=${i}" style="color: #9f170a;">Delete</a>--%>
</table>
</body>
</html>