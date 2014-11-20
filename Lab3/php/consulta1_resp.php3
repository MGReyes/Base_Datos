<html>
    <head>
        <title>Consulta 1 - Respuesta</title>
    </head>
    <body>
        <?php
            $cuil = $_POST['Cuil'];
            if (!isset($cuil)){
                  echo "Debe especificar un vendedor";
                  exit;
            }
            $link = mysql_connect("kali","db2014_g05","FFPR14");
            mysql_select_db("db2014_g05", $link);
            $result = mysql_query("
            SELECT Cuit, Razon_social, sum(cantidad) AS total_maquinas
            FROM Cliente NATURAL JOIN ClienteMaquina
            WHERE Cuil = $cuil
            GROUP BY Cuit
            ORDER BY total_maquinas asc
            ", $link);
            if ($row = mysql_fetch_array($result)) {
                echo "<table border = '1'> \n";
                    //Mostramos los nombres de las tablas
                    echo "<tr> \n";
                    echo "<th>Razon Social</th><th>Cuit</th><th>Total Maquinas</th>";
                    echo "</tr> \n";
                    do {
                        echo "<tr> \n";
                        echo "<td>".$row["Razon_social"]."</td> \n";
                        echo "<td>".$row["Cuit"]."</td> \n";
                        echo "<td>".$row["total_maquinas"]."</td> \n";
                        echo "</tr> \n";
                    } while ($row = mysql_fetch_array($result));
                echo "</table> \n";
            } else {
                echo utf8_decode("¡No se ha encontrado ningún registro!");
            }
        ?>
    </body>
</html>
