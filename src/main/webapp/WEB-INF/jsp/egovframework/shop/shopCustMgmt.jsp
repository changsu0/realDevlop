<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : egovSampleList.jsp
  * @Description : Sample List 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2009.02.01            최초 생성
  *
  * author 실행환경 개발팀
  * since 2009.02.01
  *
  * Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Title</title>

    <%-- <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/> --%>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-core/5.8.34/browser.js"></script>
	<script src="/js/common.js"></script>




    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="/assets/images/favicon.png">

    <!-- Bootstrap Core CSS -->
    <link href="/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="/css/style.css" rel="stylesheet">
    <!-- You can change the theme colors from here -->
    <link href="/css/colors/blue.css" id="theme" rel="stylesheet">

    <!-- <script src="ES6_03.js"></script> -->
</head>




<body class="fix-header card-no-border fix-sidebar">
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" /> </svg>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <header class="topbar">
            <nav class="navbar top-navbar navbar-expand-md navbar-light">
                <!-- ============================================================== -->
                <!-- Logo -->
                <!-- ============================================================== -->
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.html">
                        <!-- Logo icon -->
                        <b>
                            <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                            <!-- Dark Logo icon -->
                            <img src="/assets/images/logo-icon.png" alt="homepage" class="dark-logo" />
                            <!-- Light Logo icon -->
                            <img src="/assets/images/logo-light-icon.png" alt="homepage" class="light-logo" />
                        </b>
                        <!--End Logo icon -->
                        <!-- Logo text -->
                        <span>
                        <!-- dark Logo text -->
                        <img src="/assets/images/logo-text.png" alt="homepage" class="dark-logo" />
                        <!-- Light Logo text -->
                        <img src="/assets/images/logo-light-text.png" class="light-logo" alt="homepage" /></span> </a>
                </div>
                <!-- ============================================================== -->
                <!-- End Logo -->
                <!-- ============================================================== -->
                <div class="navbar-collapse">
                    <!-- ============================================================== -->
                    <!-- toggle and nav items -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav mr-auto mt-md-0 ">
                        <!-- This is  -->
                        <li class="nav-item"> <a class="nav-link nav-toggler hidden-md-up text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="ti-menu"></i></a> </li>
                        <li class="nav-item"> <a class="nav-link sidebartoggler hidden-sm-down text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="icon-arrow-left-circle"></i></a> </li>
                    </ul>
                    <!-- ============================================================== -->
                    <!-- User profile and search -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav my-lg-0">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="/assets/images/users/1.jpg" alt="user" class="profile-pic" /></a>
                            <div class="dropdown-menu dropdown-menu-right animated flipInY">
                                <ul class="dropdown-user">
                                    <li>
                                        <div class="dw-user-box">
                                            <div class="u-img"><img src="/assets/images/users/1.jpg" alt="user"></div>
                                            <div class="u-text">
                                                <h4>Steave Jobs</h4>
                                                <p class="text-muted">varun@gmail.com</p><a href="profile.html" class="btn btn-rounded btn-danger btn-sm">View Profile</a></div>
                                        </div>
                                    </li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="#"><i class="ti-user"></i> My Profile</a></li>
                                    <li><a href="#"><i class="ti-wallet"></i> My Balance</a></li>
                                    <li><a href="#"><i class="ti-email"></i> Inbox</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="#"><i class="ti-settings"></i> Account Setting</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="#"><i class="fa fa-power-off"></i> Logout</a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <aside class="left-sidebar">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        <li class="nav-small-cap">PERSONAL</li>
                        <li>
                            <a class="has-arrow" href="#" aria-expanded="false"><i class="mdi mdi-gauge"></i><span class="hide-menu">Shop&Shop <span class="label label-rounded label-success">2</span></span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href="/shop/shopUserMgmt.do">사용자관리</a></li>
                                <li><a href="/shop/shopCustMgmt.do">사용자별 업장관리</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
                <!-- End Sidebar navigation -->
            </div>
        </aside>
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-6 col-8 align-self-center">
                        <h3 class="text-themecolor mb-0 mt-0">Shop Customer Mgmt</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                            <li class="breadcrumb-item active">Shop Customer Mgmt</li>
                        </ol>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card card-outline-info">
                            <div class="card-header">
                                <h4 class="mb-0 text-white">조회조건</h4>
                            </div>
                            <div class="card-body">
                                <form id="frmSearch">
                                    <div class="form-body">
                                        <div class="row pt-3">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">First Name</label>
                                                    <input type="text" id="" name="col1" class="form-control" placeholder="Col1">
												</div>
                                            </div>
                                            <!--
                                            <div class="col-md-6">
                                                <div class="form-group has-success">
                                                    <label class="control-label">Gender</label>
                                                    <select class="form-control custom-select">
                                                        <option value="">Male</option>
                                                        <option value="">Female</option>
                                                    </select>
                                                    <small class="form-control-feedback"> Select your gender </small> </div>
                                            </div>
                                             -->
                                        </div>
                                    </div>
                                    <div class="form-actions">
                                        <button type="button" class="btn btn-info" id="btnClick">
                                        	<i class="fa fa-check"></i> Search
                                        </button>
                                        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#responsive-modal">
                                        	<i class="fa fa-check"></i> Regist
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <!-- sample modal content -->
                    <div id="responsive-modal" class="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">Add Customer</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                </div>
                                <div class="modal-body">
                                    <form id="frmRegist">
                                        <div class="form-group">
                                            <label for="businessNo" class="control-label">Business No</label>
                                            <select class="form-control custom-select" id="businessNo" name="businessNo">
                                                <c:forEach var="item" items="${businessList}" varStatus="status">
												<option value="${item.businessNo}">${item.businessNo}</option>
												</c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="shopCd" class="control-label">Shop Cd</label>
                                            <input type="text" class="form-control" id="shopCd" name="shopCd">
                                        </div>
                                        <div class="form-group">
                                            <label for="shopNm" class="control-label">Shop NM</label>
                                            <input type="text" class="form-control" id="shopNm" name="shopNm">
                                        </div>
                                        <div class="form-group">
                                            <label for="ownerNm" class="control-label">Owner NM</label>
                                            <input type="text" class="form-control" id="ownerNm" name="ownerNm">
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default waves-effect" data-dismiss="modal" id="btnSaveClose">Close</button>
                                    <button type="button" class="btn btn-danger waves-effect waves-light" id="btnSave">Save User</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- sample modal content -->


                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Shop Customer Mgmt</h4>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead class="bg-primary text-white">
                                            <tr>
                                                <th>#</th>
                                                <th>Business No</th>
                                                <th>Shop Cd</th>
                                                <th>Shop Nm</th>
                                                <th>Owner Nm</th>
                                            </tr>
                                        </thead>
                                        <tbody id="primaryTbody">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <footer class="footer">
                © 2019 Monster Admin by wrappixel.com
            </footer>
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->



<!-- <script type="text/babel"> -->
<script type="text/javascript">
	$( document ).ready(function() {
		getShopCustList();

		$('#btnClick').click(function(){
			getShopCustList();
		});

		$('#btnSave').click(function(){
			insertShopCust();
		});
	});


	let getShopCustList = function(){
		_ajaxCall('/shop/selectShopCustList.ajax', $('#frmSearch').serialize(), cb_shopCustList);
	};

	let cb_shopCustList = function(data){
		let shopCustList = data.shopCustList;

		let innerHtml = '';
		shopCustList.forEach((item, index) => {
			innerHtml += '<tr>';
			innerHtml += '<td>' + Number(index+1) + '</td>';
			innerHtml += '<td>' + item.businessNo + '</td>';
			innerHtml += '<td>' + item.shopCd + '</td>';
			innerHtml += '<td>' + item.shopNm+ '</td>';
			innerHtml += '<td>' + item.ownerNm+ '</td>';
			innerHtml += '</tr>';
		});
		$('#primaryTbody').html(innerHtml);
	};

	let insertShopCust = function(){
		_ajaxCall('/shop/insertShopCust.ajax', $('#frmRegist').serialize(), cb_insertShopCust);
	};

	let cb_insertShopCust = function(data){
		let insertCnt = data.insertShopCust;

		alert('저장완료 : ' + insertCnt + '건');

		 $('#frmRegist input[type=text]').val('');

		$('#btnSaveClose').click();
		getShopCustList();
	};

</script>























    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="/assets/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="/assets/plugins/bootstrap/js/popper.min.js"></script>
    <script src="/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="/js/jquery.slimscroll.js"></script>
    <!--Wave Effects -->
    <script src="/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="/js/sidebarmenu.js"></script>
    <!--stickey kit -->
    <script src="/assets/plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>
    <!--Custom JavaScript -->
    <script src="/js/custom.min.js"></script>
    <!-- ============================================================== -->
    <!-- Style switcher -->
    <!-- ============================================================== -->
    <script src="/assets/plugins/styleswitcher/jQuery.style.switcher.js"></script>
</body>
</html>
