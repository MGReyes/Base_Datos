<html>
    <head>
        <title>Consulta 4</title>
    </head>
    <body>
        <?php
            $link = mysql_connect("kali", "db2014_g05", "FFPR14");
            mysql_select_db("db2014_g05", $link);
            $result = mysql_query("SELECT * FROM Vendedor", $link);

            echo "<p>Listar para un vendedor la cantidad de comunicaciones pendientes y la cantidad realizada mes a mes</p>\n";
            echo "<form method="."'POST'"."action="."'consulta4_resp.php3'"."> \n";
                echo "Elija el vendedor<br>";
                echo "<select name="."'Cuil'"."> \n";
                    while ($row = mysql_fetch_array($result)) {
                           echo "<option value=".$row["Cuil"]."> ".$row["Nombre"]." ".$row["Apellido"]." </option>\n";
                    }
                echo "</select> \n";
                echo "<input type='submit' value='Consultar' name='consulta'> \n";
            echo "</form> \n";
        ?>
    </body>
</html>
