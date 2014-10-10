<html>
<body>

<?php
$buscar = $_POST['T1'];
if (!isset($buscar)){
      echo "Debe especificar una cadena a bucar";
      echo "</html></body> \n";
      exit;
}
$link = mysql_connect($server = "kali",$username= "db2014_g05", $password = "FFPR14");
mysql_select_db("db2014_g05", $link);
$total_maq = mysql_query("
/*Consulta*/
select sum(Cantidad) as cantidad
                from ClienteMaquina
                where Marca = 'Consequat Corporatio'
                and Modelo = 'ZT202a'
", $link);
$result = mysql_query("
select Cuil, sum(porcentaje) as porcentaje
from VendedorCliente natural join (
    select Cuit, (Cantidad*100/$total_maq) as porcentaje
    from ClienteMaquina
    where Marca = 'Consequat Corporatio' and Modelo = 'ZT202a')
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
            echo "<td>".$row["cantidad"]."</td> \n";
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
