<?php
/**
 * 
 * Main view class for projects tracking startpage.
 * 
 * @author 		Andreas Ziethen, anzido GmbH
 * @link      	http://www.anzido.com
 * @package   	core
 * @copyright 	(C) anzido GmbH 2003-2010
 * @version 	OXID eShop CE oxid4project 1.0
 *
 */

/**
 * project list manager.
 * Organizes list of project objects.
 * @package core
 */
class azProjectList extends oxList
{
    /**
     * Class constructor, sets callback so that Shopowner is able to add any information to the article.
     *
     * @param string $sObjectsInListName Object name (azProject)
     *
     * @return null
     */
    public function __construct( $sObjectsInListName = 'azproject')
    {
        return parent::__construct( 'azproject');
    }
}
