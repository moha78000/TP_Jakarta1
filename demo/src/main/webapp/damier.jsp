<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.lang.Integer" %>
<!DOCTYPE html>
<html>
<head>
  <title>Damier</title>
  <style>
    table { border-collapse: collapse; border: solid black 1px; }
    td { width: 50px; height: 50px; }
    .black { background-color: black; }
    .white { background-color: white; }
  </style>
</head>
<body>
<h1>Le damier</h1>

<%
  int rows = (request.getAttribute("rows") != null) ? (Integer) request.getAttribute("rows") : 8;
  int cols = (request.getAttribute("cols") != null) ? (Integer) request.getAttribute("cols") : 8;
%>

<p>Le damier est composé de <%= rows %> lignes et <%= cols %> colonnes.</p>

<table>
  <%
    for (int i = 0; i < rows; i++) {
  %>
  <tr>
    <% for (int j = 0; j < cols; j++) { %>
    <td class="<%= (i + j) % 2 == 0 ? "black" : "white" %>" alt="<%= (i + j) % 2 == 0 ? "Case noire" : "Case blanche" %>"></td>
    <% } %>
  </tr>
  <% } %>
</table>

<br>
<a href="index.jsp">Retour</a>

</body>
</html>
