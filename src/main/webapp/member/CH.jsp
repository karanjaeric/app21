<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container-fluid section">
				<h3 class="text-center main-title">
					<i class="glyphicon glyphicon-user"></i>&nbsp;&nbsp;CONTRIBUTION HISTORY
				</h3>
				<form class="form-inline" role="form" id="ch-form">
					<div class="form-group col-md-4">
							<label for="dateFrom" class="control-label">
							Date From:
							</label> <input type="text" readonly="readonly" name="dateFrom"
								class="form-control datepicker" id="dateFrom"
								placeholder="Date From">
					</div>
					<div class="form-group col-md-4">
							<label for="dateTo" class="control-label">
							Date To:
							</label> <input type="text" readonly="readonly" name="dateTo"
								class="form-control datepicker" id="dateTo"
								placeholder="Date To">
					</div>
					<div class="col-md-4">
							<button class="btn btn-primary">
								SHOW HISTORY
							</button>
					</div>
				</form>
				<input type="hidden" id="reportPath" value="${ settings.xiReportPath }" />
				<input type="hidden" id="xiRootPath" value="${ settings.xiPath }" />
				<input type="hidden" id="username" value="${ settings.xiReportUsername }" />
				<input type="hidden" id="password" value="${ settings.xiReportPassword }" />
				<input type="hidden" id="scheme_id" value="${ scheme_id }"/>
				<input type="hidden" id="member_id" value="${ member_id }" />
				<p>&nbsp;</p>
				<div class="col-md-12" id="ch-results">
					
				</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#dateFrom').on('changeDate', function(ev){
		    $(this).datepicker('hide');
		});
		$('.datepicker').datepicker({format: 'dd-mm-yyyy'});
		$('#dateTo')
        .datepicker({
            format: 'dd-mm-yyyy'
        })
        .on('changeDate', function(e) {
		    $(this).datepicker('hide');
            // Revalidate the date field
            $('#ch-form').bootstrapValidator('revalidateField', 'dateTo');
        });
		$('#ch-form').bootstrapValidator({
	        message: 'This value is not valid',
	        feedbackIcons: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields: {
	            dateTo: {
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
		        data: {ACTION:'AP', date: $('#dateTo').val()},
		        dataType: 'json',
		        success: function(json) {
		            if(json.success)
	   	            {
						var url = $('#reportPath').val() + 'members/contributionHistoryDated.xdo?&_paramsBASE=' + $('#xiRootPath').val() + 'Xi&_xpf=&_xpt=0&_xdo=%2F~weblogic%2Ffundmaster%2Freports%2Fmembers%2FcontributionHistoryDated.xdo&_xmode=3&_paramsscheme_id=' + $('#scheme_id').val() + '&_paramsmember_id=' + $('#member_id').val() + '&_xt=Contribution%20History%20(Detailed)&_xf=analyze&_xana=view&_paramsap_id=81&admin=3347&_paramsadmin=3347&id=' + $('#username').val() + '&passwd=' + $('#password').val() + '';
						 $("#ch-results").html('<object width="100%" height="700px" data="' + url + '"/>');
						 stop_wait();
	   	            }
		        }
			});
		});
	});
</script>