<html>
<body>
<xmp>
<?php

$xpath = $_POST['xpath'];

if (!isset($xpath)){
      echo "Debe especificar un xpath";
      echo "</html></body> \n";
      exit;
}

$link = mysql_connect("kali","db2014_g05","FFPR14");
mysql_select_db("db2014_g05", $link);

if (file_exists('clientes.xml')) {
    $xml = simplexml_load_file('clientes.xml');
} else {
    exit('Error abriendo archivo xml.');
}


$result = $xml->xpath($xpath);

while (list( , $nodo) = each($result)) {
    echo $nodo->asXML(),"\n";
}

?>
</xmp>
</body>
</html>
