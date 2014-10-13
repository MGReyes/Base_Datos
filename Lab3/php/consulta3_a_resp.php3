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
select Marca, Modelo, Cantidad_Clientes*100/Cantidad_Total as porcentaje
from (
    select Marca, Modelo, sum(Cantidad) as Cantidad_Total
    from ClienteMaquina
    group by Marca, Modelo)
    as maquinas
    natural join (
    select Marca, Modelo, sum(Cantidad) as Cantidad_Clientes
    from ClienteMaquina natural join
        (select Cuit
        from VendedorCliente
        where Cuil = $cuil) 
        as clientes_de_vendedor
    group by Marca, Modelo)
    as maquinas_de_clientes;
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
    echo "<p>Las maquinas que los clientes del vendedor no poseen, no son listadas</p>";
} else {
    echo utf8_decode("¡No se ha encontrado ningún registro!");
}
?>

</body>
</html>
