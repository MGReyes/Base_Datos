<?php
$link = mysql_connect("kali", "db2014_g05", "FFPR14");
mysql_select_db("db2014_g05", $link);
$sql = mysql_query("SELECT * FROM Cliente", $link);

$xml = new XMLWriter();

$xml->openURI("php://output");
$xml->startDocument();
$xml->setIndent(true);

$xml->startDTD('ClientesEmpresa');
$xml->startDTDElement('Cliente'); 
$xml->writeDTDElement("Cliente" , 'Razon_Social');
$xml->endDTDElement();
$xml->endDTD();
$xml->endDocument();
header('Content-type: text/xml');
$xml->flush();
?>
