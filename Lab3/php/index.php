<html>
<body>

<?php
if(!$link = mysql_connect($server = "kali",
$username = "db2014_g05", $password = "FFPR14")){
    echo "error de servidor";
}
mysql_select_db("db2014_g05", $link);
$result = mysql_query("SELECT * FROM AreaCliente", $link);
if ($row = mysql_fetch_row($result)){
    echo "<table border = '1'> \n";
    echo "<tr><td>Area</td><td>Cliente</td></tr> \n";

    do {
        echo "<tr><td>".$row["Nombre_Area"]."</td><td>".$row["Cuit"]."</td></tr> \n";
    } while ($row = mysql_fetch_array($result));
    echo "</table> \n";
} else {
echo utf8_decode("¡No se ha encontrado ningún registro!");
}
echo "</table> \n";
?>

</body>
</html>
