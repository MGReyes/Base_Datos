<html>
<body>

<?php
$link = mysql_connect("kali", "db2014_g05", "FFPR14");
mysql_select_db("db2014_g05", $link);
echo "<p>Cantidad de cada maquina por ciudad ordenado por ciudades (alfabetico) y maquina de mayor cantidad a menor</p>\n";
echo "<form method="."'POST'"."action="."'consulta8_resp.php3'"."> \n";
echo "<input type="."'submit'". "value="."'Consultar'". "name="."'consulta'"."> \n";
echo "</form> \n";
?>

</body>
</html>
