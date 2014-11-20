<html>
    <head>
        <title>Consulta 3 B - Respuesta</title>
    </head>
    <body>
        <?php
            $NombreZona = $_POST['NombreZona'];
            if (!isset($NombreZona)){
                  echo "Debe especificar una zona";
                  exit;
            }
            $link = mysql_connect("kali","db2014_g05","FFPR14");
            mysql_select_db("db2014_g05", $link);
            $result = mysql_query("
            SELECT Marca, Modelo, Cantidad_Zona*100/Cantidad_Total AS porcentaje
            FROM Maquina NATURAL JOIN (
                SELECT ID_Maquina, sum(Cantidad) AS Cantidad_Total
                FROM ClienteMaquina
                GROUP BY ID_Maquina)
                AS maquinas
                NATURAL JOIN (
                SELECT ID_Maquina, sum(Cantidad) AS Cantidad_Zona
                FROM Cliente NATURAL JOIN ClienteMaquina NATURAL JOIN CiudadZona
                WHERE NombreZona ='".$NombreZona."'
                GROUP BY ID_Maquina)
                AS maquinas_de_zona;
            ", $link);
            
            if ($row = mysql_fetch_array($result)) {
                echo "<table border = '1'> \n";
                    //Mostramos los nombres de las tablas
                    echo "<tr> \n";
                    echo "<th>Marca</th><th>Modelo</th><th>Porcentaje</th>";
                    echo "</tr> \n";
                    do {
                        echo "<tr> \n";
                        echo "<td>".$row["Marca"]."</td> \n";
                        echo "<td>".$row["Modelo"]."</td> \n";
                        echo "<td>".$row["porcentaje"]."</td> \n";
                        echo "</tr> \n";
                    } while ($row = mysql_fetch_array($result));
                echo "</table> \n";
                echo "<p>Las maquinas que los clientes de la zona no poseen, no son listadas</p>";
            } else {
                echo utf8_decode("¡No se ha encontrado ningún registro!");
            }
        ?>
    </body>
</html>