<html>
<body>

<?php
$link = mysql_connect("kali","db2014_g05","FFPR14");
mysql_select_db("db2014_g05", $link);
$result = mysql_query("
select NombreZona, sum(cantidad) as Cantidad
from CiudadZona natural join (
    select NombreCiudad, CP_Ciudad, count(*) as cantidad
    from Cliente
    group by NombreCiudad, CP_Ciudad)
    as cant_clientes_por_ciudad
group by NombreZona;
", $link);
if ($row = mysql_fetch_array($result)) {
    echo "<table border = '1'> \n";
    //Mostramos los nombres de las tablas
    echo "<tr> \n";
    echo "<th>NombreZona</th><th>Cantidad</th>";
    echo "</tr> \n";
    do {
        echo "<tr> \n";
        echo "<td>".$row["NombreZona"]."</td> \n";
        echo "<td>".$row["Cantidad"]."</td> \n";
        echo "</tr> \n";
    } while ($row = mysql_fetch_array($result));
    echo "</table> \n";
} else {
    echo utf8_decode("¡No se ha encontrado ningún registro!");
}
?>
