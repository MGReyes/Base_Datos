<html>
    <head>
        <title>Consulta 2</title>
    </head>
    <body>
        <?php
            $link = mysql_connect("kali", "db2014_g05", "FFPR14");
            mysql_select_db("db2014_g05", $link);
            $result = mysql_query("SELECT * FROM Maquina", $link);

            echo utf8_decode("<p>Implementar un triggers que al agendar una campaña publicitaria para determinada fecha y determinado número de maquinas les agende a todos los clientes que tengan alguna de esas maquinas una comunicación pendiente.</p>\n");

            echo "<form method='POST' action='consulta2_resp.php3'> \n";
                echo "<strong>Fecha de inicio</strong><br>";
                echo "<input type='text' name='F1' size='20'><br><br>";
                echo "<strong>Fecha de fin</strong><br>";
                echo "<input type='text' name='F2' size='20'><br>";
                echo "Formato de fecha de inicio/fin: YYYY-MM-DD HH:MM:SS<br><br>";
                echo utf8_decode("<strong>Elija las maquinas para la campaña:</strong><br>");
                    while ($row = mysql_fetch_array($result)) {
                        echo "<input type='checkbox' name='Maquina[]' value=".$row["ID_Maquina"].">".$row["Marca"]." ".$row["Modelo"]."<br>";
                    }
                    echo "<input type='submit' value='Enviar' name='enviar'> \n";
            echo "</form>";
        ?>
    </body>
</html>
