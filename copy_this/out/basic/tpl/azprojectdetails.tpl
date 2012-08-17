[{include file="azprojectsheader.tpl" title=$template_title location="START_TITLE"|oxmultilangassign isStart=true}]
<script>
function delItem(id)
{
	if(confirm('Eintrag wirklich löschen?')) {
		oForm = document.getElementById('edit');
		oForm.jobid.value = id;
		oForm.fnc.value = "delJob";
		oForm.submit();
	}
}

function billItem(id)
{
	if(confirm('Eintrag abrechnen?')) {
		oForm = document.getElementById('edit');
		oForm.jobid.value = id;
		oForm.fnc.value = "billJob";
		oForm.submit();
	}
}
</script>
<form name="edit" id="edit" action="[{ $oViewConf->getSelfActionLink() }]" method="post">
[{ $oViewConf->getHiddenSid() }]
<input type="hidden" name="cl" value="[{ $oViewConf->getActiveClassName() }]">
<input type="hidden" name="fnc" value="">
<input type="hidden" name="azbilled" value="[{$azbilled}]">
<input type="hidden" name="projectid" value="[{$projectid}]">
<input type="hidden" name="jobid" value="">
</form>
<form name="jobs" action="[{ $oViewConf->getSelfActionLink() }]" method="post">
[{ $oViewConf->getHiddenSid() }]
<input type="hidden" name="cl" value="[{ $oViewConf->getActiveClassName() }]">
<input type="hidden" name="fnc" value="getAverage">
<table align="center" border="0" cellpadding="0" cellspacing="0" width="982">
  <tbody>
  <tr>
    <td valign="top"><table class="rahmen" border="1" cellpadding="4" cellspacing="0" width="982">
      <tbody><tr>
        <td class="flies" bgcolor="#dedede" width="100"><strong>Projekt</strong></td>
        <td class="flies" bgcolor="#dedede" width="77"><strong>Datum</strong></td>
        <td class="flies" bgcolor="#dedede" width="29"><strong>Zeit real</strong></td>
        <td class="flies" bgcolor="#dedede" width="83"><strong>Zeit abrechenbar</strong></td>
        <td class="flies" bgcolor="#dedede" width="300"><strong>Bemerkung</strong></td>
        <td class="flies" bgcolor="#dedede" width="300"><strong>Bemerkung intern</strong></td>
        <td class="flies" bgcolor="#dedede" width="29"><strong>Edit</strong></td>
        <td class="flies" bgcolor="#dedede" width="48"><strong>n. abr.bar</strong></td>
        <td class="flies" bgcolor="#dedede" width="37"><strong>abgerechnet</strong></td>
      </tr>
      [{foreach from=$aJobs item=oJob}]
      <tr [{if $oJob->billed}]style="background-color:#cccccc;"[{/if}]>
        <td valign="top">[{$oJob->title}]</td>
		<td valign="top">[{$oJob->date}]</td>
		<td valign="top" style="text-align:right;">[{$oJob->timeReal}]</td>
		<td valign="top" style="text-align:right;">[{$oJob->timeBill}]</td>
		<td valign="top">[{$oJob->remark}]</td>
		<td valign="top">[{$oJob->remarkInt}]</td>
		<td valign="top"><a href="[{$oViewConf->getSelfLink()|cat:"cl=azeditjob&jobid="|cat:$oJob->id|cat:"&projectid="|cat:$oJob->projectid }]">Edit</a></td>
		<td valign="top"><a href="javascript:delItem('[{$oJob->id}]');">Delete</a></td>
		<td valign="top"><a href="javascript:billItem('[{$oJob->id}]');">Bill</a></td>
      </tr>
      [{/foreach}]
    </tbody></table>
      <br></td>
  </tr>
  <tr>
    <td class="flies"><p>&nbsp;</p>
    </td>
  </tr>
  
</tbody></table>
[{include file="azprojectsfooter.tpl" }]