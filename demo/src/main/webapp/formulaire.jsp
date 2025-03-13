<%--
  Created by IntelliJ IDEA.
  User: 22201645
  Date: 13/03/2025
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Damier - Saisie</title>
    <script>
        function validateForm() {
            let rows = document.getElementById("rows").value;
            let cols = document.getElementById("cols").value;

            if (rows < 1 || rows > 10 || cols < 1 || cols > 10) {
                alert("Veuillez entrer des valeurs entre 1 et 10.");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<h1>Générer un Damier</h1>
<form action="damier-servlet" method="get" onsubmit="return validateForm()">
    <label for="rows">Nombre de lignes :</label>
    <input type="number" id="rows" name="rows"  placeholder="lignes"   min="1" max="10" required>
    <br>
    <label for="cols">Nombre de colonnes :</label>
    <input type="number" id="cols" name="cols" placeholder="colonnes" min="1" max="10" required>
    <br>
    <input type="submit" value="Afficher le damier">
</form>
</body>
</html>
