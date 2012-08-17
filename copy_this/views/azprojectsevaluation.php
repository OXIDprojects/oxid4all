<?php
class azProjectsEvaluation extends oxUBase 
{
	protected $_aMas = null;
	
	protected $_sThisTemplate = "azprojectsevaluation.tpl";
	
	public function init()
	{
		parent::init();
		
		if($this->getUser()->oxuser__oxrights->value != "malladmin") {
			oxUtils::getInstance()->redirect( $myConfig->getShopHomeURL() );
		}
	}
	
	
	public function render()
	{
		parent::render();
		
		$this->_aViewData['statmonth'] = $this->getConfig()->getParameter('statmonth');
		$this->_aViewData['statmonthprojects'] = $this->getConfig()->getParameter('statmonthprojects');
		
		$this->_getMas();
		$this->_aViewData['aMas'] = $this->_aMas;
		$this->_aViewData['maId'] = $this->getConfig()->getParameter('statmonthprojectsma');
		$this->_aViewData['azbilled'] = $this->getConfig()->getParameter('azbilled');
		
		return $this->_sThisTemplate;
	}
	
	public function getLastMonths()
	{
		$aLastMonths = array();
		
		$iThisMonth = date("m");
		$iThisYear = date("Y");
		
		for ($i=1; $i<=$iThisMonth; $i++) {
			if($i<10)
				$sMonth = "0".$i;
			else 
				$sMonth = $i;
				
			$aLastMonths[] = "$iThisYear-$sMonth";
		}
		
		$aNew = array_reverse($aLastMonths);
		
		$iLastYear = $iThisYear - 1;
		
		for($i=12; $i>0; $i--) {
			if($i<10)
				$sMonth = "0".$i;
			else 
				$sMonth = $i;
			
			$aNew[] = "$iLastYear-$sMonth";
		}
		
		
		
		return $aNew;
	}
	
	public function getAverage()
	{
		$sMonth = $this->getConfig()->getParameter('statmonth');
		
		$sSelect = "select distinct azdate from azjobs where azdate like '$sMonth%'";
		$rs = oxDb::getDb()->Execute($sSelect);
		if($rs != false && $rs->RecordCount() > 0) {
			while (!$rs->EOF) {
				$aWorkDates[]	= $rs->fields[0];
				$rs->MoveNext();
			}
		}
		
		$iWorkDays = count($aWorkDates);
		
		$this->_getMas();
		foreach ($this->_aMas as $oMa) {
			$sSelect = "select sum(aztimereal) as timereal from azjobs where azmaid = '".$oMa->id."' and azdate like '$sMonth%'";
			$dTimeReal = oxDb::getDb()->GetOne($sSelect);
			
			$sSelect = "select sum(aztimebill) as timebill from azjobs where azmaid = '".$oMa->id."' and azdate like '$sMonth%'";
			$dTimeBill = oxDb::getDb()->GetOne($sSelect);
			
			if($dTimeBill > 0 || $dTimeReal > 0) {
				$oStat = new stdClass();
				$oStat->name				= $oMa->name;
				$oStat->timeRealAll			= number_format($dTimeReal, 2);
				$oStat->timeBillAll			= number_format($dTimeBill, 2);
				$oStat->avTimeRealPerDay	= round(($dTimeReal / $iWorkDays), 2);
				$oStat->avTimeBillPerDay	= round(($dTimeBill / $iWorkDays), 2);
				
				$aStats[$oMa->id] = $oStat;
			}
		}
		
		$this->_aViewData['aStats'] = $aStats;
	}
	
	protected function _getMas()
	{
		
		$sSelect = "select distinct azmaid from azjobs, oxuser where oxuser.oxlname != '' and oxuser.oxid = azjobs.azmaid order by oxuser.oxlname";
		$rs = oxDb::getDb()->Execute($sSelect);
		if($rs != false && $rs->RecordCount() > 0) {
			while (!$rs->EOF) {
				
				$oMa = new stdClass();
				$oMa->name = oxDb::getDb()->GetOne("select concat(oxlname, ', ', oxfname) from oxuser where oxid = '".$rs->fields[0]."'");
				$oMa->id = $rs->fields[0];
				
				$this->_aMas[] = $oMa;
				$rs->MoveNext();
			}
		}
	}
	
	public function getProjectData($azMaId = null)
	{
		$sMonth = $this->getConfig()->getParameter('statmonthprojects');
		$azbilled = $this->getConfig()->getParameter('azbilled');
		$aProjects = array();
		$dTotalCost = 0;
		$dTotalHours = 0;
		
		$sSelect = "select azprojects.oxid, azprojects.aztitle, azprojects.azpriceperhour,  sum(azjobs.aztimebill) as totaltime 
			from azprojects, azjobs 
			where azjobs.azprojectid = azprojects.oxid ";
		
		if($azMaId)
			$sSelect .= "and azjobs.azmaid = '$azMaId' ";
		
		if($azbilled == "0")
			$sSelect .= "and azjobs.azbilled = '0' ";
		elseif ($azbilled == "1")
			$sSelect .= "and azjobs.azbilled = '1' ";
		$sSelect .= "and azjobs.azbillable = '1' 
			and azdate like '$sMonth%' group by azprojectid order by azprojects.aztitle";
		
		$rs = oxDb::getDb()->Execute($sSelect);
		if($rs != false && $rs->RecordCount() > 0) {
			while (!$rs->EOF) {
				$oProject = new stdClass();
				$oProject->id		= $rs->fields[0];
				$oProject->title	= $rs->fields[1];
				$oProject->hours	= $rs->fields[3];
				$dTotalHours		= $dTotalHours + $oProject->hours;
				$oProject->dCost	= ($rs->fields[2] * $rs->fields[3]);
				$dTotalCost			= $dTotalCost + $oProject->dCost;
				$oProject->fCost	= number_format($oProject->dCost, 2, ',', '.');
				
				$aProjects[]		= $oProject;
				
				$rs->MoveNext();
			}
		}
		$this->_aViewData['aProjects'] = $aProjects;
		$this->_aViewData['fTotalCost'] = number_format($dTotalCost, 2, ',', '.');
		$this->_aViewData['dTotalHours'] = $dTotalHours;
	}
	
	public function getProjectDataByMa()
	{
		$azMaId = $this->getConfig()->getParameter('statmonthprojectsma');
		$this->getProjectData($azMaId);
	}
}