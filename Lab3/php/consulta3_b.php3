<html>
    <head>
        <title>Consulta 3 B</title>
    </head>
    <body>
        <?php
            $link = mysql_connect("kali", "db2014_g05", "FFPR14");
            mysql_select_db("db2014_g05", $link);
            $result = mysql_query("SELECT * FROM Zona", $link);

            echo "<p>Listar cual es la distribucion en % de cada maquina por zona. (Ej si hay 100 en total de la maquina1 y los clientes de una zona tienen 8 en total esa zona tiene el 8% de la maquina1)</p>\n";
            echo "<form method='POST' action='consulta3_b_resp.php3'> \n";
                echo "Elija la zona<br>";
                echo "<select name='NombreZona'> \n";
                    while ($row = mysql_fetch_array($result)) {
                           echo "<option value=".$row["NombreZona"].">".$row["NombreZona"]."</option>\n";
                    }
                echo "</select> \n";
                echo "<input type='submit' value='Consultar' name='consulta'> \n";
            echo "</form>"
        ?>
    </body>
</html>
