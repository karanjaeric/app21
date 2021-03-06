<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container-fluid section">
		<div class="col-md-4">
		<h3>
			<i class="glyphicon glyphicon-gift"></i>&nbsp;&nbsp;BENEFIT PAYMENTS
		</h3>		
		</div>
		<div class="col-md-8" align="right">
		<br/>
			<form class="form-inline" id="form-search">
				<input type="text" class="form-control datepicker" placeholder="Date From" readonly="readonly" name="dateFrom" id="dateFrom" value="${ dateFrom }"/>
				<input type="text" class="form-control datepicker" placeholder="Date To" readonly="readonly" name="dateTo" id="dateTo" value="${ dateTo}" />
				<button class="btn btn-info">Search</button>
			</form>
		</div>
		<table class="table table-responsive table-striped" id="search-results">
			<tr><th>DATE APPROVED</th><th>DATE OF PROCESSING</th><th>TYPE</th><th>PAYEE</th><th class="right">GROSS</th><th class="right">TAX FREE</th><th class="right">TAXABLE AMOUNT</th><th class="right">WITHHOLDING TAX</th><th class="right">NET</th></tr>
			<c:forEach var="payment" items="${payments}">
			<tr><td>${ payment.dateApproved }</td><td>${ payment.dateOfCalc }</td><td>${ payment.type }</td><td>${ payment.payee }</td><td class="right">${ payment.gross }</td><td class="right">${ payment.taxFree }</td><td class="right">${ payment.taxable }</td><td class="right">${payment.withHolding }</td><td class="right">${ payment.net }</td></tr>
			</c:forEach>
		</table>
	  <ul class="pagination pull-right">
		 <c:if test="${ batch > 1 }">
		 	<li><a href="javascript:void(0);" onclick="load_dashboard(${ page > per_page ? page - per_page : page }, ${ batch - 1 })">&laquo;</a></li>
		 </c:if>
		 <c:forEach begin="${ begin }" end="${ pages > (begin + (per_page - 1)) ? (begin + (per_page - 1)) : pages }" varStatus="loop">
		  <c:choose>
		  	<c:when test="${ page == loop.index }">
		  		<li class="active"><a href="javascript:void(0);">${ loop.index }</a></li>
		  	</c:when>
		  	<c:otherwise>
		  		<li><a href="javascript:void(0);" onclick="load_dashboard(${ loop.index }, ${ batch })">${ loop.index }</a></li>
		  	</c:otherwise>
		  </c:choose>
		</c:forEach>
		<c:if test="${ pages > begin + (per_page - 1)}">
			<li><a href="javascript:void(0);" onclick="load_dashboard(${ pages < page + per_page ? pages : page + per_page }, ${ batch + 1 })">&raquo;</a></li>
		</c:if>
	</ul>
</div>
<script type="text/javascript">
	
	function load_dashboard(page, batch)
	{
		start_wait();
		$.ajax({
	        url: $('#base_url').val() + 'dashboard',
	        type: 'get',
	        data: {dashboard: 'PAYMENT', page: page, batch: batch, from: $('#dateFrom').val(), to: $('#dateTo').val()},
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
	$(document).ready(function(){
		$('.datepicker').datepicker({format: 'dd-mm-yyyy'});

		$('#dateFrom').on('changeDate', function(ev){
		    $(this).datepicker('hide');
		});
		$('#dateTo').on('changeDate', function(ev){
		    $(this).datepicker('hide');
		});
		$('#form-search').bootstrapValidator({
	        message: 'This value is not valid',
	        feedbackIcons: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields: {
	           
	        }
		})
		.on('success.form.bv', function(e) {


            if($('#dateFrom').val() != '' && $('#dateTo').val() != '')
            {
	            // Prevent form submission
	            e.preventDefault();
				load_dashboard(1, 0);
            }
		});
	});
</script>