[{include file="azprojectsheader.tpl" title=$template_title location="START_TITLE"|oxmultilangassign isStart=true}]
<form name="rlogin" action="[{ $oViewConf->getSslSelfLink() }]" method="post">
[{ $oViewConf->getHiddenSid() }]
[{$_login_additional_form_parameters}]
<input type="hidden" name="fnc" value="login_noredirect">
<input type="hidden" name="cl" value="[{ $oViewConf->getActiveClassName() }]">
<input type="hidden" name="tpl" value="[{$_login_tpl}]">
<table>
<tr>
    <td>
    <table border="0" cellpadding="0" cellspacing="0" width="900">
      <tbody><tr>
        <td width="185" height="70">&nbsp;</td>
        <td valign="bottom" width="709"><span class="Stil5">PROJEKTERFASSUNG</span></td>
      </tr>
    </tbody>
    </table>
    <span class="Stil9"><br></span></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>
    <table bgcolor="#f2f2f2" border="0" cellpadding="4" cellspacing="0" width="982">
      <tbody><tr>
        <td class="flies" align="left" bgcolor="#ffffff" width="350" height="30">
        	<div align="left"><img src="[{$oViewConf->getImageUrl()}]mitte.jpg" width="231" height="219"></div>
        </td>
        <td bgcolor="#ffffff" width="735">
        	<table border="0" cellpadding="0" cellspacing="0" width="400">
          	<tbody>
          	[{if !$oxcmp_user->oxuser__oxpassword->value}]
          	<tr>
            	<td height="60"><span class="Stil10">ANMELDUNG</span></td>
          	</tr>
          	<tr>
          		<td>
		          	[{foreach from=$Errors.dyn_cmp_login_right item=oEr key=key }]
					  <p class="err">[{ $oEr->getOxMessage()}]</p>
					[{/foreach}]
				</td>
			</tr>
          	<tr>
            	<td height="50"><span class="Stil11">Hier Bitte einloggen</span></td>
          	</tr>
          	<tr>
            	<td height="35"><table border="0" cellpadding="4" cellspacing="0" width="383">
              	<tbody>
              	<tr>
                	<td valign="middle" width="101"><label></label>
                		<div align="left"><span class="Stil12">Login: </span></div>
                	</td>
                <td class="flies" align="right" width="266">
                  <div align="left">
                    <input name="lgn_usr" id="2" size="30" type="text">
                    </div></td>
              </tr>
            </tbody></table></td>
          </tr>
          <tr>
            <td height="35"><table border="0" cellpadding="4" cellspacing="0" width="384">
              <tbody><tr>
                <td valign="middle" width="100"><label>
                  </label><div align="left"><span class="Stil12">Passwort: </span></div>
                </td>
                <td class="flies" width="268">
                  <div align="left">
                    <input name="lgn_pwd" id="22" size="30" type="password">
                  </div>
                </td>
              </tr>
            </tbody></table></td>
          </tr>
          <tr>
            <td valign="bottom" height="45"><table border="0" cellpadding="4" cellspacing="0" width="384">
              <tbody><tr>
                <td valign="middle" width="167"><div align="left"><span class="flies  Stil14">Eingeloggt bleiben</span></div></td>
                <td class="flies  Stil14" width="201"><input name="checkbox2" id="checkbox2" type="checkbox"></td>
              </tr>
            </tbody></table></td>
          </tr>
          <tr>
          	<td><input type="submit" value="einloggen"></td>
          </tr>
          [{else}]
          <tr>
          	<td><span class="flies  Stil14">Sie sind eingeloggt als:<br><br>[{$oxcmp_user->oxuser__oxfname->value}] [{$oxcmp_user->oxuser__oxlname->value}]</span><br><br></td>
          </tr>
          <tr>
          	<td>
          		<form action="[{ $oViewConf->getSelfActionLink() }]" method="post">
		        <div class="form">
		          [{ $oViewConf->getHiddenSid() }]
		          [{$_login_additional_form_parameters}]
		          <input type="hidden" name="fnc" value="logout">
		          <input type="hidden" name="redirect" value="1">
		          <input type="hidden" name="cl" value="[{ $oViewConf->getActiveClassName() }]">
		          <input type="hidden" name="lang" value="[{ $oViewConf->getActLanguageId() }]">
		          <input type="hidden" name="pgNr" value="[{$_login_pgnr-1}]">
		          <input type="hidden" name="tpl" value="[{$_login_tpl}]">
		          [{if $oView->getProduct()}]
		              [{assign var="product" value=$oView->getProduct() }]
		              <input type="hidden" name="anid" value="[{ $product->oxarticles__oxnid->value }]">
		          [{/if}]
		          [{if $oViewConf->getShowListmania() && $oView->getActiveRecommList()}]
		              [{assign var="actvrecommlist" value=$oView->getActiveRecommList() }]
		            <input type="hidden" name="recommid" value="[{ $actvrecommlist->oxrecommlists__oxid->value }]">
		          [{/if}]
		
		              <span class="btn"><input id="test_RightLogout" type="submit" name="send" value="[{ oxmultilang ident="INC_CMP_LOGIN_RIGHT_LOGOUT" }]" class="btn"></span>
		        </div>
		      </form>
          	</td>
          </tr>
          [{/if}]
        </tbody></table>          <label></label></td>
      </tr>
    </tbody></table>
    <br></td>
  </tr>
</table>
</form>
[{include file="azprojectsfooter.tpl" }]