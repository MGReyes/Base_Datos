<html>
    <head>
        <title>Consulta 6 - Respuesta</title>
    </head>
    <body>
        <?php
            $link = mysql_connect("kali","db2014_g05","FFPR14");
            mysql_select_db("db2014_g05", $link);
            $result = mysql_query("
            SELECT Marca, Modelo
            FROM (
               SELECT Marca, Modelo, NombreZona
               FROM Maquina natural join ClienteMaquina natural join Cliente natural join CiudadZona) as p
            GROUP BY Marca, Modelo
            HAVING COUNT(*) = (
               SELECT COUNT(*)
               FROM Zona);
            ", $link);
            
            if ($row = mysql_fetch_array($result)) {
                echo "<table border = '1'> \n";
                    //Mostramos los nombres de las tablas
                    echo "<tr> \n";
                    echo "<th>Marca</th><th>Modelo</th>";
                    echo "</tr> \n";
                    do {
                        echo "<tr> \n";
                        echo "<td>".$row["Marca"]."</td> \n";
                        echo "<td>".$row["Modelo"]."</td> \n";
                        echo "</tr> \n";
                    } while ($row = mysql_fetch_array($result));
                echo "</table> \n";
            } else {
                echo utf8_decode("¡No se ha encontrado ningún registro!");
            }
        ?>
    </body>
</html>