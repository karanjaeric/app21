<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h2 class="text-center">
	<small>SETUP &amp; CONFIGURATION</small>
</h2>
	<ul class="nav">
		<c:if test="${ permissions.setup_company }">
		<li id="company-li"><a href="javascript:void(0);"><i
				class="glyphicon glyphicon-home"></i>&nbsp;<i
				class="fa fa-chevron-right"></i> COMPANY DETAILS</a></li>
		</c:if>
		<c:if test="${ permissions.setup_logo }">
		<li id="logo-li"><a href="javascript:void(0);"><i
				class="glyphicon glyphicon-picture"></i>&nbsp;<i
				class="fa fa-chevron-right"></i> LOGO</a></li>
		</c:if>
		<c:if test="${ permissions.setup_menu }">
		<li id="menu-li"><a href="javascript:void(0);"><i
				class="glyphicon glyphicon-pushpin"></i>&nbsp;<i
				class="fa fa-chevron-right"></i> MENU OPTIONS</a></li>
		</c:if>
		<c:if test="${ permissions.setup_social }">
		<li id="social-li"><a href="javascript:void(0);"><i
				class="glyphicon glyphicon-comment"></i>&nbsp;<i
				class="fa fa-chevron-right"></i> SOCIAL LINKS</a></li>
		</c:if>
		<c:if test="${ permissions.setup_theme }">
		<li id="theme-li"><a href="javascript:void(0);"><i
				class="glyphicon glyphicon-th-large"></i>&nbsp;<i
				class="fa fa-chevron-right"></i> THEME SETTINGS</a></li>
		</c:if>
		<c:if test="${ permissions.setup_banner }">
		<li id="banner-li"><a href="javascript:void(0);"><i
				class="glyphicon glyphicon-cog"></i>&nbsp;<i
				class="fa fa-chevron-right"></i> HOMEPAGE BANNER(S)</a></li>
		</c:if>
		<c:if test="${ permissions.setup_interest_rate }">
		<li id="interest-settings-li"><a href="javascript:void(0);"><i
			class="glyphicon glyphicon-user"></i>&nbsp;<i
			class="fa fa-chevron-right"></i> INTEREST RATE SETTINGS</a></li>
		</c:if>
		<c:if test="${ permissions.setup_other }">
		<li id="other-settings-li"><a href="javascript:void(0);"><i
				class="glyphicon glyphicon-cog"></i>&nbsp;<i
				class="fa fa-chevron-right"></i> OTHER SETTINGS</a></li>
		</c:if>
		<c:if test="${ permissions.setup_contact_reason }">
		<li id="contact-reasons-li"><a href="javascript:void(0);"><i
				class="glyphicon glyphicon-cog"></i>&nbsp;<i
				class="fa fa-chevron-right"></i> CONTACT REASONS</a></li>
		</c:if>
	</ul>
<!-- BANNERS -->
<div class="modal fade" id="modal-banner" tabindex="-1" role="dialog" aria-labelledby="myModalLabelBanner" aria-hidden="true">
		<form role="form" id="form-banner">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabelBanner">
							<i class="glyphicon glyphicon-picture"></i>&nbsp;&nbsp;MANAGE BANNERS
						</h4>
					</div>
					<div class="modal-body">
						<table class="table table-responsive">
						<tr><th>IMAGE</th><th>ACTION</th></tr>
						<c:forEach var="banner" items="${banners}">
						<tr><td><img src="<%=request.getContextPath()%>/static/images/banner/${ banner.name }" width="100" /></td><td><a class="btn btn-sm btn-danger" href="javascript:void(0);" onclick="remove_banner('${ banner.id}');"><i class="glyphicon glyphicon-trash"></i>&nbsp;REMOVE</a></td></tr>
						</c:forEach>
						</table>
						<input type="hidden" name="ACTION" id="ACTION" value="BANNER" />
						<div class="form-group">
							<label class="control-label">Select image (1280 X 550 preferably)</label>
							 <input type="file" class="filestyle" data-buttonName="btn-primary" id="banner_file" name="banner_file" data-buttonBefore="true" />
						</div>
					</div>
					<div class="modal-footer">
						<a href="#" class="btn btn-warning" data-dismiss="modal">Cancel</a>
						<input class="btn btn-primary" type="submit"
							value="Upload Banner" id="btn-banner">
					</div>
				</div>
			</div>
		</form>
	</div>
	
	<!-- SUPER ADMINISTRATOR LOGIN -->
<div class="modal fade" id="modal-authenticate" tabindex="-1" role="dialog" aria-labelledby="myModalLabelSULogin" aria-hidden="true">
		<form role="form" id="form-authenticate">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabelSULogin">
							<i class="glyphicon glyphicon-cog"></i>&nbsp;&nbsp;AUTHENTICATION REQUIRED
						</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							 <label class="control-label" for="fundmasterXi">Username:</label>
							 <input type="text" class="form-control" name="username" id="username"/>
						</div>
						<div class="form-group">
							 <label class="control-label" for="fundmasterXi">Password:</label>
							 <input type="password" class="form-control" name="password" id="password"/>
						</div>
					</div>
					<div class="modal-footer">
						<a href="#" class="btn btn-warning" data-dismiss="modal">Cancel</a>
						<input class="btn btn-primary" type="submit"
							value="Authenticate" id="btn-authenticate">
					</div>
				</div>
			</div>
		</form>
	</div>
		<!-- THEME SETTINGS -->
<div class="modal fade" id="modal-theme" tabindex="-1" role="dialog" aria-labelledby="myModalLabelTheme" aria-hidden="true">
		<form role="form" id="form-theme">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabelTheme">
							<i class="glyphicon glyphicon-th-large"></i>&nbsp;&nbsp;THEME SETTINGS
						</h4>
					</div>
					<div class="modal-body">
						<input type="hidden" name="theme_id" id="theme_id" value="${ theme.id }" />
						<input type="hidden" name="THEME_ACTION" id="THEME_ACTION" value="THEME" />
						<fieldset>
							<legend>Font Family</legend>
							<div class="form-group">
							 <label class="control-label" for="minor">Font Family:</label>							
							 <select name="font" id="font" class="form-control">
							 	<option>Open Sans</option>
							 	<option>Roboto</option>
							 	<option>Lato</option>
							 	<option>PT Sans</option>
							 	<option>Ubuntu</option>
							 	<option>Lato</option>
							 </select>
							</div>
						</fieldset>
						<fieldset>
							<legend>Corporate Colors</legend>
							<div class="form-group">
							 <label class="control-label" for="major">Major Color:</label>
							 <input type="text" class="form-control colorpicker" name="major" id="major" value="${ theme.major }"/>
							</div>
							<div class="form-group">
								 <label class="control-label" for="minor">Minor Color:</label>							
								 <input type="text" class="form-control colorpicker" name="minor" id="minor" value="${ theme.minor }"/>
							</div>
							<div class="form-group">
								 <label class="control-label" for="minor">Other Color:</label>							
								 <input type="text" class="form-control colorpicker" name="other" id="other" value="${ theme.other }"/>
							</div>
						</fieldset>
						<fieldset>
							<legend>Page Coloration</legend>
							<div class="form-group">
							 <label class="control-label" for="header">Header:</label>
							 <input type="text" class="form-control colorpicker" name="header" id="header" value="${ theme.header }"/>
							</div>
							<div class="form-group">
								 <label class="control-label" for="content">Content:</label>							
								 <input type="text" class="form-control colorpicker" name="content" id="content" value="${ theme.content }"/>
							</div>
							<div class="form-group">
								 <label class="control-label" for="footer">Footer:</label>							
								 <input type="text" class="form-control colorpicker" name="footer" id="footer" value="${ theme.footer }"/>
							</div>
						</fieldset>
					</div>
					<div class="modal-footer">
						<a href="#" class="btn btn-warning" data-dismiss="modal">Cancel</a>
						<input class="btn btn-primary" type="submit"
							value="Save Theme Settings" id="btn-theme">
					</div>
				</div>
			</div>
		</form>
	</div>
<!-- OTHER SETTINGS -->
<div class="modal fade" id="modal-other-settings" tabindex="-1" role="dialog" aria-labelledby="myModalLabelOther" aria-hidden="true">
		<form role="form" id="form-other-settings">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabelMenu">
							<i class="glyphicon glyphicon-cog"></i>&nbsp;&nbsp;OTHER SETTINGS
						</h4>
					</div>
					<div class="modal-body">
						<input type="hidden" name="setting_id" id="setting_id" value="${ settings.id }" />
						<div class="form-group">
							 <label class="control-label" for="fundmasterXi">Xi Root Path:</label>
							 <input type="text" class="form-control" name="fundmasterXi" id="fundmasterXi" value="${ settings.xiPath }"/>
						</div>
						<div class="form-group">
							 <label class="control-label" for="fundmasterXi">Xi Username:</label>
							 <input type="text" class="form-control" name="xiUsername" id="xiUsername" value="${ settings.username }"/>
						</div>
						<div class="form-group">
							 <label class="control-label" for="fundmasterXi">Xi Password:</label>
							 <input type="password" class="form-control" name="xiPassword" id="xiPassword" value="${ settings.password }"/>
						</div>
						<div class="form-group">
							 <label class="control-label" for="xiReportPath">Xi Reports Path:</label>
							 <input type="text" class="form-control" name="xiReportPath" id="xiReportPath" value="${ settings.xiReportPath}"/>
						</div>
						<div class="form-group">
							 <label class="control-label" for="xiReportPath">Xi Reports Username:</label>
							 <input type="text" class="form-control" name="xiReportUsername" id="xiReportUsername" value="${ settings.xiReportUsername}"/>
						</div>
						<div class="form-group">
							 <label class="control-label" for="xiReportPath">Xi Reports Password:</label>
							 <input type="password" class="form-control" name="xiReportPassword" id="xiReportPassword" value="${ settings.xiReportPassword }"/>
						</div>
						<div class="form-group">
							 <label class="control-label" for="portalBaseURL">Portal Base URL:</label>
							 <input type="text" class="form-control" name="portalBaseURL" id="portalBaseURL" value="${ settings.portalBaseURL}"/>
						</div>
						<div class="form-group">
							 <label class="control-label" for="memberOnboarding">Member Onboarding Process:</label>
							 <select name="memberOnboarding" id="memberOnboarding" class="form-control">
							 			<option value="FUNDMASTER" ${ settings.memberOnboarding == 'FUNDMASTER' ? 'selected="selected"' : '' }>DETAILS DIRECTLY POSTED TO FUNDMASTER</option>
							 			<option value="PORTAL" ${ settings.memberOnboarding == 'PORTAL' ? 'selected="selected"' : '' }>DETAILS POSTED TO PORTAL FIRST (FOR APPROVAL)</option>
							 			<option value="BOTH" ${ settings.memberOnboarding == 'BOTH' ? 'selected="selected"' : '' }>DETAILS POSTED TO BOTH PORTAL AND FUNDMASTER</option>
							 </select>
						</div>
						<div class="form-group">
							 <label class="control-label" for="sponsorOnboarding">Sponsor Onboarding Process:</label>
							 <select name="sponsorOnboarding" id="sponsorOnboarding" class="form-control">
							 			<option value="FUNDMASTER" ${ settings.memberOnboarding == 'FUNDMASTER' ? 'selected="selected"' : '' }>DETAILS DIRECTLY POSTED TO FUNDMASTER</option>
							 			<option value="PORTAL" ${ settings.memberOnboarding == 'PORTAL' ? 'selected="selected"' : '' }>DETAILS POSTED TO PORTAL FIRST (FOR APPROVAL)</option>
							 			<option value="BOTH" ${ settings.memberOnboarding == 'BOTH' ? 'selected="selected"' : '' }>DETAILS POSTED TO BOTH PORTAL AND FUNDMASTER</option>
							 </select>
						</div>
						<div class="form-group hide">
							 <label class="control-label" for="loginField">Encrypt Settings:</label>
							 <input type="checkbox" class="form-control" name="encrypt" id="encrypt" ${ settings.encrypt == 'TRUE' ? 'checked="checked"' : '' }/>
						</div>
						<div class="form-group hide">
							 <label class="control-label" for="loginField">UNIQUE LOGIN FIELD:</label>
							 <select name="loginField" id="loginField" class="form-control">
							 		<c:forEach var="ordinal" items="${ ordinals }">
							 			<option value="${ordinal.code }">${ ordinal.name }</option>
							 		</c:forEach>		 	
							 </select>
						</div>
					</div>
					<div class="modal-footer">
						<a href="#" class="btn btn-warning" data-dismiss="modal">Cancel</a>
						<input class="btn btn-primary" type="submit"
							value="Save Changes" id="btn-menu">
					</div>
				</div>
			</div>
		</form>
	</div>
<!-- INTEREST RATES CONFIGURATIONS -->
<div class="modal fade" id="modal-interest-rate-columns" tabindex="-1" role="dialog" aria-labelledby="myModalLabelIR" aria-hidden="true">
		<form role="form" id="form-interest-rate-columns">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabelIR">
							<i class="glyphicon glyphicon-pushpin"></i>&nbsp;&nbsp;INTEREST RATE COLUMN CONFIGURATION
						</h4>
					</div>
					<div class="modal-body">
						<input type="hidden" name="interestRateColumns_id" value="${ interestRateColumns.id }" id="interestRateColumns_id"/>
						<table class="table">
							<tr><th>COLUMN NAME</th><th>COLUMN TEXT</th><th>VISIBLE</th></tr>
							<tr>
							<td>
							 <label class="control-label">ACCOUNTING PERIOD</label>
							</td>
							<td>
							 <div class="form-group">
							 	<input type="text" name="accountingPeriodText" id="accountingPeriodText" value="${ interestRateColumns.accountingPeriodText }"/>
							 </div>
							</td>
							<td>
							 <input type="checkbox" name="accountingPeriod" id="accountingPeriod" ${interestRateColumns.accountingPeriod == 'TRUE' ? 'checked' : ''}/>
							</td>
							</tr>
							<tr>
							<td>
							 <label class="control-label">CONTRIBUTIONS</label>
							</td>
							<td>
							 <div class="form-group">
							 <input type="text" name="contributionsText" id="contributionsText"  value="${ interestRateColumns.contributionsText }"/>
							 </div>
							</td>
							<td>
							 <input type="checkbox" name="contributions" id="contributions"  ${interestRateColumns.contributions == 'TRUE' ? 'checked' : ''}/>
							</td>
							</tr>
							<tr>
							<td>
							 <label class="control-label">DATE DECLARED</label>
							</td>
							<td>
							 <div class="form-group">
							 <input type="text" name="dateDeclaredText" id="dateDeclaredText"  value="${ interestRateColumns.dateDeclaredText }"/>
							 </div>
							</td>
							<td>
							 <input type="checkbox" name="dateDeclared" id="dateDeclared"  ${interestRateColumns.dateDeclared == 'TRUE' ? 'checked' : ''}/>
							</td>
							</tr>
							<tr>
							<td>
							 <label class="control-label">OPENING BALANCES</label>
							</td>
							<td>
							 <div class="form-group">
							 <input type="text" name="openingBalancesText" id="openingBalancesText"  value="${ interestRateColumns.openingBalancesText }" />
							 </div>
							</td>
							<td>
							 <input type="checkbox" name="openingBalances" id="openingBalances" ${interestRateColumns.openingBalances == 'TRUE' ? 'checked' : ''}/>
							</td>
							</tr>
							<tr>
							<td>
							 <label class="control-label">PENSION DRAW DOWN</label>
							</td>
							<td>
							 <div class="form-group">
							 <input type="text" name="pensionDrawDownText" id="pensionDrawDownText"  value="${ interestRateColumns.pensionDrawDownText }" />
							 </div>
							</td>
							<td>
							 <input type="checkbox" name="pensionDrawDown" id="pensionDrawDown" ${interestRateColumns.pensionDrawDown == 'TRUE' ? 'checked' : ''}/>
							</td>
							</tr>
							<tr>
							<td>
							 <label class="control-label">YEAR</label>
							</td>
							<td>
							 <div class="form-group">
							 <input type="text" name="yearText" id="yearText"  value="${ interestRateColumns.yearText }" />
							 </div>
							</td>
							<td>
							 <input type="checkbox" name="year" id="year" ${interestRateColumns.year == 'TRUE' ? 'checked' : ''}/>
							</td>
							</tr>
						</table>
					</div>
					<div class="modal-footer">
						<a href="#" class="btn btn-warning" data-dismiss="modal">Cancel</a>
						<input class="btn btn-primary" type="submit"
							value="Save Changes" id="btn-interest-rate-columns">
					</div>
				</div>
			</div>
		</form>
	</div>
<!-- MENU ITEMS -->
<div class="modal fade" id="modal-menu" tabindex="-1" role="dialog" aria-labelledby="myModalLabelMenu" aria-hidden="true">
		<form role="form" id="form-menu">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabelMenu">
							<i class="glyphicon glyphicon-pushpin"></i>&nbsp;&nbsp;WEBSITE PORTAL MENU OPTIONS
						</h4>
					</div>
					<div class="modal-body">
						<input type="hidden" name="menu_id" value="${ menu.id }" id="menu_id"/>
						<table class="table">
							<tr><th>MENU ITEM</th><th>MENU TEXT</th><th>VISIBLE</th></tr>
							<tr>
							<td>
							 <label class="control-label">ANNUITY QUOTATION</label>
							</td>
							<td>
							 <input type="text" name="annuityQuotationName" id="annuityQuotationName" value="${ menu.annuityQuotationName }"/>
							</td>
							<td>
							 <input type="checkbox" name="annuityQuotationActive" id="annuityQuotationActive" ${menu.annuityQuotationActive == 'TRUE' ? 'checked' : ''}/>
							</td>
							</tr>
							<tr>
							<td>
							 <label class="control-label">INTEREST RATES</label>
							</td>
							<td>
							 <input type="text" name="interestRatesName" id="interestRatesName"  value="${ menu.interestRatesName }"/>
							</td>
							<td>
							 <input type="checkbox" name="interestRatesActive" id="interestRatesActive"  ${menu.interestRatesActive == 'TRUE' ? 'checked' : ''}/>
							</td>
							</tr>
							<tr>
							<td>
							 <label class="control-label">WHAT IF ANALYSIS</label>
							</td>
							<td>
							 <input type="text" name="whatIfAnalysisName" id="whatIfAnalysisName"  value="${ menu.whatIfAnalysisName }"/>
							</td>
							<td>
							 <input type="checkbox" name="whatIfAnalysisActive" id="whatIfAnalysisActive"  ${menu.whatIfAnalysisActive == 'TRUE' ? 'checked' : ''}/>
							</td>
							</tr>
							<tr>
							<td>
							 <label class="control-label">CONTACT US</label>
							</td>
							<td>
							 <input type="text" name="contactUsName" id="contactUsName"  value="${ menu.contactUsName }" />
							</td>
							<td>
							 <input type="checkbox" name="contactUsActive" id="contactUsActive" ${menu.contactUsActive == 'TRUE' ? 'checked' : ''}/>
							</td>
							</tr>
						</table>
					</div>
					<div class="modal-footer">
						<a href="#" class="btn btn-warning" data-dismiss="modal">Cancel</a>
						<input class="btn btn-primary" type="submit"
							value="Save Changes" id="btn-menu">
					</div>
				</div>
			</div>
		</form>
	</div>
<!-- LOGO -->
<div class="modal fade" id="modal-logo" tabindex="-1" role="dialog" aria-labelledby="myModalLabelLogo" aria-hidden="true">
		<form role="form" id="form-logo">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabelLogo">
							<i class="glyphicon glyphicon-picture"></i>&nbsp;&nbsp;UPLOAD LOGO
						</h4>
					</div>
					<div class="modal-body">
						<input type="hidden" name="ACTION" id="ACTION" value="LOGO" />
						<img src="static/images/${ settings.logoFile }" alt="logo" height="120" />
						<div class="form-group">
							 <input type="file" class="filestyle" data-buttonName="btn-primary" id="logo_file" name="logo_file" data-buttonBefore="true" />
						</div>
					</div>
					<div class="modal-footer">
						<a href="#" class="btn btn-warning" data-dismiss="modal">Cancel</a>
						<input class="btn btn-primary" type="submit"
							value="Upload Logo" id="btn-logo">
					</div>
				</div>
			</div>
		</form>
	</div>
<!-- SOCIAL MEDIA -->
	<div class="modal fade" id="modal-social" tabindex="-1" role="dialog" aria-labelledby="myModalLabelSocial" aria-hidden="true">
		<form role="form" id="form-social">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabelSocial">
							<i class="glyphicon glyphicon-comment"></i>&nbsp;&nbsp;SOCIAL MEDIA LINKS
						</h4>
					</div>
					<div class="modal-body">
						<input type="hidden" name="social_id" id="social_id" value="${ social.id }" />
						<div class="form-group">
							<label class="control-label" for="twitter">Twitter:</label>
							 <input type="text" class="form-control" id="twitter" name="twitter" placeholder="Twitter" value="${ social.twitter }">
						</div>
						<div class="form-group">
							<label class="control-label" for="facebook">Facebook:</label>
							<input type="text" class="form-control" id="facebook" name="facebook" placeholder="Facebook" value="${ social.facebook }">
						</div>
						<div class="form-group">
							<label class="control-label" for="linkedin">LinkedIn:</label>
							<input type="text" class="form-control"  id="linkedin" name="linkedin"placeholder="LinkedIn" value="${ social.linkedin }">
						</div>
						<div class="form-group">
							<label class="control-label" for="google">Google:</label>
							<input type="text" class="form-control" id="google" name="google" placeholder="Google" value="${ social.google }">
						</div>
						<div class="form-group">
							<label class="control-label" for="youtube">Youtube:</label>
							<input type="text" class="form-control"  id="youtube" name="youtube" placeholder="Youtube" value="${ social.youtube }">
						</div>
						<div class="form-group">
							<label class="control-label" for="pinterest">Pinterest:</label>
							<input type="text" class="form-control"  id="pinterest" name="pinterest" placeholder="Pinterest" value="${ social.pinterest }">
						</div>
					</div>
					<div class="modal-footer">
						<a href="#" class="btn btn-warning" data-dismiss="modal">Cancel</a>
						<input class="btn btn-primary" type="submit"
							value="Save Details" id="btn-social">
					</div>
				</div>
			</div>
		</form>
	</div>
	<!--  COMPANY DETAILS-->

	<div class="modal fade" id="modal-company" tabindex="-1" role="dialog" aria-labelledby="myModalLabelCompany" aria-hidden="true">
		<form role="form" id="form-company">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabelCompany">
							<i class="glyphicon glyphicon-home"></i>&nbsp;&nbsp;COMPANY DETAILS
						</h4>
					</div>
					<div class="modal-body">
						<input type="hidden" name="company_id" id="company_id" value="${company.id}" />
						<div class="form-group">
							<label class="control-label" for="companyName">Name:</label>
							 <input type="text" class="form-control" id="companyName" name="companyName" placeholder="Company Name" value="${company.name}">
						</div>
						<div class="form-group">
							<label class="control-label" for="streetAddress">Street Address:</label>
							<input type="text" class="form-control" id="streetAddress" name="streetAddress" placeholder="Street Address" value="${company.streetAddress}">
						</div>
						<div class="form-group">
							<label class="control-label" for="telephone">Telephone:</label>
							<input type="text" class="form-control"  id="telephone" name="telephone"placeholder="Telephone Number" value="${company.telephone}">
						</div>
						<div class="form-group">
							<label class="control-label" for="fax">Fax:</label>
							<input type="text" class="form-control" id="fax" name="fax" placeholder="Fax Number" value="${company.fax}">
						</div>
						<div class="form-group">
							<label class="control-label" for="email">Email:</label>
							<input type="text" class="form-control"  id="emailAddress" name="emailAddress" placeholder="Email Address" value="${company.email}">
						</div>
						<div class="form-group">
							<label class="control-label" for="email">Mailing Addresses:</label>
							<input type="text" class="form-control"  id="email" name="email" placeholder="List of mailing addresses (comma separated)" value="${company.emailAddress}">
						</div>
						<div class="form-group">
							<label class="control-label" for="city">Town/City:</label>
							<input type="text" class="form-control"  id="city" name="city" placeholder="Town/City" value="${company.city}">
						</div>
						<div class="form-group">
							<label for="country" class="control-label">Country:</label>
							<select
								name="country" id="country" class="form-control">
								<option value="">Select country...</option>
								<c:forEach var="country"  items="${countries}">
					                <option value="${country.id}" ${country.id == company.country.id ? 'selected="selected"' : ''}>
					                    ${country.name}
					                </option>
					            </c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label class="control-label" for="city">GeoLocation (Latitude,Longitude):</label>
							<input type="text" class="form-control"  id="geolocation" name="geolocation" placeholder="Geolocation (Latitude,Longitude)" value="${company.geolocation}">
						</div>
					</div>
					<div class="modal-footer">
						<a href="#" class="btn btn-warning" data-dismiss="modal">Cancel</a>
						<input class="btn btn-primary" type="submit"
							value="Save Details" id="btn-company">
					</div>
				</div>
			</div>
		</form>
	</div>
	
	<script type="text/javascript">


		function remove_banner(id)
		{
			bootbox.confirm("<p class=\"text-center\">You are about to remove a home page banner. Are you sure?</p>", function (result) {
				if(result)
				{
					 start_wait();
						$.ajax({
				            url: $('#base_url').val() + 'admin',
				            type: 'post',
				            data: {ACTION: 'REMOVE_BANNER', id: id},
				            dataType: 'json',
				            success: function(json) {
				                stop_wait();
				                bootbox.alert(json.message);
				            }
				        });
				}
			});
		}
		$(document).ready(function(){
			
		    $('#interest-settings-li').click(function(){
		        $('#modal-interest-rate-columns').modal('show');
		    });
		    
		    $('#company-li').click(function(){
		        $('#modal-company').modal('show');
		    });
		    
		    $('#social-li').click(function(){
		        $('#modal-social').modal('show');
		    });
		    
		    $('#logo-li').click(function(){
		        $('#modal-logo').modal('show');
		    });

			function load_dashboard(MODULE)
			{
		        start_wait();
				$.ajax({
		            url: $('#base_url').val() + 'dashboard',
		            type: 'get',
		            data: {dashboard: MODULE},
		            dataType: 'html',
		            success: function(html) {
		                $('#dashboard').fadeOut('slow', function() {
		                	$('#dashboard').html(html);
		                	$('#dashboard').fadeIn('slow');
		                	stop_wait();
		                });
		            }
		        });
			}
			
		    $('#theme-li').click(function(){
		        $('#modal-theme').modal('show');
		    });

		    $('#contact-reasons-li').click(function(){
		        load_dashboard('CONTACT_REASONS');
		    });

		    $('#banner-li').click(function(){
		        $('#modal-banner').modal('show');
		    });
		    
		    $('#other-settings-li').click(function(){
		        $('#modal-authenticate').modal('show');
		    });

		    $('#menu-li').click(function(){
		        $('#modal-menu').modal('show');
		    });

		    $('#form-authenticate').bootstrapValidator({
		        message: 'This value is not valid',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        fields: {
		            username: {
		                validators: {
		                    notEmpty: {
		                        message: 'Please enter your username'
		                    }
		                }
		            },
		            password: {
		                validators: {
		                    notEmpty: {
		                        message: 'Please enter your password'
		                    }
		                }
		            }
		        }
			})
		    .on('success.form.bv', function(e) {
		        // Prevent form submission
		        e.preventDefault();
		        // Get the form instance
		        var btn = "btn-authenticate";
		        var modal = "modal-authenticate";
		        var btn_text = $('#' + btn).val();
				$.ajax({
			        url: $('#base_url').val() + 'login',
			        type: 'post',
			        data: {username: $('#username').val(), password: $('#password').val()},
			        dataType: 'json',
			        success: function(json) {
			            var success = false;
			            $.each(json, function(key, value) {
			                if(key == 'success' && value == true)
		                	{
			                	success = true;
		                	}
			                if(key == 'message')
		                	{
			                	message = value;
		                	}
			            });
    	                $('#form-authenticate')[0].reset();
		                $('#' + modal).modal('hide');
			            $('#' + btn).val(btn_text);
			            if(success)
				            $('#modal-other-settings').modal('show');
			        }
			    });
		    });
		    
		    $('#form-menu').bootstrapValidator({
		        message: 'This value is not valid',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        fields: {
		            annuityQuotationName: {
		                validators: {
		                    notEmpty: {
		                        message: 'A title for the Annuity Quotation menu is required'
		                    }
		                }
		            },
		            interestRatesName: {
		                validators: {
		                    notEmpty: {
		                        message: 'A title for the Interest Rates menu is required'
		                    }
		                }
		            },
		            whatIfAnalaysisName: {
		                validators: {
		                    notEmpty: {
		                        message: 'A title for the What If Analysis menu is required'
		                    }
		                }
		            },
		            contactUsName: {
		                validators: {
		                    notEmpty: {
		                        message: 'A title for the Contact Us menu is required'
		                    }
		                }
		            }
		        }
			})
			.on('success.form.bv', function(e) {
                // Prevent form submission
                e.preventDefault();

                var btn = "btn-menu";
                var form = "form-menu";
                var modal = "modal-menu";
                var btn_text = $('#' + btn).val();

                $('#' + btn).val('Please wait...');
        		$.ajax({
        	        url: $('#base_url').val() + 'admin',
        	        type: 'post',
        	        data: {menu_id: $('#menu_id').val(), annuityQuotationName: $('#annuityQuotationName').val(), interestRatesName: $('#interestRatesName').val(), whatIfAnalysisName: $('#whatIfAnalysisName').val(), contactUsName: $('#contactUsName').val(), annuityQuotationActive: $('#annuityQuotationActive').prop('checked'), interestRatesActive: $('#interestRatesActive').prop('checked'), whatIfAnalysisActive: $('#whatIfAnalysisActive').prop('checked'), contactUsActive: $('#contactUsActive').prop('checked'), ACTION: 'MENU'},
        	        dataType: 'html',
        	        success: function(html) {
        	            $('#' + btn).val('Done');
        	            if(html == 'true')
        	            {
        	                $('#' + form)[0].reset();
        	                $('#' + modal).modal('hide');
        	                html = 'Menu settings successfully saved';
        	            }
        	            else
        	                html = 'Menu settings could not be saved';
        	            bootbox.alert(html);
        	            $('#' + btn).val(btn_text);
        	        }
        	    });

			});

		    $('#form-interest-rate-columns').bootstrapValidator({
		        message: 'This value is not valid',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        fields: {
		            accountingPeriodText: {
		                validators: {
		                    notEmpty: {
		                        message: 'A title for the accounting period is required'
		                    }
		                }
		            },
		            contributionsText: {
		                validators: {
		                    notEmpty: {
		                        message: 'A title for the contributions is required'
		                    }
		                }
		            },
		            dateDeclaredText: {
		                validators: {
		                    notEmpty: {
		                        message: 'A title for the date declared is required'
		                    }
		                }
		            },
		            openingBalancesText: {
		                validators: {
		                    notEmpty: {
		                        message: 'A title for the opening balances is required'
		                    }
		                }
		            },
		            pensionDrawDownText: {
		                validators: {
		                    notEmpty: {
		                        message: 'A title for the pension draw down column is required'
		                    }
		                }
		            },
		            yearText: {
		                validators: {
		                    notEmpty: {
		                        message: 'A title for the year column is required'
		                    }
		                }
		            }
		        }
			})
			.on('success.form.bv', function(e) {
                
                // Prevent form submission
                e.preventDefault();

                var btn = "btn-interest-rate-columns";
                var form = "form-interest-rate-columns";
                var modal = "modal-interest-rate-columns";
                var btn_text = $('#' + btn).val();

                $('#' + btn).val('Please wait...');
        		$.ajax({
        	        url: $('#base_url').val() + 'admin',
        	        type: 'post',
        	        data: {ACTION: 'INTEREST_RATE_COLUMNS', id: $('#interestRateColumns_id').val(),accountingPeriod: $('#accountingPeriod').prop('checked'), contributions: $('#contributions').prop('checked'), dateDeclared: $('#dateDeclared').prop('checked'), openingBalances: $('#openingBalances').prop('checked'), pensionDrawDown: $('#pensionDrawDown').prop('checked'), year: $('#year').prop('checked'), accountingPeriodText: $('#accountingPeriodText').val(), contributionsText: $('#contributionsText').val(), dateDeclaredText: $('#dateDeclaredText').val(), openingBalancesText: $('#openingBalancesText').val(), pensionDrawDownText: $('#pensionDrawDownText').val(), yearText: $('#yearText').val()},
        	        dataType: 'html',
        	        success: function(html) {
        	            $('#' + btn).val('Done');
        	            if(html == 'true')
        	            {
        	                $('#' + form)[0].reset();
        	                $('#' + modal).modal('hide');
        	                html = 'Interest Rate settings successfully saved';
        	            }
        	            else
        	                html = 'Interest Rate settings could not be saved';
        	            bootbox.alert(html);
        	            $('#' + btn).val(btn_text);
        	        }
        	    });

			});

		    $('#form-company').bootstrapValidator({
		        message: 'This value is not valid',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        fields: {
		            companyName: {
		                validators: {
		                    notEmpty: {
		                        message: 'Please enter the company name'
		                    }
		                }
		            },
		            streetAddress: {
		                validators: {
		                    notEmpty: {
		                        message: 'Please enter the street address'
		                    }
		                }
		            },
		            telephone: {
		                validators: {
		                    notEmpty: {
		                        message: 'Please enter the telephone contact'
		                    }
		                }
		            },
		            emailAddress: {
		                validators: {
		                    notEmpty: {
		                        message: 'Please enter the contact email address'
		                    }
		                }
		            },
		            email: {
		                validators: {
		                    notEmpty: {
		                        message: 'Please enter the mailing addresses'
		                    }
		                }
		            },
		            city: {
		                validators: {
		                    notEmpty: {
		                        message: 'Please enter the town/city name'
		                    }
		                }
		            },
		            country: {
		                validators: {
		                    notEmpty: {
		                        message: 'Please select the country'
		                    }
		                }
		            }
		        }
			})
			.on('success.form.bv', function(e) {
                
                // Prevent form submission
                e.preventDefault();

                var btn = "btn-company";
                var form = "form-company";
                var modal = "modal-company";

                $('#' + btn).val('Please wait...');
        		$.ajax({
        	        url: $('#base_url').val() + 'admin',
        	        type: 'post',
        	        data: {company_id: $('#company_id').val(), email: $('#email').val(), geolocation: $('#geolocation').val(), companyName: $('#companyName').val(), streetAddress: $('#streetAddress').val(), telephone: $('#telephone').val(), fax: $('#fax').val(), emailAddress: $('#emailAddress').val(), city: $('#city').val(), country: $('#country').val(), ACTION: 'COMPANY'},
        	        dataType: 'json',
        	        success: function(json) {
        	            var html = null;
        	            if(json.success)
        	            {
        	                $('#' + form)[0].reset();
        	                $('#' + modal).modal('hide');
        	                html = 'Company details successfully saved';
        	            }
        	            else
        	                html = 'Company details could not be saved';
        	            bootbox.alert(html);
        	        }
        	    });

			});
		    $('#form-theme').bootstrapValidator({
		        message: 'This value is not valid',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        fields: {
		            major: {
		                validators: {
		                    notEmpty: {
		                        message: 'You must have at least a major color'
		                    }
		                }
		            },
		            font: {
		                validators: {
		                    notEmpty: {
		                        message: 'Please select a font family'
		                    }
		                }
		            }
		        }
			})
			.on('success.form.bv', function(e) {
                
                // Prevent form submission
                e.preventDefault();

                var btn = "btn-theme";
                var form = "form-theme";
                var modal = "modal-theme";
                var btn_text = $('#' + btn).val();

                $('#' + btn).val('Please wait...');
        		$.ajax({
        	        url: $('#base_url').val() + 'admin',
        	        type: 'post',
        	        data: {ACTION: $('#THEME_ACTION').val(), theme_id: $('#theme_id').val(), major: $('#major').val(), minor: $('#minor').val(), font: $('#font').val(), other: $('#other').val(), header: $('#header').val(), content: $('#content').val(), footer: $('#footer').val()},
        	        dataType: 'html',
        	        success: function(html) {
        	            $('#' + btn).val('Done');
        	            if(html == 'true')
        	            {
        	                $('#' + form)[0].reset();
        	                $('#' + modal).modal('hide');
        	                html = 'Theme details successfully saved';
        	            }
        	            else
        	                html = 'Theme details could not be saved';
        	            bootbox.alert(html);
        	            $('#' + btn).val(btn_text);
        	        }
        	    });

			});
		    $('#form-social').bootstrapValidator({
		        message: 'This value is not valid',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        fields: {
		            facebook: {
		                validators: {
		                    notEmpty: {
		                        message: 'Please enter a facebook profile page'
		                    }
		                }
		            }
		        }
			})
			.on('success.form.bv', function(e) {
                
                // Prevent form submission
                e.preventDefault();

                var btn = "btn-social";
                var form = "form-social";
                var modal = "modal-social";
                var btn_text = $('#' + btn).val();

                $('#' + btn).val('Please wait...');
        		$.ajax({
        	        url: $('#base_url').val() + 'admin',
        	        type: 'post',
        	        data: {social_id: $('#social_id').val(), twitter: $('#twitter').val(), facebook: $('#facebook').val(), linkedin: $('#linkedin').val(), google: $('#google').val(), youtube: $('#youtube').val(), pinterest: $('#pinterest').val(), ACTION: 'SOCIAL'},
        	        dataType: 'html',
        	        success: function(html) {
        	            $('#' + btn).val('Done');
        	            if(html == 'true')
        	            {
        	                $('#' + form)[0].reset();
        	                $('#' + modal).modal('hide');
        	                html = 'Social details successfully saved';
        	            }
        	            else
        	                html = 'Social details could not be saved';
        	            bootbox.alert(html);
        	            $('#' + btn).val(btn_text);
        	        }
        	    });

			});
		    $('#form-other-settings').bootstrapValidator({
		        message: 'This value is not valid',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        fields: {
		            fundmasterXi: {
		                validators: {
		                    notEmpty: {
		                        message: 'Please enter the full path to Fundmaster Xi'
		                    }
		                }
		            },
		            xiUsername: {
		                validators: {
		                    notEmpty: {
		                        message: 'Please enter Xi\'s admininistrative username'
		                    }
		                }
		            },
		            portalBaseURL: {
		            	validators: {
		                    notEmpty: {
		                        message: 'Please enter the portal\'s base url'
		                    }
		                }		
			        },
		            xiPassword: {
		                validators: {
		                    notEmpty: {
		                        message: 'Please enter Xi\'s admininistrative password'
		                    }
		                }
		            },
		            loginField: {
		                validators: {
		                    notEmpty: {
		                        message: 'Please select the prefered login field (must be unique to every member)'
		                    }
		                }
		            }
		        }
			})
			.on('success.form.bv', function(e) {
                
                // Prevent form submission
                e.preventDefault();

                var btn = "btn-other-settings";
                var form = "form-other-settings";
                var modal = "modal-other-settings";
                var btn_text = $('#' + btn).val();

                $('#' + btn).val('Please wait...');
        		$.ajax({
        	        url: $('#base_url').val() + 'admin',
        	        type: 'post',
        	        data: {portalBaseURL: $('#portalBaseURL').val(), memberOnboarding: $('#memberOnboarding').val(), sponsorOnboarding: $('#sponsorOnboarding').val(), setting_id: $('#setting_id').val(), xiReportPath: $('#xiReportPath').val(), loginField: $('#loginField').val(), fundmasterXi: $('#fundmasterXi').val(), username: $('#xiUsername').val(), password: $('#xiPassword').val(), encrypt: $('#encrypt').prop('checked'), ACTION: 'SETTINGS', xiReportUsername: $('#xiReportUsername').val(), xiReportPassword: $('#xiReportPassword').val()},
        	        dataType: 'html',
        	        success: function(html) {
        	            $('#' + btn).val('Done');
        	            if(html == 'true')
        	            {
        	                $('#' + form)[0].reset();
        	                $('#' + modal).modal('hide');
        	                html = 'Settings successfully saved';
        	            }
        	            else
        	                html = 'Settings could not be saved';
        	            bootbox.alert(html);
        	            $('#' + btn).val(btn_text);
        	        }
        	    });

			});

		    $('#form-banner').bootstrapValidator({
		        message: 'This value is not valid',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        fields: {
		            logo_file: {

		            	extension: 'png,gif,jpg,jpeg',
		                type: 'image/png,image/gif,image/jpg,image/jpeg',
		                maxSize: 10*1024*1024,   // 10 MB
		                message: 'The selected file is not valid, it should be (png,gif,jpg,jpeg) and 5 MB at maximum.'

					}
		        }
			})
			.on('success.form.bv', function(e) {
                
                // Prevent form submission
                e.preventDefault();
                var btn = "btn-banner";
                var form = "form-banner";
                var modal = "modal-banner";
                var btn_text = $('#' + btn).val();

                $('#' + btn).val('Please wait...');

                var formData = new FormData($(this)[0]);
                
        		$.ajax({
        	        url: $('#base_url').val() + 'admin',
        	        type: 'POST',
        	        data: formData,
        	        async: false,
        	        success: function(html) {
        	            $('#' + btn).val('Done');
        	            if(html == 'true')
        	            {
        	                $('#' + form)[0].reset();
        	                $('#' + modal).modal('hide');
        	                html = 'Company banner successfully uploaded';
        	            }
        	            else
        	                html = 'Company banner was not uploaded';
        	            bootbox.alert(html);
        	            $('#' + btn).val(btn_text);
        	        },
        	        cache: false,
        	        contentType: false,
        	        processData: false
        	    });

			});
			
		    $('#form-logo').bootstrapValidator({
		        message: 'This value is not valid',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        fields: {
		            logo_file: {

		            	extension: 'png,gif,jpg,jpeg',
		                type: 'image/png,image/gif,image/jpg,image/jpeg',
		                maxSize: 5*1024*1024,   // 5 MB
		                message: 'The selected file is not valid, it should be (png,gif,jpg,jpeg) and 5 MB at maximum.'

					}
		        }
			})
			.on('success.form.bv', function(e) {
                
                // Prevent form submission
                e.preventDefault();
                var btn = "btn-logo";
                var form = "form-logo";
                var modal = "modal-logo";
                var btn_text = $('#' + btn).val();

                $('#' + btn).val('Please wait...');

                var formData = new FormData($(this)[0]);
                
        		$.ajax({
        	        url: $('#base_url').val() + 'admin',
        	        type: 'POST',
        	        data: formData,
        	        async: false,
        	        success: function(html) {
        	            $('#' + btn).val('Done');
        	            if(html == 'true')
        	            {
        	                $('#' + form)[0].reset();
        	                $('#' + modal).modal('hide');
        	                html = 'Company logo successfully uploaded';
        	            }
        	            else
        	                html = 'Company logo was not uploaded';
        	            bootbox.alert(html);
        	            $('#' + btn).val(btn_text);
        	        },
        	        cache: false,
        	        contentType: false,
        	        processData: false
        	    });

			});
		    
		    $('.colorpicker').colorpicker();
			
			});
		
	</script>