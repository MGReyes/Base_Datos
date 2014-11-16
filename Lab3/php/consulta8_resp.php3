<html>
<body>

<?php
$link = mysql_connect("kali","db2014_g05","FFPR14");
mysql_select_db("db2014_g05", $link);
$result = mysql_query("
SELECT NombreCiudad, CP_Ciudad, Marca, Modelo, sum(Cantidad) as Cantidad
FROM Cliente NATURAL JOIN ClienteMaquina NATURAL JOIN Maquina
GROUP BY NombreCiudad, CP_Ciudad, Marca, Modelo
ORDER BY NombreCiudad, sum(Cantidad) desc;
", $link);
if ($row = mysql_fetch_array($result)) {
    echo "<table border = '1'> \n";
    //Mostramos los nombres de las tablas
    echo "<tr> \n";
    echo "<th>NombreCiudad</th><th>CP_Ciudad</th><th>Marca</th><th>Modelo</th><th>Cantidad</th>";
    echo "</tr> \n";
    do {
        echo "<tr> \n";
        echo "<td>".$row["NombreCiudad"]."</td> \n";
        echo "<td>".$row["CP_Ciudad"]."</td> \n";
        echo "<td>".$row["Marca"]."</td> \n";
        echo "<td>".$row["Modelo"]."</td> \n";
        echo "<td>".$row["Cantidad"]."</td> \n";
        echo "</tr> \n";
    } while ($row = mysql_fetch_array($result));
    echo "</table> \n";
} else {
    echo utf8_decode("¡No se ha encontrado ningún registro!");
}
?>
