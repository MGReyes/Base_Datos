<html>
<body>

<?php
$cuil = $_POST['Cuil'];
if (!isset($cuil)){
      echo "Debe especificar un vendedor";
      echo "</html></body> \n";
      exit;
}
$link = mysql_connect("kali","db2014_g05","FFPR14");
mysql_select_db("db2014_g05", $link);
$result = mysql_query("
select YEAR(Fecha) as Año, MONTH(Fecha) as Mes, sum(Pendientes) as Pendientes, sum(Realizadas) as Realizadas
from (select Fecha, Cuil,
          (case Estado when ". "'pendiente'"." then 1 else 0 end) as Pendientes,
          (case Estado when ". "'realizada'"." then 1 else 0 end) as Realizadas
     from Comunicacion
     where Cuil = $cuil)
     as p_r
group by YEAR(Fecha), MONTH(Fecha);
", $link);
if ($row = mysql_fetch_array($result)) {
    echo "<table border = '1'> \n";
    //Mostramos los nombres de las tablas
    echo "<tr> \n";
    echo utf8_decode("<th>Año</th><th>Mes</th><th>Pendientes</th><th>Realizadas</th>");
    echo "</tr> \n";
    do {
        echo "<tr> \n";
        echo "<td>".$row["Año"]."</td> \n";
        echo "<td>".$row["Mes"]."</td> \n";
        echo "<td>".$row["Pendientes"]."</td> \n";
        echo "<td>".$row["Realizadas"]."</td> \n";
        echo "</tr> \n";
    } while ($row = mysql_fetch_array($result));
    echo "</table> \n";
    echo "<p>En los meses no listados no se encuentran comunicacion pendientes ni realizadas </p>";
} else {
    echo utf8_decode("¡No se ha encontrado ningún registro!");
}
?>

</body>
</html>
