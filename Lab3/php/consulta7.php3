<html>
    <head>
        <title>Consulta 7</title>
    </head>
    <body>
        <?php
            $link = mysql_connect("kali", "db2014_g05", "FFPR14");
            mysql_select_db("db2014_g05", $link);

            echo "<p>Cantidad de clientes por zona</p>\n";
            echo "<form method='POST' action='consulta7_resp.php3'> \n";
                echo "<input type='submit' value='Consultar' name='consulta'> \n";
            echo "</form> \n";
        ?>
    </body>
</html>
