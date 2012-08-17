INSERT INTO `azjobs` (`OXID`, `AZDATE`, `AZPROJECTID`, `AZMAID`, `AZTIMEREAL`, `AZTIMEBILL`, `AZREMARK`, `AZREMARKINTERNAL`, `AZBILLED`, `AZTIMESTAMP`, `AZBILLABLE`, `AZOFFER`) VALUES
('d75dc4cbe7f79d1a6df1274d02eafc2d', '2010-05-09', '43edad90192db541dd391ac477e151e0', '64b508c674d8dd8987ab0e0d09a4e845', 4, 4, 'Warenkorb gefixt.', 'War ziemlich knifflig wegen diverser Module ...', '0', '0000-00-00 00:00:00', '1', ''),
('d7025b25adc7e321e9bd33701a7c4abd', '2010-04-03', '43e5e0b301ca4ecf2e6c6109bb85cd09', '64b508c674d8dd8987ab0e0d09a4e845', 5, 5, 'Probleme bei Checkout gefixt.', 'Lag zum Teil an einem Fehler in unserem Modul, daher nur 3 Std. abrechnen.', '1', '2010-05-09 18:48:54', '1', ''),
('d70c4bc9cc639f0df8d691b158e8d115', '2010-04-02', '43e5e0b301ca4ecf2e6c6109bb85cd09', 'oxprojectadmin', 4, 4, 'Kundenmodul programmiert', '', '0', '0000-00-00 00:00:00', '1', ''),
('d70d9786ec52cec56d20b62552b58dc6', '2010-04-11', 'd75cbb92441931c877e113cc8b1c3759', '64b508c674d8dd8987ab0e0d09a4e845', 3.5, 3.5, 'Projektdoku angelegt.', '', '0', '0000-00-00 00:00:00', '1', ''),
('d70c8f29a74befbb0b9026dd6eda1152', '2010-04-06', 'd75ce4074b5fb4a60c2821efcb7b4569', '64be02e17c2bb10129000394ccf94d12', 6.5, 6.5, 'Templateanpassungen auf Kundenwunsch', '', '0', '0000-00-00 00:00:00', '1', ''),
('d70879956a05dfbd5edcf96017844db9', '2010-04-15', '43e5e0b301ca4ecf2e6c6109bb85cd09', '64be02e17c2bb10129000394ccf94d12', 4.5, 4.5, 'Analyse eines Fehlers beim Checkout: Danke-Seite wurde nicht angzeigt.', 'Kam zustande wegen Fehler in einem Third-Party-Modul.', '0', '0000-00-00 00:00:00', '1', '');

INSERT INTO `azprojects` (`OXID`, `AZTITLE`, `AZPRICEPERHOUR`) VALUES
('43e5e0b301ca4ecf2e6c6109bb85cd09', 'Testprojekt 1', 50),
('43edad90192db541dd391ac477e151e0', 'Testprojekt 2', 65),
('d75cbb92441931c877e113cc8b1c3759', 'Testprojekt 3', 70),
('d75ce4074b5fb4a60c2821efcb7b4569', 'Testprojekt 4', 55);

INSERT INTO `oxuser` (`OXID`, `OXACTIVE`, `OXRIGHTS`, `OXSHOPID`, `OXUSERNAME`, `OXPASSWORD`, `OXPASSSALT`, `OXCUSTNR`, `OXUSTID`, `OXCOMPANY`, `OXFNAME`, `OXLNAME`, `OXSTREET`, `OXSTREETNR`, `OXADDINFO`, `OXCITY`, `OXCOUNTRYID`, `OXSTATEID`, `OXZIP`, `OXFON`, `OXFAX`, `OXSAL`, `OXBONI`, `OXCREATE`, `OXREGISTER`, `OXPRIVFON`, `OXMOBFON`, `OXBIRTHDATE`, `OXURL`, `OXDISABLEAUTOGRP`, `OXUPDATEKEY`, `OXUPDATEEXP`, `OXISOPENID`) VALUES
('oxprojectadmin', 1, 'malladmin', 'oxbaseshop', 'admin@myshop.com', 'bc3c7a81cf41badcdd84490087e23365', '3861313735666661663339303636613936363738373163666563396336343237', 1, '', 'Your Company Name', 'John', 'Doe', 'Maple Street', '2425', '', 'Any City', 'a7c40f631fc920687.20179984', 'BW', '9041', '217-8918712', '217-8918713', 'MR', 1000, '2003-01-01 00:00:00', '2003-01-01 00:00:00', '', '', '0000-00-00', '', 0, '', 0, 0),
('64b508c674d8dd8987ab0e0d09a4e845', 1, 'user', 'oxbaseshop', 'entwickler1@myshop.com', '293010a2b07faa08c402c9455bd90949', '3634626531623365396239616363366563313233386131373563393739313664', 2, '', 'myshop.com', 'Emil', 'Entwickler', '', '', '', '', 'a7c40f631fc920687.20179984', '', '', '', '', 'MR', 1000, '2010-04-25 15:02:30', '2010-04-25 15:02:30', '', '', '0000-00-00', '', 0, '', 0, 0),
('64be02e17c2bb10129000394ccf94d12', 1, 'user', 'oxbaseshop', 'entwickler2@myshop.com', 'fe710327c2301592a9233d78520b178c', '3634626265313364396162613133663039323431346630396337613532303466', 3, '', 'myshop.com', 'Paul', 'Progammierer', '', '', '', '', 'a7c40f631fc920687.20179984', '', '', '', '', 'MR', 1000, '2010-04-25 15:03:07', '2010-04-25 15:03:07', '', '', '0000-00-00', '', 0, '', 0, 0);
