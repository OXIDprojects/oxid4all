[{include file="azprojectsheader.tpl" title=$template_title location="START_TITLE"|oxmultilangassign isStart=true}]
<table align="center" border="0" cellpadding="0" cellspacing="0" width="982">
  <tbody>
  <tr>
    <td><br>
      <span class="Stil1"><strong>PROJEKTERFASSUNG</strong> - <span class="Stil2">Auswertung</span></span></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><table bgcolor="#f2f2f2" border="0" cellpadding="4" cellspacing="0" width="982">
      <tbody>
      <form name="jobs" action="[{ $oViewConf->getSelfActionLink() }]" method="post">
		[{ $oViewConf->getHiddenSid() }]
		<input type="hidden" name="cl" value="[{ $oViewConf->getActiveClassName() }]">
		<input type="hidden" name="fnc" value="getAverage">
      <tr>
        <td class="flies" width="393" height="30"><label></label>       
 
            <strong>Durchschnittliche abrechenbare Stundenzahl im Monat:</strong></td>
        <td width="565"><label>
        <select name="statmonth" onchange="this.form.submit();">
				<option value=""> ---- </option>
				[{foreach from=$oView->getLastMonths() item=month}]
					<option value="[{$month}]" [{if $statmonth == $month}]selected[{/if}]>[{$month}]</option>
				[{/foreach}]
			</select>
        </label></td>
      </tr>

    </tbody></table>
      <table class="rahmen" border="1" cellpadding="4" cellspacing="0" width="982">
        <tbody>
        <tr>
          <td style="background-color:#dedede;" height="15">Name</td>
          <td style="text-align:right; background-color:#dedede;">Zeit real gesamt</td>
          <td style="text-align:right; background-color:#dedede;">Zeit abrechenbar gesamt</td>
          <td style="text-align:right; background-color:#dedede;">&#216; Std. pro Tag real</td>
          <td style="text-align:right; background-color:#dedede;">&#216; Std. pro Tag abrechenbar</td>
        </tr>
        [{foreach from=$aStats item=oStat}]
        <tr style="background-color: [{cycle values="#ffffff, #f2f2f2"}];">
			<td>[{$oStat->name}]</td>
			<td style="text-align:right; ;">[{$oStat->timeRealAll}]</td>
			<td style="text-align:right;">[{$oStat->timeBillAll}]</td>
			<td style="text-align:right;">[{$oStat->avTimeRealPerDay}]</td>
			<td style="text-align:right;">[{$oStat->avTimeBillPerDay}]</td>
		</tr>
		[{/foreach}]
      </tbody></table>
      </form>
      <br>
      
      <table class="rahmen" border="1" cellpadding="4" cellspacing="0" width="982">
        <tbody>
        <form name="maprojects" action="[{ $oViewConf->getSelfActionLink() }]" method="post">
		[{ $oViewConf->getHiddenSid() }]
		<input type="hidden" name="cl" value="[{ $oViewConf->getActiveClassName() }]">
		<input type="hidden" name="fnc" value="getProjectDataByMa">
        
        <tr>
          <td colspan="2" class="flies" bgcolor="#f2f2f2"><strong>Stunden pro Projekt pro MA im Monat</strong></td>
          <td class="flies" bgcolor="#f2f2f2"><table border="0" cellpadding="4" cellspacing="0" width="100%">
            <tbody><tr>
              <td class="flies" width="161" height="30"><label>
                <select name="statmonthprojects">
					<option value=""> -- Monat -- </option>
					[{foreach from=$oView->getLastMonths() item=month}]
						<option value="[{$month}]" [{if $statmonthprojects == $month}]selected[{/if}]>[{$month}]</option>
					[{/foreach}]
				</select>
              </label></td>
              <td width="186"><label>
              <select name="statmonthprojectsma">
					<option value=""> -- Mitarbeiter -- </option>
					[{foreach from=$aMas item=ma	}]
						<option value="[{$ma->id}]" [{if $maId == $ma->id}]selected[{/if}]>[{$ma->name}]</option>
					[{/foreach}]
				</select>
              </label></td>
              <td width="130">&nbsp;</td>
              <td width="150">&nbsp;</td>
            </tr>
            <tr>
              <td class="flies" height="30"><table border="0" cellpadding="0" cellspacing="0" width="124">
                <tbody><tr>
                  <td valign="middle" width="24"><label>
                    <input type="radio" name="azbilled" value="0" [{if $azbilled == "0"}]checked[{/if}]>
                  </label></td>
                  <td class="flies" width="100"><label>Nur offene</label></td>
                </tr>
              </tbody></table>                <label></label></td>
              <td><table border="0" cellpadding="0" cellspacing="0" width="158">
                <tbody><tr>
                  <td valign="middle" width="24"><label>
                  <input type="radio" name="azbilled" value="1" [{if $azbilled == "1"}]checked[{/if}]>
                  </label></td>
                  <td class="flies" width="134"><label>Nur abgerechnete</label></td>
                </tr>
              </tbody></table></td>
              <td><table border="0" cellpadding="0" cellspacing="0" width="107">
                <tbody><tr>
                  <td valign="middle" width="24"><label>
                    <input type="radio" name="azbilled" value="all" [{if $azbilled == "all"}]checked[{/if}]>
                  </label></td>
                  <td class="flies" width="83"><label>Alle</label></td>
                </tr>
              </tbody></table></td>
              <td><input name="button3" id="button3" value="Anzeigen" type="submit"></td>
            </tr>
            </form>
          </tbody></table></td>
        </tr>
        <tr>
          <td class="flies" bgcolor="#dedede" width="163"><strong>Projekt</strong></td>
          <td class="flies" bgcolor="#dedede" width="128"><strong>Zeit 
gesamt</strong></td>
          <td class="flies" bgcolor="#dedede" width="659"><strong>Kosten</strong></td>
        </tr>
        [{foreach from=$aProjects item=oProject}]
        <tr style="background-color: [{cycle values="#ffffff, #f2f2f2"}];">
          <td class="flies" align="left" valign="top" height="15"><a href="[{$oViewConf->getSelfLink()|cat:"cl=azprojectdetails&month="|cat:$statmonthprojects|cat:"&projectid="|cat:$oProject->id|cat:"&azbilled="|cat:$azbilled}]">[{$oProject->title}]</a></td>
          <td class="flies" align="left" valign="top">[{$oProject->hours}]</td>
          <td class="flies" align="left" valign="top">[{$oProject->fCost}]</td>
        </tr>
        [{/foreach}]
      </tbody></table>
      </td>
  </tr>
  
</tbody></table>
[{include file="azprojectsfooter.tpl" }]