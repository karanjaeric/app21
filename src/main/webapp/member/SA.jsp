<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container-fluid section">
				<h3 class="text-center main-title">
					<i class="glyphicon glyphicon-user"></i>&nbsp;&nbsp;MY STATEMENT OF ACCOUNT
				</h3>
				<form class="form-inline" role="form" id="sa-form">					
						<div class="form-group col-md-6">
							<label for="asAt" class="control-label">As At:</label> <input type="text" readonly="readonly" name="asAt"
								class="form-control datepicker" id="asAt"
								placeholder="As At">
						</div>
						<div class="col-md-6">
							<button class="btn btn-primary btn-sm">SHOW STATEMENT</button>
						</div>
				</form>
				<input type="hidden" id="reportPath" value="${ settings.xiReportPath }" />
				<input type="hidden" id="xiRootPath" value="${ settings.xiPath }" />
				<input type="hidden" id="username" value="${ settings.xiReportUsername }" />
				<input type="hidden" id="password" value="${ settings.xiReportPassword }" />
				<input type="hidden" id="scheme_id" value="${ scheme_id } "/>
				<input type="hidden" id="member_id" value="${ member_id }" />
				<p>&nbsp;</p>
				<div class="col-md-12" id="sa-results">
					
				</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		
		$('.datepicker').datepicker({format: 'dd-mm-yyyy'});
		$('#asAt')
        .datepicker({
            format: 'dd-mm-yyyy'
        })
        .on('changeDate', function(e) {
		    $(this).datepicker('hide');
            // Revalidate the date field
            $('#sa-form').bootstrapValidator('revalidateField', 'asAt');
        });
		$('#sa-form').bootstrapValidator({
	        message: 'This value is not valid',
	        feedbackIcons: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields: {
	            asAt: {
	                validators: {
	                    notEmpty: {
	                        message: 'Please select the ending date'
	                    }
	                }
	            }
	        }
		}).on('success.form.bv', function(e) {
			start_wait();
			$.ajax({
		        url: $('#base_url').val() + 'member',
		        type: 'post',
		        data: {ACTION:'AP', date: $('#asAt').val()},
		        dataType: 'json',
		        success: function(json) {
		            if(json.success)
	   	            {
		            	var url = $('#reportPath').val() + 'members/ETL Member Statement.xdo?_xpf=~_xpt=0&_xdo=%2F~weblogic%2Ffundmaster%2Freports%2Fmembers%2FETL%20Member%20Statement.xdo&_xmode=3&_xt=ETL%20Member%20Statement%20(Tier%202)&_xf=analyze&_xana=view&_paramsBASE=' + $('#xiRootPath').val() + 'Xi&_paramsmember_id=' + $('#member_id').val() + '&_paramsscheme_id=' + $('#scheme_id').val() + '&_paramsadmin=1&_paramsap_id=' + json.accountingPeriodId + '&_paramsadmin=1&id=' + $('#username').val() + '&passwd=' + $('#password').val() + '';
		   			 $("#sa-results").html('<object width="100%" height="700px" data="' + url + '"/>');
			            stop_wait();
	   	            }
		            else
		            {
			            stop_wait();
		            }
		        }
			});
		});
	});
</script>