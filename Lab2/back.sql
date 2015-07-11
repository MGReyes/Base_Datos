--
-- MySQL 5.5.38
-- Sat, 20 Sep 2014 03:35:46 +0000
--

CREATE DATABASE `db2014_g05` DEFAULT CHARSET utf8;

USE `db2014_g05`;

CREATE TABLE `AreaCliente` (
   `Nombre_Area` varchar(20) not null,
   `Cuit` decimal(11,0) not null default '0',
   PRIMARY KEY (`Nombre_Area`,`Cuit`),
   KEY `Cuit` (`Cuit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `AreaCliente` (`Nombre_Area`, `Cuit`) VALUES 
('Agricultura', '20733797847'),
('Ganaderia', '20964881694'),
('Apicultura', '21857959152'),
('Ganaderia', '24575097766'),
('Ganaderia', '25224345014'),
('Agricultura', '37395045887'),
('Agricultura', '37634697973'),
('Apicultura', '37842910105'),
('Agricultura', '38421805343'),
('Agricultura', '38817149425'),
('Apicultura', '40054868870'),
('Forrajeria', '41168483062'),
('Ganaderia', '42381513522'),
('Ganaderia', '44492424700'),
('Apicultura', '45206904390'),
('Agricultura', '46430152934'),
('Forrajeria', '46690258622'),
('Apicultura', '47157018047'),
('Ganaderia', '48194781422'),
('Ganaderia', '48978380447');

CREATE TABLE `Campaña` (
   `Numero` int(10) unsigned not null,
   `Fecha_Inicio` datetime,
   `Fecha_Fin` datetime,
   PRIMARY KEY (`Numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `Campaña` (`Numero`, `Fecha_Inicio`, `Fecha_Fin`) VALUES 
('1', '2014-11-01 00:00:00', '2015-02-01 00:00:00'),
('2', '2014-10-01 06:06:06', '2014-12-01 06:06:06'),
('3', '2014-04-10 00:00:00', '2014-05-10 00:00:00'),
('4', '2014-05-10 00:00:00', '2014-05-17 00:00:00'),
('5', '2014-09-04 00:00:00', '2014-09-11 00:00:00');

CREATE TABLE `CampañaMaquina` (
   `Numero` int(10) unsigned not null default '0',
   `Marca` varchar(20) not null,
   `Modelo` varchar(20) not null,
   PRIMARY KEY (`Numero`,`Marca`,`Modelo`),
   KEY `Marca` (`Marca`,`Modelo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `CampañaMaquina` (`Numero`, `Marca`, `Modelo`) VALUES 
('1', 'Diam Institute', 'NO991f'),
('2', 'Lectus Convallis Est', 'YW791h'),
('3', 'Nulla Tempor Augue L', 'RX486p'),
('5', 'Nunc Ltd', 'QX808x'),
('4', 'Sed Foundation', 'CL042w');

CREATE TABLE `Ciudad` (
   `CP_Ciudad` int(4) unsigned not null default '0',
   `CP_Provincia` char(1),
   `Nombre` varchar(20) not null,
   PRIMARY KEY (`CP_Ciudad`,`Nombre`),
   KEY `CP_Provincia` (`CP_Provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `Ciudad` (`CP_Ciudad`, `CP_Provincia`, `Nombre`) VALUES 
('3200', 'E', 'Concordia'),
('6300', 'L', 'Santa Rosa'),
('6319', 'L', 'Carro Quemado'),
('8200', 'L', 'General Acha'),
('5000', 'X', 'Cordoba'),
('5152', 'X', 'Villa Carlos Paz'),
('5166', 'X', 'Cosquin'),
('5361', 'Z', 'Santa Cruz');

CREATE TABLE `CiudadZona` (
   `CP_Ciudad` int(4) unsigned not null default '0',
   `NombreCiudad` varchar(20) not null,
   `NombreZona` varchar(20) not null,
   PRIMARY KEY (`CP_Ciudad`,`NombreCiudad`,`NombreZona`),
   KEY `NombreZona` (`NombreZona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `CiudadZona` (`CP_Ciudad`, `NombreCiudad`, `NombreZona`) VALUES 
('5000', 'Cordoba', 'Interior'),
('5152', 'Villa Carlos Paz', 'Interior'),
('5166', 'Cosquin', 'Interior'),
('3200', 'Concordia', 'Noreste'),
('6300', 'Santa Rosa', 'Pampa'),
('6319', 'Carro Quemado', 'Pampa'),
('8200', 'General Acha', 'Pampa'),
('5361', 'Santa Cruz', 'Patagonia');

CREATE TABLE `Cliente` (
   `Razon_Social` varchar(30),
   `Cuit` decimal(11,0) unsigned not null,
   `CP_Ciudad` int(4) unsigned,
   `NombreCiudad` varchar(20) not null,
   PRIMARY KEY (`Cuit`),
   KEY `CP_Ciudad` (`CP_Ciudad`,`NombreCiudad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `Cliente` (`Razon_Social`, `Cuit`, `CP_Ciudad`, `NombreCiudad`) VALUES 
('Donec Luctus Company', '20733797847', '5152', 'Villa Carlos Paz'),
('Luctus Lobortis Class LLC', '20964881694', '5361', 'Santa Cruz'),
('Erat Consulting', '21857959152', '5000', 'Cordoba'),
('Vitae Odio Corp.', '24575097766', '6319', 'Carro Quemado'),
('Et Magnis Dis PC', '25224345014', '8200', 'General Acha'),
('Ligula Aliquam Corporation', '37395045887', '8200', 'General Acha'),
('Feugiat Sed Corporation', '37634697973', '5152', 'Villa Carlos Paz'),
('Erat Associates', '37842910105', '8200', 'General Acha'),
('Sit Amet Nulla Inc.', '38421805343', '8200', 'General Acha'),
('Duis LLC', '38817149425', '8200', 'General Acha'),
('Malesuada Integer Id Associate', '40054868870', '5361', 'Santa Cruz'),
('Metus Eu Erat Foundation', '41168483062', '3200', 'Concordia'),
('Sagittis Felis Donec Institute', '42381513522', '6300', 'Santa Rosa'),
('In Ornare Sagittis Corporation', '44492424700', '5166', 'Cosquin'),
('Sed Tortor Institute', '45206904390', '5361', 'Santa Cruz'),
('Ad Litora Consulting', '46430152934', '6300', 'Santa Rosa'),
('Nisi Dictum LLC', '46690258622', '5000', 'Cordoba'),
('Elit Foundation', '47157018047', '5000', 'Cordoba'),
('Risus Corporation', '48194781422', '6300', 'Santa Rosa'),
('Ipsum Sodales Associates', '48978380447', '6319', 'Carro Quemado');

CREATE TABLE `ClienteMaquina` (
   `Cuit` decimal(11,0) unsigned not null default '0',
   `Marca` varchar(20) not null,
   `Modelo` varchar(20) not null,
   `Cantidad` int(10) unsigned,
   PRIMARY KEY (`Cuit`,`Marca`,`Modelo`),
   KEY `Marca` (`Marca`,`Modelo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `ClienteMaquina` (`Cuit`, `Marca`, `Modelo`, `Cantidad`) VALUES 
('20733797847', 'A Incorporated', 'JA689p', '3'),
('20733797847', 'Consequat Corporatio', 'ZT202a', '2'),
('20964881694', 'Cursus Integer Molli', 'KU431w', '6'),
('21857959152', 'Elit A Feugiat Incor', 'KV163l', '4'),
('24575097766', 'Donec LLP', 'SV475o', '5'),
('37395045887', 'Egestas Aliquam Asso', 'CV085k', '8'),
('37634697973', 'Fusce Fermentum Indu', 'QI218i', '7'),
('38421805343', 'Justo LLC', 'RR799m', '5'),
('38817149425', 'In Consulting', 'IB182k', '2'),
('42381513522', 'Elit Etiam Laoreet I', 'XM629y', '12'),
('44492424700', 'Elit Erat Vitae Indu', 'TG910a', '6'),
('45206904390', 'Dolor Tempus Inc.', 'BW952q', '8'),
('46430152934', 'Consequat Corporatio', 'ZT202a', '21'),
('46690258622', 'Cras Convallis Conva', 'KM388d', '4'),
('47157018047', 'Diam Institute', 'NO991f', '1'),
('48194781422', 'Donec LLP', 'SV475o', '2'),
('48978380447', 'Duis Gravida Praesen', 'BO367l', '10'),
('48978380447', 'Elit Etiam Laoreet I', 'XM629y', '5');

CREATE TABLE `Comunicacion` (
   `Numero` int(10) unsigned not null,
   `Cuil` decimal(11,0) unsigned,
   `Cuit` decimal(11,0) unsigned,
   `Medio` varchar(13),
   `Observacion` varchar(300),
   `Estado` varchar(9),
   `Fecha` datetime,
   PRIMARY KEY (`Numero`),
   KEY `Cuil` (`Cuil`),
   KEY `Cuit` (`Cuit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `Comunicacion` (`Numero`, `Cuil`, `Cuit`, `Medio`, `Observacion`, `Estado`, `Fecha`) VALUES 
('0', '38331147320', '24575097766', 'telefono', 'acordarse de felicitarlo por el torneo Pimes', 'pendiente', '2014-11-05 16:00:00'),
('1', '26048204535', '38421805343', 'telefono', '', 'pendiente', '2014-12-05 17:00:00'),
('2', '39728412060', '40054868870', 'telefono', '', 'realizada', '2014-03-05 17:00:00'),
('3', '29685802720', '20964881694', 'personalmente', 'Condolencias a la familia por la muerte de la hija', 'pendiente', '2014-12-09 17:00:00'),
('4', '26213114093', '37842910105', 'telefono', '', 'realizada', '2014-07-02 17:00:00'),
('5', '21020908281', '37395045887', 'personalmente', '', 'realizada', '2014-05-04 17:00:00');

CREATE TABLE `Contacto` (
   `Dni` decimal(8,0) unsigned not null,
   `Cuit` decimal(11,0) unsigned,
   `Nombre` varchar(30),
   `Apellido` varchar(30),
   `Fecha_de_Nacimiento` date,
   `Apodo` varchar(15),
   PRIMARY KEY (`Dni`),
   KEY `Cuit` (`Cuit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `Contacto` (`Dni`, `Cuit`, `Nombre`, `Apellido`, `Fecha_de_Nacimiento`, `Apodo`) VALUES 
('20204100', '41168483062', 'Judah', 'Hewitt', '2014-07-27', 'Chiche'),
('20329924', '37395045887', 'Callum', 'Woodward', '2014-09-25', 'Chiche'),
('21337193', '38817149425', 'Adele', 'Kemp', '2015-08-15', 'Chiqui'),
('22997904', '21857959152', 'Melodie', 'Barker', '2015-09-17', ''),
('23208477', '37634697973', 'Yvette', 'Montoya', '2014-08-01', 'Lolo'),
('23224448', '46690258622', 'Keegan', 'Francis', '2014-04-08', ''),
('24584917', '46430152934', 'Frances', 'Clark', '2014-05-20', 'Lito'),
('24726950', '38421805343', 'Kennan', 'Marsh', '2014-12-01', ''),
('25213927', '45206904390', 'Jessamine', 'Maynard', '2014-07-31', 'Lolo'),
('29409911', '20733797847', 'Ferdinand', 'Cain', '2013-09-24', ''),
('29487317', '44492424700', 'Zachary', 'Guerra', '2015-05-25', ''),
('30024787', '24575097766', 'Paloma', 'Avery', '2014-09-24', 'Mosca'),
('30871449', '40054868870', 'Ralph', 'Hurst', '2014-05-28', ''),
('30896275', '37842910105', 'Cleo', 'Beach', '2015-08-05', ''),
('31662698', '25224345014', 'Marny', 'Pierce', '2015-06-19', 'Lolo'),
('31968465', '25224345014', 'Berk', 'Forbes', '2014-03-02', 'Mosca'),
('32771591', '42381513522', 'Tanya', 'Bowen', '2014-10-12', ''),
('32824165', '48194781422', 'Erich', 'Hodge', '2014-01-21', 'Chiche'),
('33018608', '48978380447', 'Carissa', 'Mccullough', '2014-08-09', 'Mosca'),
('33487157', '47157018047', 'Chastity', 'Frazier', '2015-08-07', 'Lito'),
('34306744', '20964881694', 'Sade', 'Owens', '2014-12-29', 'Chiche');

CREATE TABLE `Email_Contacto` (
   `Email` varchar(30) not null,
   `Dni` decimal(8,0) unsigned not null default '0',
   PRIMARY KEY (`Email`,`Dni`),
   KEY `Dni` (`Dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `Email_Contacto` (`Email`, `Dni`) VALUES 
('vulputate.lacus.Cras@ridiculus', '20204100'),
('feugiat@Vestibulumanteipsum.ed', '20329924'),
('nunc.nulla.vulputate@semper.co', '21337193'),
('dictum.magna@dictumProin.com', '22997904'),
('id.libero@maurisipsumporta.org', '23208477'),
('enim.Nunc@consectetuerrhoncusN', '23224448'),
('et.nunc.Quisque@primisin.co.uk', '24584917'),
('volutpat.ornare.facilisis@phar', '24726950'),
('Phasellus.ornare@rhoncusid.com', '25213927'),
('lorem.eu@pede.net', '29409911'),
('Nunc@magnaseddui.edu', '29487317'),
('vehicula@justo.ca', '29487317'),
('sed@sollicitudincommodoipsum.n', '30024787'),
('Nunc@nascetur.org', '30871449'),
('lectus@Proin.com', '30896275'),
('eget.ipsum.Donec@mi.ca', '31662698'),
('mi.pede.nonummy@at.org', '31662698'),
('Nam@nequeNullam.edu', '31662698'),
('dapibus.rutrum@fringillaDonec.', '31968465'),
('ipsum.leo@justoeuarcu.ca', '32771591'),
('molestie.in.tempus@mollis.org', '32824165'),
('quam.a.felis@Vestibulumante.ed', '33018608'),
('egestas.urna.justo@Quisquetinc', '33487157'),
('Cras.eget@facilisisvitaeorci.c', '34306744'),
('ipsum.non@laciniavitaesodales.', '34306744');

CREATE TABLE `Maquina` (
   `Marca` varchar(20) not null,
   `Modelo` varchar(20) not null,
   PRIMARY KEY (`Marca`,`Modelo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `Maquina` (`Marca`, `Modelo`) VALUES 
('A Incorporated', 'JA689p'),
('Ac Nulla Corp.', 'NX072l'),
('Aenean LLP', 'JP471q'),
('Aliquam Institute', 'TH723p'),
('Aptent Taciti Socios', 'PV103b'),
('At Sem Molestie Cons', 'AI421p'),
('Consequat Corporatio', 'ZT202a'),
('Cras Convallis Conva', 'KM388d'),
('Cursus Integer Molli', 'KU431w'),
('Diam Institute', 'NO991f'),
('Diam LLP', 'QW469l'),
('Dolor Donec Inc.', 'BF376b'),
('Dolor Tempus Inc.', 'BW952q'),
('Donec LLP', 'SV475o'),
('Duis Gravida Praesen', 'BO367l'),
('Egestas Aliquam Asso', 'CV085k'),
('Egestas Corporation', 'OP439y'),
('Eget Metus In Limite', 'IY922k'),
('Elementum Limited', 'WF627v'),
('Elit A Feugiat Incor', 'KV163l'),
('Elit Erat Vitae Indu', 'TG910a'),
('Elit Etiam Laoreet I', 'XM629y'),
('Et Tristique Pellent', 'FK228f'),
('Eu Neque Company', 'DX343e'),
('Eu Neque Incorporate', 'JR387o'),
('Fusce Aliquam LLC', 'EG830v'),
('Fusce Fermentum Indu', 'QI218i'),
('In Consulting', 'IB182k'),
('Interdum Curabitur D', 'LD860s'),
('Justo LLC', 'RR799m'),
('Lacus Cras Interdum ', 'WA701n'),
('Lectus Convallis Est', 'YW791h'),
('Lectus Convallis LLP', 'AA652m'),
('Ligula Incorporated', 'SL862l'),
('Lorem Vitae Company', 'DC370x'),
('Massa Ltd', 'SH165f'),
('Molestie Institute', 'GF253g'),
('Natoque Penatibus Et', 'PV702h'),
('Neque Foundation', 'LY652q'),
('Nibh Lacinia Orci Lt', 'PO207z'),
('Non Nisi LLP', 'OO653c'),
('Non Quam Pellentesqu', 'GS953l'),
('Nulla Tempor Augue L', 'RX486p'),
('Nunc Ltd', 'QX808x'),
('Orci In Consequat In', 'SG290u'),
('Pharetra Corporation', 'VJ036f'),
('Pretium Et Rutrum In', 'ET779e'),
('Proin LLC', 'YT186z'),
('Purus Maecenas Liber', 'PN222o'),
('Quam LLP', 'WI139c'),
('Quisque Varius Nam I', 'WK222e'),
('Sagittis Nullam Asso', 'MP498z'),
('Sed Foundation', 'CL042w'),
('Sed Sem Egestas Ltd', 'DO528a'),
('Senectus PC', 'WH743c'),
('Sit Amet Company', 'JX897a'),
('Ultrices Duis Founda', 'NL187p'),
('Ultrices Duis LLP', 'UO416j'),
('Ut Lacus Nulla LLP', 'CP670r'),
('Vel Sapien Ltd', 'HA703n');

CREATE TABLE `Numero_Telefono_Contacto` (
   `Numero` bigint(20) unsigned not null default '0',
   `Dni` decimal(8,0) unsigned not null default '0',
   PRIMARY KEY (`Numero`,`Dni`),
   KEY `Dni` (`Dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `Numero_Telefono_Contacto` (`Numero`, `Dni`) VALUES 
('4123124', '20204100'),
('15201010', '20204100'),
('543417978827', '20204100'),
('15888890', '20329924'),
('541325792906', '20329924'),
('4333223', '21337193'),
('541208193865', '21337193'),
('15677889', '22997904'),
('155522123', '22997904'),
('541616948007', '22997904'),
('157778521', '23208477'),
('543210421774', '23208477'),
('49998789', '23224448'),
('541243993270', '23224448'),
('15123410', '24584917'),
('543302457448', '24584917'),
('12347612', '24726950'),
('543137808373', '24726950'),
('4444222', '25213927'),
('541491335044', '25213927'),
('4888781', '29409911'),
('543101424022', '29409911'),
('15433552', '29487317'),
('542199557985', '29487317'),
('15665558', '30024787'),
('541400965773', '30024787'),
('4298844', '30871449'),
('542021443739', '30871449'),
('1559998', '30896275'),
('4442551', '30896275'),
('542396683761', '30896275'),
('15151521', '31662698'),
('541518552856', '31662698'),
('1576548', '31968465'),
('541204136718', '31968465'),
('155253489', '32771591'),
('542898306993', '32771591'),
('41423511', '32824165'),
('543546199427', '32824165'),
('15653223', '33018608'),
('541323361378', '33018608'),
('4442212', '33487157'),
('15564321', '33487157'),
('541673171479', '33487157'),
('15219890', '34306744');

CREATE TABLE `Provincia` (
   `CP_Provincia` char(1) not null,
   `Nombre` varchar(20),
   PRIMARY KEY (`CP_Provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `Provincia` (`CP_Provincia`, `Nombre`) VALUES 
('E', 'Entre Rios'),
('L', 'La Pampa'),
('X', 'Cordoba'),
('Z', 'Santa Cruz');

CREATE TABLE `Vendedor` (
   `Cuil` decimal(11,0) unsigned not null,
   `Nombre` varchar(30),
   `Apellido` varchar(30),
   PRIMARY KEY (`Cuil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `Vendedor` (`Cuil`, `Nombre`, `Apellido`) VALUES 
('20675821714', 'Aurora', 'Dalton'),
('21020908281', 'Serina', 'Love'),
('21588486935', 'Silas', 'Avila'),
('22057905057', 'Calista', 'Ratliff'),
('22839933279', 'Karleigh', 'Alvarez'),
('23140188679', 'John', 'Watkins'),
('23661966184', 'Wynter', 'Bush'),
('26038334742', 'Emery', 'Gilbert'),
('26048204535', 'Penelope', 'Mcleod'),
('26213114093', 'Jin', 'Terrell'),
('26301106493', 'Oren', 'Koch'),
('26465204143', 'Adrienne', 'Wong'),
('27980914786', 'Mira', 'Simmons'),
('29685802720', 'Charity', 'Silva'),
('31576877022', 'Yoshio', 'Ewing'),
('33445206834', 'Yuli', 'Little'),
('34419713737', 'Zeph', 'Stark'),
('38331147320', 'Demetrius', 'Whitney'),
('39728412060', 'Ira', 'Bonner'),
('39942457508', 'Jade', 'Coffey');

CREATE TABLE `VendedorCliente` (
   `Cuil` decimal(11,0) unsigned,
   `Cuit` decimal(11,0) unsigned,
   KEY `Cuil` (`Cuil`),
   KEY `Cuit` (`Cuit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `VendedorCliente` (`Cuil`, `Cuit`) VALUES 
('20675821714', '21857959152'),
('21020908281', '38421805343'),
('21588486935', '41168483062'),
('22057905057', '44492424700'),
('22839933279', '38421805343'),
('23140188679', '48978380447'),
('23661966184', '45206904390'),
('26038334742', '46430152934'),
('26048204535', '37842910105'),
('26213114093', '38817149425'),
('26301106493', '48194781422'),
('26465204143', '41168483062'),
('27980914786', '20733797847'),
('29685802720', '25224345014'),
('31576877022', '47157018047'),
('33445206834', '20964881694'),
('34419713737', '24575097766'),
('38331147320', '20964881694'),
('39728412060', '20733797847'),
('39942457508', '20964881694');

CREATE TABLE `Zona` (
   `Nombre` varchar(20) not null,
   PRIMARY KEY (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `Zona` (`Nombre`) VALUES 
('Cuyo'),
('Interior'),
('Noreste'),
('Noroeste'),
('Pampa'),
('Patagonia');
