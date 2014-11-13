<html>
<body>

<?php
$link = mysql_connect("kali","db2014_g05","FFPR14");
mysql_select_db("db2014_g05", $link);
$result = mysql_query("
SELECT Cuit, Razon_Social, Cant_Comunicaciones_Realizadas, sum(Cantidad) as Cant_Maquinas
FROM Cliente natural join ClienteMaquina natural join (
    SELECT Cuit, count(*) as Cant_Comunicaciones_Realizadas
    FROM Comunicacion
    WHERE Estado = "."'realizada'"."
    GROUP BY Cuit) as cant_com_realizadas_por_cliente
GROUP BY Cuit
ORDER BY Cant_Comunicaciones_Realizadas desc;
", $link);
if ($row = mysql_fetch_array($result)) {
    echo "<table border = '1'> \n";
    //Mostramos los nombres de las tablas
    echo "<tr> \n";
    echo "<th>Cuit</th><th>Razon_Social</th><th>Cant_Comunicaciones_Realizadas</th><th>Cant_Maquinas</th>";
    echo "</tr> \n";
    do {
        echo "<tr> \n";
        echo "<td>".$row["Cuit"]."</td> \n";
        echo "<td>".$row["Razon_Social"]."</td> \n";
        echo "<td>".$row["Cant_Comunicaciones_Realizadas"]."</td> \n";
        echo "<td>".$row["Cant_Maquinas"]."</td> \n";
        echo "</tr> \n";
    } while ($row = mysql_fetch_array($result));
    echo "</table> \n";
} else {
    echo utf8_decode("¡No se ha encontrado ningún registro!");
}
?>

</body>
</html>
