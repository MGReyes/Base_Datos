<html>
    <body>
        <?php
            $F1 = $_POST['F1'];
            if (!isset($F1)){
                  echo "Debe especificar fecha de inicio";
                  echo "</html></body> \n";
                  exit;
            }
            $F2 = $_POST['F2'];
            if (!isset($F2)){
                  echo "Debe especificar fecha de fin";
                  echo "</html></body> \n";
                  exit;
            }

            $link = mysql_connect("kali","db2014_g05","FFPR14");
            mysql_select_db("db2014_g05", $link);

            $result1 = mysql_query("
            INSERT INTO Campaña(Fecha_Inicio, Fecha_Fin)
            VALUES ('$F1', '$F2');
            ", $link);

            if(isset($_POST['enviar'])) {
                if(!empty($_POST['Maquina'])) {
                    foreach($_POST['Maquina'] as $machine) {
                        $result2 = mysql_query("
                        INSERT INTO CampañaMaquina(Numero, ID_Maquina)
                        VALUES ((SELECT max(Numero)
                                 FROM Campaña
                                 WHERE Fecha_Inicio = '".$F1."' AND Fecha_Fin= '".$F2."'), ".$machine.");
                        ", $link);
                    }
                } else {
                    echo "Debe especificar una maquina";
                    echo "</html></body> \n";
                    exit;
                }
            }

            $result3 = mysql_query("
            SELECT *
            FROM Comunicacion;
            ", $link);
            if ($row = mysql_fetch_array($result3)) {
                echo "<table border = '1'> \n";
                //Mostramos los nombres de las tablas
                echo "<tr> \n";
                echo "<th>Cuil</th><th>Cuit</th><th>Medio</th><th>Observacion</th><th>Estado</th><th>Fecha</th>";
                echo "</tr> \n";
                do {
                    echo "<tr> \n";
                    echo "<td>".$row["Cuil"]."</td> \n";
                    echo "<td>".$row["Cuit"]."</td> \n";
                    echo "<td>".$row["Medio"]."</td> \n";
                    echo utf8_decode("<td>".$row["Observacion"]."</td> \n");
                    echo "<td>".$row["Estado"]."</td> \n";
                    echo "<td>".$row["Fecha"]."</td> \n";
                    echo "</tr> \n";
                } while ($row = mysql_fetch_array($result3));
                echo "</table> \n";
            } else {
                echo utf8_decode("¡No se ha encontrado ningún registro!");
            }
        ?>
    </body>
</html>
