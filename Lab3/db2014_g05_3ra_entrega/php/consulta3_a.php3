<html>
<body>

<?php
$link = mysql_connect("kali", "db2014_g05", "FFPR14");
mysql_select_db("db2014_g05", $link);
$result = mysql_query("SELECT * FROM Vendedor", $link);
echo "<p>Listar cual es la distribucion en % de cada maquina por vendedor. (Ej si hay 100 en  total de la maquina1 y los clientes de un vendedor tienen 8 en total ese vendedor tiene el 8% de la maquina1)</p>\n";
echo "<form method="."'POST'"."action="."'consulta3_a_resp.php3'"."> \n";
echo "Elija el vendedor<br>";
echo "<select name="."'Cuil'"."> \n";
while ($row = mysql_fetch_array($result)) {
       echo "<option value=".$row["Cuil"]."> ".$row["Nombre"]." ".$row["Apellido"]." </option>\n";
}
echo "</select> \n";
echo "<input type="."'submit'". "value="."'Consultar'". "name="."'consulta'"."> \n";
echo "</form> \n";
?>

</body>
</html>
