<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Connexion</title>
    <style>
        body {
            background-color: #f4f7f6;
            font-family: 'Arial', sans-serif;
            padding: 50px;
            text-align: center;
        }

        .container {
            max-width: 400px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin: auto;
        }

        h2 {
            color: #333;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .btn {
            width: 100%;
            background-color: #007bff;
            color: white;
            font-weight: bold;
            padding: 10px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .error {
            color: red;
            font-weight: bold;
        }

        .success {
            color: green;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Connexion</h2>

    <%
        String message = "";
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            // Récupération des données du formulaire
            String login = request.getParameter("login");
            String mdp = request.getParameter("mdp");

            // Connexion à la base de données
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "");

                // Vérifier si le login et le mot de passe existent
                String sql = "SELECT * FROM user WHERE login = ? AND mdp = ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, login);
                ps.setString(2, mdp);
                rs = ps.executeQuery();

                if (rs.next()) {
                    // Succès : Redirection vers dashboard.jsp
                    session.setAttribute("user", login);
                    response.sendRedirect("dashboard.jsp");
                } else {
                    // Échec : Afficher un message d'erreur
                    message = "<p class='error'>Login ou mot de passe incorrect</p>";
                }
            } catch (Exception e) {
                message = "<p class='error'>Erreur : " + e.getMessage() + "</p>";
                e.printStackTrace();
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>

    <%= message %>

    <form method="post">
        <input type="text" name="login" class="form-control" placeholder="Login" required>
        <input type="password" name="mdp" class="form-control" placeholder="Mot de passe" required>
        <button type="submit" class="btn">Se connecter</button>
    </form>
</div>

</body>
</html>
