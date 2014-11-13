<html>
<body>

<?php
$link = mysql_connect("kali", "db2014_g05", "FFPR14");
mysql_select_db("db2014_g05", $link);
$result = mysql_query("SELECT * FROM Zona", $link);
echo "<p>Listado de Maquinas que pertenecen a una zona y no a otra/otras</p>\n";
echo "<form method="."'POST'"."action="."'consulta5_resp.php3'"."> \n";
echo "Elija la zona<br>";
echo "<select name="."'NombreZona'"."> \n";
while ($row = mysql_fetch_array($result)) {
       echo "<option value= ".$row["NombreZona"]."> ".$row["NombreZona"]." </option>\n";
}
echo "</select> \n";
echo "<input type="."'submit'". "value="."'Consultar'". "name="."'consulta'"."> \n";
echo "</form> \n";
?>

</body>
</html>
