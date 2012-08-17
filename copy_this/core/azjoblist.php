<?php
/**
 * 
 * 
 * @author 		Andreas Ziethen, anzido GmbH
 * @link      	http://www.anzido.com
 * @package   	core
 * @copyright 	(C) anzido GmbH 2003-2010
 * @version 	OXID eShop CE oxid4project 1.0
 *
 */

/**
 * job list manager.
 * Organizes list of job objects.
 * @package core
 */
class azJobList extends oxList
{
    /**
     *
     * @param string $sObjectsInListName Object name (azjob)
     *
     * @return null
     */
    public function __construct( $sObjectsInListName = 'azjob')
    {
        return parent::__construct( 'azjob');
    }
}
