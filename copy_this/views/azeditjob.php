<?php
class azeditjob extends oxUbase
{
	public function render()
	{
		parent::render();
		
		$this->getJobData();
		
		return "azeditjob.tpl";
	}
	
	public function getJobData()
	{
		$sJobId = $this->getConfig()->getParameter('jobid');
		$sProjectId = $this->getConfig()->getParameter('projectid');
		
		$oJob = oxNew("azjob");
		$oJob->load($sJobId);
		$this->_aViewData['oJob'] = $oJob;
	}
	
	public function saveJob()
	{
		$soxId      = oxConfig::getParameter( "jobid" );
		$aParams = $this->getConfig()->getParameter('azdata');
		//dumpVar($aParams);
		
		$aParams['azjobs__azdate'] = date("Y-m-d", $aParams['azdate']);
		
		$oJob = oxNew("azjob");
		$oJob->load($soxId);
		$oJob->assign( $aParams);
		
		$oJob->save();
	}
	
	public function getTimeSteps()
    {
    	return azGetTimeSteps();
    }
    
	public function getPastDays()
    {
    	return  azGetPastDays(180);
    }
}