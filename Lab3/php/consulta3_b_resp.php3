<html>
<body>

<?php
$NombreZona = $_POST['NombreZona'];
if (!isset($NombreZona)){
      echo "Debe especificar una zona";
      echo "</html></body> \n";
      exit;
}
$link = mysql_connect("kali","db2014_g05","FFPR14");
mysql_select_db("db2014_g05", $link);
$result = mysql_query("
select Marca, Modelo, Cantidad_Zona*100/Cantidad_Total as porcentaje
from (
    select Marca, Modelo, sum(Cantidad) as Cantidad_Total
    from ClienteMaquina
    group by Marca, Modelo)
    as maquinas
    natural join (
    select Marca, Modelo, sum(Cantidad) as Cantidad_Zona
    from Cliente natural join ClienteMaquina natural join CiudadZona
    where NombreZona ="."'". $NombreZona."'"."
    group by Marca, Modelo)
    as maquinas_de_zona;
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
} else {
    echo utf8_decode("¡No se ha encontrado ningún registro!");
}
?>

</body>
</html>
