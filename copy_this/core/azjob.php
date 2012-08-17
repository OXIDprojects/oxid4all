<?php
class azjob extends oxI18n
{
    protected $_sCoreTbl = 'azjobs';

    /**
     * Name of current class.
     *
     * @var string
     */
    protected $_sClassName = 'azjob';

    /**
     * Multi shop tables, set in config.
     *
     * @var array
     */
    protected $_aMultiShopTables = array();

    /**
     * Class constructor, initiates parent constructor (parent::oxBase()).
     */
    public function __construct()
    {
        parent::__construct();
        $this->init( 'azjobs' );
    }

    public function assign($dbRecord)
    {	parent::assign($dbRecord);
    	$this->projectname = oxDb::getDb()->getOne("select aztitle from azjobs where azid = '".$this->azjobs__azprojectid->value."'");
    	
    	$aDate				= explode("-", $this->azjobs__azdate->value);
		$this->dateTs		= mktime(0,0,0,$aDate[1],$aDate[2],$aDate[0]);
		
		$this->azjobs__azremark->value = html_entity_decode($this->azjobs__azremark->value);
    }
    
    /*
    public function save()
    {
    	$this->azjobs__azremark->value = html_entity_decode($this->azjobs__azremark->value);
    	parent::save();
    }
    */
}
