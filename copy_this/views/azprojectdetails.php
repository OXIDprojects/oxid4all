<?php
class azprojectdetails extends oxUbase
{
	public function render()
	{
		parent::render();
		
		$this->_getProjectDetails();
		
		return "azprojectdetails.tpl";
	}
	
	protected function _getProjectDetails()
	{
		// TODO: this should be put to a core class
		$id = $this->getConfig()->getParameter('projectid');
		$this->_aViewData['projectid'] = $id;
		$sMonth = $this->getConfig()->getParameter('month');
		
		$aJobs = array();
		
		$sSelect = "select ap.aztitle, apt.azdate, apt.aztimereal, apt.aztimebill, apt.azremark, apt.azremarkinternal, apt.oxid, apt.azbilled 
			from azprojects ap, azjobs apt, oxuser ou ";
			
		$sWhere = " where apt.azbillable = '1' and apt.azprojectid = '$id' ";
		
		$azbilled = $this->getConfig()->getParameter('azbilled');
		$this->_aViewData['azbilled'] = $azbilled;
		if($azbilled === "0" || $azbilled === "1")
			$sWhere .= " and azbilled = '$azbilled' ";
		
		//$sSelect .= "and apt.azdate like '$sMonth%' ";
		$sWhere .= "and ap.oxid = apt.azprojectid 
			and ou.oxid = apt.azmaid 
			order by apt.azdate, apt.aztimestamp";
		$sSelect = $sSelect.$sWhere;
		$rs = oxDb::getDb()->Execute($sSelect);
		if($rs != false && $rs->RecordCount() > 0) {
			while (!$rs->EOF) {
				$oJob = new stdClass();
				$oJob->title	= $rs->fields[0];
				$oJob->date		= $rs->fields[1];
				$oJob->timeReal	= $rs->fields[2];
				$oJob->timeBill	= $rs->fields[3];
				$oJob->remark	= $rs->fields[4];
				$oJob->remarkInt= $rs->fields[5];
				$oJob->id		= $rs->fields[6];
				$oJob->billed	= $rs->fields[7];
				$oJob->projectid= $id;
				
				$aJobs[]		= $oJob;
				
				$rs->MoveNext();
			}
		}
		$this->_aViewData['aJobs'] = $aJobs;
		
		$sSelect = "select sum(apt.aztimereal), sum(apt.aztimebill) from azprojects ap, azjobs apt, oxuser ou $sWhere";
		$rs = oxDb::getDb()->execute($sSelect);
		$oJobList = new stdClass();
		$oJobList->sumHoursReal = $rs->fields[0];
		$oJobList->sumHoursBill = $rs->fields[1];
		$dMoney = oxDb::getDb()->getOne("select azpriceperhour from azprojects where oxid = '$id'");
		$oJobList->sumMoney = number_format($oJobList->sumHoursBill * $dMoney, 2, ',', '.');
		$this->_aViewData['oJobList'] = $oJobList;
	}
	
	public function delJob()
	{
		$id = $this->getConfig()->getParameter('jobid');
		$sDel = "update azjobs set azbillable = '0' where oxid = '$id'";
		$rs = oxDb::getDb()->Execute($sDel);
	}
	
	public function billJob()
	{
		$id = $this->getConfig()->getParameter('jobid');
		$sUpd = "update azjobs set azbilled = '1' where oxid = '$id'";
		$rs = oxDb::getDb()->Execute($sUpd);
	}
	
}