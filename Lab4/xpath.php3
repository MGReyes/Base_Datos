<html>
<body>

<?php
$link = mysql_connect("kali", "db2014_g05", "FFPR14");
mysql_select_db("db2014_g05", $link);

$sql1 = mysql_query("select Cuit, Razon_Social, NombreZona, Cuil, Nombre, Apellido
                     from Cliente natural join CiudadZona natural join Vendedor;", $link);

$xml = new XMLWriter();

$xml->openURI("clientes.xml");
$xml->startDocument("1.0", "UTF-8", "no");
$xml->setIndent(true);

$xml->startDTD("ClientesEmpresa", "SYSTEM", "ClientesEmpresa.dtd");
$xml->endDTD();


$xml->startElement("ClientesEmpresa");

while ($row = mysql_fetch_assoc($sql1)) {
    $xml->startElement("Cliente");
    $xml->writeAttribute("Cuit", $row['Cuit']);
    $xml->writeElement("Razon_Social", $row['Razon_Social']);
    $xml->writeElement("Zona", $row['NombreZona']);
    $xml->startElement("Vendedor");
    $xml->writeAttribute("Cuil", $row['Cuil']);
    $xml->writeElement("Nombre", $row['Nombre']);
    $xml->writeElement("Apellido", $row['Apellido']);
    $xml->endElement();
    $sql2 = mysql_query("select * 
                         from ClienteMaquina natural join Maquina
                         where Cuit = ".$row['Cuit'].";",$link);
    while ($rowM = mysql_fetch_assoc($sql2)) {
        $xml->startElement("Maquina");
        $xml->writeAttribute("ID_Maquina", $rowM['ID_Maquina']);
        $xml->writeElement("Marca", $rowM['Marca']);
        $xml->writeElement("Modelo", $rowM['Modelo']);
        $xml->endElement();
    }
    $sql3 = mysql_query("select Cuit, Numero
                         from Cliente natural join Contacto natural join NumeroTelefonoContacto
                         where Cuit = ".$row['Cuit'].";",$link);
    while ($rowT = mysql_fetch_assoc($sql3)) {
        $xml->writeElement("Telefono", $rowT['Numero']);
    }
    $xml->endElement();
}
$xml->endElement();
$xml->endDocument();

echo "<form method="."'POST'"."action="."'xpath_resp.php3'".">";
echo "<b>Ingrese la consulta con formato xpath:</b><br>";
echo "<input type='text' name='xpath' size='60'><br><br>";
echo "<i>Solo consultas sobre Clientes con sus respectivas maquinas, vendedores y zonas</i><br>";
echo "<i>Ejemplo1: /ClientesEmpresa/Cliente[count(Maquina) >= 2]</i><br>";
echo "<i>Ejemplo2: /ClientesEmpresa/Cliente[Zona = "."'Interior'"."]/Telefono</i><br>";
echo "<i>Ejemplo3: /ClientesEmpresa/Cliente[Vendedor/Nombre = "."'Aurora'"." and Vendedor/Apellido = ". "'Dalton'"." and Zona = "."'Interior'"."]</i><br><br>";
echo "<input type="."'submit'". "value="."'Consultar'". "name="."'consulta'".">";

?>

</html>
</body>

