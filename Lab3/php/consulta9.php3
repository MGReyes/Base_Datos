<html>
<body>

<?php
$link = mysql_connect("kali", "db2014_g05", "FFPR14");
mysql_select_db("db2014_g05", $link);
echo "<p>Listado de Vendedores segun indice de cumplimiento de comunicaciones (pendientes/realizadas) en un periodo dado.</p>\n";
echo "<form method="."'POST'"."action="."'consulta9_resp.php3'"."> \n";
echo "<strong>Fecha de inicio</strong><br>";
echo "<input type= "."'text'"." name= "."'F1'"." size="."'20'"."<br><br>";
echo "<strong>Fecha de fin</strong><br>";
echo "<input type= "."'text'"." name= "."'F2'"." size="."'20'"."<br><br>";
echo "<p>Formato de fecha de inicio/fin: YYYY-MM-DD</p>"; 
echo "<input type="."'submit'". "value="."'Consultar'". "name="."'consulta'"."> \n";
echo "</form> \n";
?>

</body>
</html>
