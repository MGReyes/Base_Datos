<html>
<body>

<?php
$marca = $_POST['marca'];
$modelo = $_POST['modelo'];
$marca = "Consequat Corporatio";
$modelo = "ZT202a";
if (!isset($marca)){
      echo "La marca es requerida";
      echo "</html></body> \n";
      exit;
}
if (!isset($modelo)){
      echo "El modelo es requerido";
      echo "</html></body> \n";
      exit;
}
$link = mysql_connect($server = "kali",$username= "db2014_g05", $password = "FFPR14");
mysql_select_db("db2014_g05", $link);

$result = mysql_query("
select Cuil, sum(porcentaje) as porcentaje
from VendedorCliente natural join (
    select Cuit, (Cantidad*100/(
        select sum(Cantidad) as cantidad
        from ClienteMaquina
        where Marca = $marca
        and Modelo = $modelo))
        as porcentaje
    from ClienteMaquina
    where Marca = $marca and Modelo = $modelo)
    as clientes_con_porcentajes
group by Cuil
", $link);
if ($row = mysql_fetch_array($result)){
      echo "<table border = '1'> \n";
//Mostramos los nombres de las tablas
echo "<tr> \n";
while ($field = mysql_fetch_field($result)){
            echo "<td>$field->name</td> \n";
}
      echo "</tr> \n";
do {
            echo "<tr> \n";
            echo "<td>".$row["Cuil"]."</td> \n";
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
