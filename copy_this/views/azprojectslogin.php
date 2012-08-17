<?php
/**
 * 
 * Main view class for login to project tracking tool.
 * 
 * @author 		Andreas Ziethen, anzido GmbH
 * @link      	http://www.anzido.com
 * @package   	views
 * @copyright 	(C) anzido GmbH 2003-2010
 * @version 	OXID eShop CE oxid4project 1.0
 * @license		GPL
 *
 */

/**
 * oxid4project app
 * This app is meant for project tracking in small companies.
 * It's free for use and licensed under GPL.
 *
 */

class azprojectsLogin extends oxUbase 
{
	/**
	 * name of template file
	 * @var str
	 */
	protected $_sThisTemplate = "azprojectslogin.tpl";
	
	/**
	 * calls parent (oxUbase) render and returns name of tpl file
	 * @return str $this->_sThisTemplate
	 * 
	 */
	public function render() {
		parent::render();
		
		return $this->_sThisTemplate;
	}
}