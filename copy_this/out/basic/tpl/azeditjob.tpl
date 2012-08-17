[{include file="azprojectsheader.tpl" title=$template_title location="START_TITLE"|oxmultilangassign isStart=true}]

<div>
<form name="jobs" action="[{ $oViewConf->getSelfActionLink() }]" method="post">
[{ $oViewConf->getHiddenSid() }]
<input type="hidden" name="cl" value="azeditjob">
<input type="hidden" name="fnc" value="saveJob">
<input type="hidden" name="jobid" value="[{$oJob->getId()}]">
<table style="border:1px solid #666666;" cellpadding="2" cellspacing="2">
    	<tr>
    		<td colspan="5"><h2>Projekt: [{$oJob->projectname}]</h2></td>
    	</tr>
		<tr>
    		[{if $aUsers}]
    			<td style="font-weight:bold;border:1px solid #666666;">Mitarbeiter</td>
    		[{/if}]
    		<td style="font-weight:bold;border:1px solid #666666;">Datum</td>
    		<td style="font-weight:bold;border:1px solid #666666;">Zeitaufwand</td>
    		<td style="font-weight:bold;border:1px solid #666666;">Bemerkung</td>
    		<td style="font-weight:bold;border:1px solid #666666;">Bemerkung intern</td>
    	</tr>
    	<tr>
    		<td valign="top" style="border:1px solid #666666;">
    			<select name="azdata[azdate]">
    				[{foreach from=$oView->getPastDays() item=oDay}]
    					<option value="[{$oDay->ts}]" [{if $oJob->dateTs == $oDay->ts}]selected[{/if}]>[{$oDay->string}]</option>
    				[{/foreach}]
    			</select>
    		</td>
    		<td valign="top" style="text-align:right;border:1px solid #666666;">
    			<select name="azdata[azjobs__aztimereal]">
    				[{foreach from=$oView->getTimeSteps() item=step}]
    					<option value="[{$step}]" [{if $step == $oJob->azjobs__aztimereal->value}]selected[{/if}]>[{$step}]</option>
    				[{/foreach}]
    			</select>
    		
    		</td>
    		<td valign="top" style="border:1px solid #666666;"><textarea name="azdata[azjobs__azremark]" cols="60" rows="8">[{$oJob->azjobs__azremark->value}]</textarea></td>
    		<td valign="top" style="border:1px solid #666666;"><textarea name="azdata[azjobs__azremarkinternal]" cols="60" rows="8">[{$oJob->azjobs__azremarkinternal->value}]</textarea></td>
    	</tr>
    	<tr>
    		<td colspan="5"><input type="submit" value="speichern"></td>
    	</tr>
    </table>
</form>
</div>


[{include file="azprojectsfooter.tpl" }]