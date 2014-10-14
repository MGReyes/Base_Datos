<html>
<body>

<?php
$link = mysql_connect("kali", "db2014_g05", "FFPR14");
mysql_select_db("db2014_g05", $link);
$result = mysql_query("SELECT * FROM Maquina", $link);
echo "<p>Clientes que no poseen determinada maquina y se dedican a la agricultura.</p>\n";
echo "<form method="."'POST'"."action="."'consulta10_resp.php3'"."> \n";
echo "Elija la maquina<br>";
echo "<select name="."'Maquina'"."> \n";
while ($row = mysql_fetch_array($result)) {
       echo "<option value= ".$row["ID_Maquina"]."> ".$row["Marca"]." ".$row["Modelo"]." </option>\n";
}
echo "</select> \n";
echo "<input type="."'submit'". "value="."'Consultar'". "name="."'consulta'"."> \n";
echo "</form> \n";
?>

</body>
</html>
