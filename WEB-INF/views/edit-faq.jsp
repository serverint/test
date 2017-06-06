<title>FAQ</title>
<!---------- header start -------->
<%@ include file="cms-header.jsp"%>
<!---------- header start -------->

<!---------- top navigation start -------->
<%@ include file="cms-navigation-header.jsp"%>
<!---------- top navigation end -------->

<!-- Sidebar -->
<!---------- left menu start -------->
<%@ include file="cms-menu.jsp"%>
<!---------- left menu end -------->
<!-- sidebar -->
<script src="resources/js/common.js"></script>
<script src="resources/js/sidebar_menu.js"></script>
<script src="resources/js/faq/faq.js"></script>
<!-- Page Content -->
<div id="page-content-wrapper">
	<div class="container-fluid">
		<div class="main-body clearfix">
			<div class="cont-top">
				<h1>Edit FAQ</h1>
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">
							<!-- /.box-header -->
							<div class="box-body">
							<form action="edit-faq" id="edit-faq-form" method="post">
								
								<div class="form-group">
										<label>Question: <span class="mandatory-astric-color">*</span></label>
										<textarea name="question" id="question"
											placeholder="Enter question" class="form-control">${faqModel.question}</textarea>
									</div>
									<div class="form-group">
										<label>Answer: <span class="mandatory-astric-color">*</span></label>
										<textarea name="answer" id="answer" placeholder="Enter answer"
											class="form-control">${faqModel.answer}</textarea>
									</div>
									
									<div class="form-group">
										<label>Select Status: <span class="mandatory-astric-color">*</span></label> 
										<select class="form-control"
											name="status" id="status">
											<option value="">Select</option>
											
											<c:forEach items="${statusDetails}" var="eStatus">

												<option value="${eStatus}"
													<c:out value="${faqModel.status == eStatus ? 'selected': ''}"/>><c:out
														value="${eStatus}" /></option>
											</c:forEach>
											
										</select>
									</div>
									
									<div class="box-footer">
										<input type="hidden" name="id" id="id" value="${faqModel.id}">
										<button class="btn btn-primary" type="submit">Submit</button>
									</div>
								</form>
							</div>
							<!-- /.box-body -->
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
<%@ include file="cms-footer.jsp"%>