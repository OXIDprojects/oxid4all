<?php
/**
 * 
 * Main view class for projects tracking startpage.
 * 
 * @author 		Andreas Ziethen, anzido GmbH
 * @link      	http://www.anzido.com
 * @package   	views
 * @copyright 	(C) anzido GmbH 2003-2010
 * @version 	OXID eShop CE oxid4project 1.0
 *
 */

/**
 * oxid4project app
 * This app is meant for project tracking in small companies.
 * It's free for use and licensed under GPL.
 *
 */

class azProjectsStart extends oxUbase
{
	/**
	 * keeps messages to be shown on errors or other events
	 * @var str
	 */
	protected $_aErrorMsg = array()	;
	
	/**
	 * template file
	 * @var str
	 */
	protected $_sThisTemplate = "azprojectsstart.tpl";
	
	public function init()
	{
		parent::init();
		
		$oUser = $this->getUser();
		if(!$oUser)
			header("location: ".$this->getConfig()->getShopHomeUrl()."cl=azprojectslogin");
	}

	/**
	 * Executes parent::render(), sets template variables for error messages and user list
	 * @return str $this->_sThisTemplate
	 */
    public function render()
    {
        if ( oxConfig::getParameter( 'showexceptionpage' ) == '1' ) {
            return 'exception.tpl';
        }

        parent::render();
        
        if(count($this->_aErrorMsg))
        	$this->_aViewData['aErrorMsg'] = $this->_aErrorMsg;
        	
        $aUsers = $this->getUsers();
        if(count($aUsers))
        	$this->_aViewData['aUsers'] = $aUsers;
        return $this->_sThisTemplate;
    }
    
    /**
     * calls global function azGetTimeSteps() (function.php)
     * this function generates a list with steps of duration from 0.25 to 8 hours
     * in quarter hour steps
     * 
     * @return array
     */
    public function getTimeSteps()
    {
    	return azGetTimeSteps();
    }

    
    public function getProjects()
    {
    	$oProjectList = oxNew("azprojectlist");
    	$oProjectList->selectString("select oxid, aztitle from azprojects order by aztitle");
    	
    	return $oProjectList->getArray();
    }
    
    public function getPastDays()
    {
    	return  azGetPastDays(180);
    }
    
    protected function _createNewProject($title, $dPricePerHour)
    {
    	$id = oxDb::getDb()->GetOne("select oxid from azprojects where aztitle = '$title'");
    	if(!empty($id)) {
    		$this->_aErrorMsg[] = "Projekt schon vorhanden!";
    		return "error";
    	}
    	
    	$oProject = oxNew("azproject");
    	$oProject->azprojects__aztitle->value = $title;
    	$oProject->azprojects__azpriceperhour->value = $dPricePerHour;
    	$oProject->save();

    	return $oProject->getId();
    }

    public function saveProjectData()
    {
    	$aData = $this->getConfig()->getParameter('azdata');
    	$iProjectId = $aData['azjobs__azprojectid'];
    	$this->_aViewData['actProject'] = $iProjectId;
    	$newproject = $this->getConfig()->getParameter('newproject');
    	
    	if(!empty($newproject)) {
    		$dPricePerHour = $this->getConfig()->getParameter('newprojectpriceperhour');
    		$aData['azjobs__azprojectid'] = $this->_createNewProject($newproject, $dPricePerHour);
    		if($aData['azjobs__azprojectid'] != "error")
    			$this->_aErrorMsg[] = "Neues Projekt \"".$newproject."\" eingetragen.";
    		return ;
    	}
    	
    	
    	if(empty($aData['azjobs__azprojectid']))
    		return ;
    	//dumpVar($aData);
    	
    	if(empty($aData['azjobs__azremark']) && empty($newproject)) {
    		$this->_aErrorMsg[] = "Bitte unbedingt eine Bemerkung eintragen!";
    		return ;
    	}
    		
    	
    	
    	
    	if(!empty($aData['azjobs__azmaid'])) {
    		$sUserId = $aData['azjobs__azmaid'];
    		$this->_aViewData['azActUser'] = $sUserId;
    	} else 
    		$aData['azjobs__azmaid'] = $this->getUser()->getId();
    		
    	if(isset($aData['azjobs__azbilled']) && !empty($aData['azjobs__azbilled']))
    		$aData['azjobs__azbilled'] = '1';
    	else 
    		$aData['azjobs__azbilled'] = '0';
    		
    	$aData['azjobs__azdate'] = date("Y-m-d", $aData['azjobs__azdate']);
    	$aData['azjobs__azbillable'] = '1';
    	
    	// TODO:billed time still the same a real time
    	$aData['azjobs__aztimebill'] = $aData['azjobs__aztimereal'];
    	
    	//dumpVar($aData);
    	$oJob = oxNew("azjob");
    	$oJob->assign( $aData);
    	$oJob->save();
    		
    	$this->_aErrorMsg[] = "erfolgreich eingetragen.";
    }
    
    public function getUsers()
    {
    	if($this->getUser()->oxuser__oxrights->value != 'malladmin')
    		return ;
    		
    	$oUserList = oxNew('oxuserlist');
    	$sSelect = "select oxid, oxusername, oxfname, oxlname from oxuser where oxactive = '1'";
    	$oUserList->selectString($sSelect);
    	
    	
    	return $oUserList->getArray();
    }
}