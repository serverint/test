<div class="nav-head">
	<div class="logo">
		<a href="./dashboard"><img src="resources/images/dash_logo.png" alt=""></a>
	</div>
	<div class="logo-small">
		<a href="./dashboard"><img src="resources/images/dash_logo.png" alt=""></a>
	</div>
	<div class="notification-panel clearfix">

		<a href="#menu-toggle" class="button_toggle btn-menu" id="menu-toggle"><i
			class="fa  fa-reorder"></i></a>

		<div class="notes pull-right">
			<div class="input-group  ">
				<ul>
					<li><a data-toggle="dropdown" class="dropdown-toggle" href="#"
						aria-expanded="false"> <img alt="User Image"
							class="user-image img-circle" src="resources/images/user.jpg">
							<span class="hidden-xs">${sessionScope.adminUserModel.firstName}
								${sessionScope.adminUserModel.middleName}
								${sessionScope.adminUserModel.lastName}</span><span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="./edit-profile">Edit Profile</a></li>
							<li><a href="./change-password">Change Password</a></li>
							<li><a href="./logout">Log Out</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</div>
</div>