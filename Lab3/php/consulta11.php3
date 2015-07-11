<html>
    <head>
        <title>Consulta 11</title>
    </head>
    <body>
        <?php
            $link = mysql_connect("kali", "db2014_g05", "FFPR14");
            mysql_select_db("db2014_g05", $link);
            
            echo "<p>Ranking de clientes de mayor numero de comunicaciones realizadas al menor incluyendo informacion de cantidad de maquinas de cada uno.</p>\n";
            echo "<form method='POST' action='consulta11_resp.php3'> \n";
                echo "<input type='submit' value='Consultar' name='consulta'> \n";
            echo "</form> \n";
        ?>
    </body>
</html>
