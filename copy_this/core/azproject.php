<?php
/**
 * 
 * core class for single project object.
 * 
 * @author 		Andreas Ziethen, anzido GmbH
 * @link      	http://www.anzido.com
 * @package   	core
 * @copyright 	(C) anzido GmbH 2003-2010
 * @version 	OXID eShop CE oxid4project 1.0
 * @license		GPL
 *
 */
class azproject extends oxI18n
{
    protected $_sCoreTbl = 'azprojects';

    /**
     * Name of current class.
     * @var string
     */
    protected $_sClassName = 'azprojcect';

    /**
     * Class constructor, initiates parent constructor (parent::oxBase()).
     */
    public function __construct()
    {
        parent::__construct();
        $this->init( 'azprojects' );
    }
}
