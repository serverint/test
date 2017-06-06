<title>Happening Details</title>
<%@ include file="cms-header.jsp"%>
<!---------- top navigation start -------->
<%@ include file="cms-navigation-header.jsp"%>
<!---------- top navigation end -------->
<!-- Sidebar -->
<!---------- left menu start -------->
<%@ include file="cms-menu.jsp"%>
<!---------- left menu end -------->
<!-- DataTables -->

<link rel="stylesheet" href="resources/css/dataTables.bootstrap.css" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="resources/css/table.css">
<!-- DataTables -->
<script src="resources/js/datatables/jquery.dataTables.min.js"></script>
<script src="resources/js/datatables/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/jquery-ui.min.js"></script>
<script src="resources/js/common.js"></script>
<script src="resources/js/sidebar_menu.js"></script>
<script type="text/javascript"
	src="resources/js/dataTableCustom/dataTableCustom.js"></script>

<script src="resources/js/happening/happening.js"></script>

<!-- Page Content -->
<div id="page-content-wrapper">
	<div class="container-fluid">
		<div class="main-body clearfix">
			<div class="cont-top">
				<h1>Update What's Happening</h1>
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary clearfix">
							<!-- /.box-header -->
							<div class="box-body">
								<form action="edit-happening" id="edit-happening-form"
									method="post" enctype="multipart/form-data">
									<div class="form-group">
										<label> Title : <span class="mandatory-astric-color">*</span><span class="mandatory-msg">(max 50 characters)</span></label> <input type="text"
											name="title" id="title" value="${happeningModel.title}"
											class="form-control" maxlength="50">
									</div>
									<input type="hidden" name="happeningId" value="${happeningModel.happeningId}"/>
									<div class="form-group">
										<label> Description: </label>

										<textarea name="description" id="description"
											class="form-control" rows="3" cols="3">${happeningModel.description}</textarea>
									</div>
									<%-- <div class="form-group">
										<label>Happening Content: </label>

										<textarea name="content" id="content" class="form-control"
											rows="3" cols="3">${happeningModel.content}</textarea>
									</div> --%>
									
									<div class="form-group">
										<label>Select Status: <span class="mandatory-astric-color">*</span></label> 
										<select class="form-control" name="status" id="status">
											<option value="">Select</option>
												<c:forEach items="${statusValues}" var="eStatus">
													<option value="${eStatus }" ${happeningModel.status == eStatus ? 'selected': ''}>${eStatus}</option>
												</c:forEach>
										</select>
									</div>
									
									<div class="form-group">
									<label>Content: </label>
											<textarea  name="content" id="content">${happeningModel.content}</textarea>
									</div>
									
									<div class="form-group">
										<label for="exampleInputFile">Images: </label>
										<div class="col-lg-12" style="margin-bottom: 30px;">
											<c:choose>
												<c:when
													test="${not empty happeningModel.happeningImageModels}">
													<c:forEach items="${happeningModel.happeningImageModels}"
														var="data">
														<c:if test="${data.status == 'ACTIVE'}">
														<script type="text/javascript">
														imageChecking = "ImageAvailable";
														
														</script>
														   
															<div class="col-lg-2" style="margin-bottom: 15px;">
																<img
																	src="image-draw?imageName=${data.imageName}&fileType=image&viewType=view&imageType=happeningImages"
																	width="150px" height="100px" /> <a onclick="return deleteIcon();"
																	href="delete-happening-image?happeningId=${happeningModel.happeningId}&happeningImageId=${data.happeningImageId}&happeningImageName=${data.imageName}"
																	><i class="fa fa-trash-o"></i></a>
															</div>
														</c:if>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<td colspan="5" align="center">No Image Found</td>
												</c:otherwise>
											</c:choose>
										</div>
										<div class="form-group">
											<label for="exampleInputFile">Upload Image: </label>
											<div >
												 <input type="file" class="upload"
													id="imageName" name="imageName" multiple >
											</div>

											<p class="help-block">jpeg, jpg, png, gif image only</p>
										</div>
									</div>
									<div class="clear-fix" style="margin-bottom: 30px;"></div>
									<div class="box-footer">
										<button class="btn btn-primary">Update</button>
										<a href="list-happening" class="btn btn-primary">Back </a>
									</div>
								</form>
							</div>
							<!-- /.box-body -->
						</div>
					</div>
				</div>
			</div>
			
						<script>
/**
 * use to load cke editor
 */
	initSample();	
	
	
	function deleteIcon(){
		if (confirm("Are you sure?") == true){
			
			return true;
		}
		
	 return false;
	}
	
</script>
			
		</div>
	</div>
</div>
<!-- DataTables -->
<%@ include file="cms-footer.jsp"%>

