<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="includes/partial/admin_header.jsp" />
<input type="hidden" id="switch_to" value="admin"/>
<input type="hidden" id="minimum" value="${ policy.length }" />
<input type="hidden" id="lowercase" value="${ policy.lowercase }" />
<input type="hidden" id="uppercase" value="${ policy.uppercase }" />
<input type="hidden" id="numbers" value="${ policy.numbers }" />
<div class="container-fluid navigation-bar">
	<div class="container-fluid">
		<div class="col-md-2">
			<div id="sidebar-left">
				<h2 class="text-center">
					<small>MAIN MENU</small>
				</h2>
				<ul id="main-menu" class="nav">
					<li id="member-dashboard-li" class="active"><a href="javascript:void(0);"><i
							class="glyphicon glyphicon-dashboard"></i>&nbsp;<i
							class="fa fa-chevron-right"></i> DASHBOARD</a></li>
					<li id="personal-information-li"><a href="javascript:void(0);" ><i
							class="glyphicon glyphicon-user"></i>&nbsp;<i
							class="fa fa-chevron-right"></i> PERSONAL INFORMATION</a></li>
					<li id="contribution-history-li"><a href="javascript:void(0);"><i
							class="glyphicon glyphicon-record"></i>&nbsp;<i
							class="fa fa-chevron-right"></i> CONTRIBUTION HISTORY</a></li>
					<li id="balances-history-li"><a href="javascript:void(0);"><i
							class="glyphicon glyphicon-list"></i>&nbsp;<i
							class="fa fa-chevron-right"></i> BALANCES HISTORY</a></li>
					<li id="statement-of-account-li"><a href="javascript:void(0);"><i
							class="glyphicon glyphicon-user"></i>&nbsp;<i
							class="fa fa-chevron-right"></i> STATEMENT OF ACCOUNT</a></li>
					<li id="benefits-projection-li"><a href="javascript:void(0);"><i
							class="glyphicon glyphicon-equalizer"></i>&nbsp;<i
							class="fa fa-chevron-right"></i> BENEFITS PROJECTION</a></li>
					<li id="what-if-analysis-li"><a href="javascript:void(0);"><i
							class="glyphicon glyphicon-equalizer"></i>&nbsp;<i
							class="fa fa-chevron-right"></i> WHAT IF ANALYSIS</a></li>
					<li id="media-files-li"><a href="javascript:void(0);"><i
							class="glyphicon glyphicon-briefcase"></i>&nbsp;<i
							class="fa fa-chevron-right"></i> MEDIA &amp; FILES</a></li>
				</ul>
			</div>
		</div>

		<!--/span-->
		<div class="col-md-7" id="dashboard">
			<jsp:include page="member/dashboard.jsp" />
		</div>
		<div class="col-md-3">
			<div class="sidebar-right section">
				<c:if test="${ isManager }">					
					<button class="btn btn-danger btn-block" id="switch_profile">SWITCH TO MANAGERIAL PROFILE</button>
				</c:if>
				<h2><small>Active Scheme</small></h2>
				<select class="form-control" name="scheme_id" id="scheme_id">
					<c:forEach var="scheme" items="${ schemes }">
							<option value="${scheme.id }">${ scheme.name }</option>
					</c:forEach>	
				</select>
			</div>
			<p>&nbsp;</p>
			<div class="sidebar-right section text-center">
				<h3 class="text-center">
					<small><i
							class="glyphicon glyphicon-comment"></i>&nbsp;QUICK CONTACT</small>
				</h3>
							<button class="btn btn-primary btn-block" id="send-email-btn">SEND US AN EMAIL</button>
			</div>
			<p>&nbsp;</p>
			<div class="sidebar-right section">
				<h3 class="text-center">
					<small><i
							class="glyphicon glyphicon-align-justify"></i>&nbsp;RECENT ACTIVITY</small>
							
				</h3>
				<div class="list-group">
                     <c:forEach var="log" items="${ activityLogs }">
	                      <a href="#" class="list-group-item">
	                          <i class="fa fa-comment fa-fw"></i> ${ log.description }
	                          <span class="pull-right text-muted small"><em>${ log.datetime }</em>
	                          </span>
	                      </a>
                     </c:forEach>
               </div>
			</div>
		</div>
	</div>
</div>
<hr>
<footer>
	<p>&copy; Copyright 2015. All Rights Reserved. ${ company.name }.</p>
</footer>
<!-- SEND EMAIL -->
<div class="modal fade" id="modal-send-email" tabindex="-1" role="dialog" aria-labelledby="myModalLabelSendEmail" aria-hidden="true">
		<form role="form" id="form-send-email">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabelSendEmail">
							<i class="glyphicon glyphicon-envelope"></i>&nbsp;&nbsp;DROP US AN EMAIL
						</h4>
					</div>
					<div class="modal-body">
						<input type="hidden" name="ACTION" id="ACTION" value="EMAIL" />
						<div class="form-group">
							 <label class="control-label" for="subject">Category:</label>
							 <select class="form-control" name="category" id="category">
							 	<c:forEach var="reason" items="${ contactReasons }">
							 		<option>${ reason.name }</option>
							 	</c:forEach>
							 </select>
						</div>
						<div class="form-group">
							 <label class="control-label" for="subject">Subject:</label>
							 <input type="text" class="form-control" name="subject" id="subject"/>
						</div>
						<div class="form-group">
							 <label class="control-label" for="message">Message:</label>
							 <textarea name="message" id="message" class="form-control"></textarea>
						</div>
						<div class="form-group">
							 <label class="control-label" for="attachment">Attachment:</label>
							 <input type="file" id="attachment" name="attachment" />
						</div>
					</div>
					<div class="modal-footer">
						<a href="#" class="btn btn-warning" data-dismiss="modal">Cancel</a>
						<input class="btn btn-primary" type="submit"
							value="Send Email" id="btn-email">
					</div>
				</div>
			</div>
		</form>
	</div>
<!--/.fluid-container-->
<jsp:include page="includes/partial/admin_footer.jsp" />