<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Projekterfassung - [{$oxcmp_shop->oxshops__oxname->value}]</title>
	<link rel="stylesheet" type="text/css" href="[{ $oViewConf->getResourceUrl() }]oxid.css">
    <!--[if IE 8]><link rel="stylesheet" type="text/css" href="[{ $oViewConf->getResourceUrl() }]oxid_ie8.css"><![endif]-->
    <!--[if IE 7]><link rel="stylesheet" type="text/css" href="[{ $oViewConf->getResourceUrl() }]oxid_ie7.css"><![endif]-->
    <!--[if IE 6]><link rel="stylesheet" type="text/css" href="[{ $oViewConf->getResourceUrl() }]oxid_ie6.css"><![endif]-->
</head>
<body>
<div id="page">
	<div id="header">
        <div class="bar oxid">
        	<table>
        		<tr>
        			<td>
        			<a class="logo" href="[{ $oViewConf->getHomeLink() }]">
		                <img src="[{$oViewConf->getImageUrl()}]oxid4project_logo.jpg" alt="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]">
		            </a>
        			</td>
        			[{if $oxcmp_user->oxuser__oxpassword->value}]
        			<td align="right" class="projectsmenu"><a href="[{$oViewConf->getSelfLink()}]cl=azprojectsstart">ERFASSUNG</a> [{if $oxcmp_user->oxuser__oxrights->value == "malladmin"}]| <a href="[{$oViewConf->getSelfLink()}]cl=azprojectsevaluation">AUSWERTUNG</a> [{/if}]| <a href="[{$oViewConf->getSelfLink()}]cl=azprojectslogin&fnc=logout">LOGOUT</a></td>
        			[{/if}]
        		</tr>
        		<tr>
        			<td colspan="2" class="backgr" background="[{$oViewConf->getImageUrl()}]unten.jpg"  width="978" height="27">
        			
        			</td>
        		</tr>
        	</table>
        <div class="clear"></div>
    </div>
    <div class="clear"></div>
</div>