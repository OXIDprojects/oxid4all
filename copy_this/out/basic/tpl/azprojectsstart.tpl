[{include file="azprojectsheader.tpl" title=$template_title location="START_TITLE"|oxmultilangassign isStart=true}]
<table align="center" border="0" cellpadding="0" cellspacing="0" width="982">
  <tbody>
  <tr>
    <td><br>
      <span class="Stil1"><strong>PROJEKTERFASSUNG</strong> - <span class="Stil2">Startseite</span></span></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  [{if $aErrorMsg}]
  <tr>
  	<td>
    <div style="font-weight:bold; color:#ff0000;">
    	[{foreach from=$aErrorMsg item=msg}]
    		[{$msg}]<br>
    	[{/foreach}]
    </div>
    <br>
    </td>
  </tr>
    [{/if}]
  <tr>
    <td><table bgcolor="#f2f2f2" border="0" cellpadding="4" cellspacing="0" width="982">
    <form action="[{ $oViewConf->getSelfActionLink() }]" method="post">
    [{ $oViewConf->getHiddenSid() }]
    <input type="hidden" name="cl" value="[{ $oViewConf->getActiveClassName() }]">
    <input type="hidden" name="fnc" value="saveProjectData">
      <tbody><tr>
        <td width="298" height="30" class="flies">
          <label>
          <select name="azdata[azjobs__azprojectid]">
          	<option value=""> -- Projekt ausw&auml;hlen -- </option>
          	[{foreach from=$oView->getProjects() item=oProject}]
	    		<option value="[{$oProject->azprojects__oxid->value}]" [{if $actProject == $oProject->azprojects__oxid->value}]selected[{/if}]>[{$oProject->azprojects__aztitle->value}]</option>
	    	[{/foreach}]
          </select>
		  </label>        </td>
        <td class="flies" width="188"><strong>Oder neues Projekt anlegen:</strong></td>
        <td width="472"><label>
          <input name="newproject" id="2" size="40" type="text">&nbsp;<strong>Stundensatz:</strong>&nbsp;<input name="newprojectpriceperhour" id="2" size="5" type="text">&nbsp;&euro;
        </label></td>
      </tr>
    </tbody></table>
      <br>
      <table class="rahmen" border="1" cellpadding="4" cellspacing="0" 
width="982">
        <tbody><tr>
          [{if $oView->getUsers()}]
          <td class="flies" bgcolor="#dedede" width="129"><strong>Mitarbeiter</strong></td>
          [{/if}]
          <td class="flies" bgcolor="#dedede" width="127"><strong>Datum</strong></td>
          <td class="flies" bgcolor="#dedede" width="142"><strong>Zeitaufwand</strong></td>
          <td class="flies" bgcolor="#dedede" width="249"><strong>Bemerkung</strong></td>
          <td class="flies" bgcolor="#dedede" width="283"><strong>Bemerkung
 intern</strong></td>
        </tr>
        <tr>
          [{if $oView->getUsers()}]
          <td class="flies" align="left" bgcolor="#ffffff" valign="top" height="15">
          	<select name="azdata[azjobs__azmaid]" size="0" class="flies" id="12422">
              [{foreach from=$aUsers item=oUser}]
    			<option value="[{$oUser->getId()}]" [{if $oUser->getId() == $azActUser}]selected[{elseif $oxcmp_user->oxuser__oxid->value == $oUser->getId()}]selected[{/if}]>[{$oUser->oxuser__oxfname->value}] [{$oUser->oxuser__oxlname->value}]</option>
    		  [{/foreach}]
            </select>
          </td>
          [{/if}]
          <td class="flies" align="left" bgcolor="#ffffff" valign="top">
          	<select name="azdata[azjobs__azdate]">
    			[{foreach from=$oView->getPastDays() item=oDay}]
    				<option value="[{$oDay->ts}]">[{$oDay->string}]</option>
    			[{/foreach}]
    		</select>          
    	  </td>
          <td class="flies" align="left" bgcolor="#ffffff" valign="top">
          	<select name="azdata[azjobs__aztimereal]">
    			[{foreach from=$oView->getTimeSteps() item=step}]
    				<option value="[{$step}]">[{$step}]</option>
    			[{/foreach}]
    		</select>          
    	  </td>
          <td class="flies" align="left" bgcolor="#ffffff" valign="top"><textarea name="azdata[azjobs__azremark]" cols="50" rows="8"></textarea></td>
          <td class="flies" align="left" bgcolor="#ffffff" valign="top"><textarea name="azdata[azjobs__azremarkinternal]" cols="50" rows="8"></textarea></td>
        </tr>
        
    </tbody></table>    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><table bgcolor="#f2f2f2" border="0" cellpadding="4" 
cellspacing="0" width="982">
      <tbody><tr>
        <td valign="middle" width="298" height="15">
        	[{if $aUsers}]
    			<input type="checkbox" name="azdata[azjobs__azbilled]" value="1">&nbsp;abgerechnet
    		[{/if}]
        </td>
        <td class="flies"><label></label></td>
        </tr>
      <tr>
        <td bgcolor="#ffffff" valign="middle" height="30"><table 
bgcolor="#f2f2f2" border="0" cellpadding="0" cellspacing="0" width="200">

          <tbody><tr>
            <td bgcolor="#ffffff" valign="middle" width="200" 
height="30"><label>
              <input name="button2" id="button2" value="Eintragen" 
type="submit">
            </label></td>
          </tr>
        </tbody></table></td>
        <td class="flies" bgcolor="#ffffff">&nbsp;</td>
      </tr>
    </tbody></table></td>
  </tr>
  </form>
  <tr>
    <td class="flies">&nbsp;</td>
  </tr>
</tbody></table>
[{include file="azprojectsfooter.tpl" }]