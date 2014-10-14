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
$result = mysql_query("
SELECT Cuil, Nombre, Apellido, sum(Realizadas)-sum(Pendientes) as Indice_Cumplimiento
FROM Vendedor natural join (
        SELECT Numero, Cuil, Cuit, Medio, Observacion, Fecha,
       (case Estado when "."'"."pendiente"."'"." then 1 else 0 end) as Pendientes,
       (case Estado when "."'"."realizada"."'"." then 1 else 0 end) as Realizadas
    FROM Comunicacion
    WHERE Fecha BETWEEN "."'".$F1." 00:00:00"."'"." AND "."'".$F2." 00:00:00"."'".") as com_pend_real
GROUP BY Cuil
ORDER BY Indice_Cumplimiento desc;
", $link);
if ($row = mysql_fetch_array($result)) {
    echo "<table border = '1'> \n";
    //Mostramos los nombres de las tablas
    echo "<tr> \n";
    echo "<th>Cuil</th><th>Nombre</th><th>Apellido</th><th>Indice_Cumplmiento</th>";
    echo "</tr> \n";
    do {
        echo "<tr> \n";
        echo "<td>".$row["Cuil"]."</td> \n";
        echo "<td>".$row["Nombre"]."</td> \n";
        echo "<td>".$row["Apellido"]."</td> \n";
        echo "<td>".$row["Indice_Cumplimiento"]."</td> \n";
        echo "</tr> \n";
    } while ($row = mysql_fetch_array($result));
    echo "</table> \n";
    echo "<p><strong>Indice_Cumplimiento</strong> = Comunicaciones Realizadas - Comunicaciones Pendientes</p>";
} else {
    echo utf8_decode("¡No se ha encontrado ningún registro!");
}
?>

</body>
</html>
