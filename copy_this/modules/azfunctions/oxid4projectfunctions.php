<?php
function azGetTimeSteps()
{
    $aSteps = array();
    $dIntervall = 0.25;
    for($i=1; $i<=32; $i++) {
	    $aSteps[] = number_format(($i*$dIntervall), 2, '.', ',');
    }
    return $aSteps;
 }
 
 function azGetPastDays($iNumber=7)
 {
   	$iTsNow = mktime(0,0,0,date('m'), date('d'), date('Y'));
   	$iDaySeconds = 86400;
   	$aDays = array();
   	
   	for($i=0; $i<$iNumber; $i++) {
   		$iThisDay = $iTsNow - ($i * $iDaySeconds);
   		$sThisDay = date("d.m.Y", $iThisDay);
   		
   		$oDate			= new stdClass();
   		$oDate->ts		= $iThisDay;
   		$oDate->string	= $sThisDay;
   		$aDays[]		= $oDate;
   	}
   	return  $aDays;
 }