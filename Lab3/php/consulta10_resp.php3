<html>
    <head>
        <title>Consulta 10 - Respuesta</title>
    </head>
    <body>
        <?php
            $Maquina = $_POST['Maquina'];
            if (!isset($Maquina)){
                  echo "Debe especificar una maquina";
                  exit;
            }

            $link = mysql_connect("kali","db2014_g05","FFPR14");
            mysql_select_db("db2014_g05", $link);
            $result = mysql_query("
            SELECT *
            FROM Cliente
            WHERE
                Cuit not in
                (SELECT Cuit
                FROM ClienteMaquina
                WHERE ID_Maquina = $Maquina)
                AND
                Cuit in
                (SELECT Cuit
                FROM AreaCliente
                WHERE Nombre_Area = "."'Agricultura'".");
            ", $link);
            
            if ($row = mysql_fetch_array($result)) {
                echo "<table border = '1'> \n";
                    //Mostramos los nombres de las tablas
                    echo "<tr> \n";
                    echo "<th>Razon Social</th><th>Cuit</th><th>CP_Ciudad</th><th>NombreCiudad</th>";
                    echo "</tr> \n";
                    do {
                        echo "<tr> \n";
                        echo "<td>".$row["Razon_Social"]."</td> \n";
                        echo "<td>".$row["Cuit"]."</td> \n";
                        echo "<td>".$row["CP_Ciudad"]."</td> \n";
                        echo "<td>".$row["NombreCiudad"]."</td> \n";
                        echo "</tr> \n";
                    } while ($row = mysql_fetch_array($result));
                echo "</table> \n";
            } else {
                echo utf8_decode("¡No se ha encontrado ningún registro!");
            }
        ?>
    </body>
</html>
