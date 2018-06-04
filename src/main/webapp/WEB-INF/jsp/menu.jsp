<%@  page language="Java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="app-aside hidden-xs bg-dark">
      <div class="aside-wrap">
        <div class="navi-wrap">
          <!-- user -->
          <div class="clearfix hidden-xs text-center hide" id="aside-user">
            <div class="dropdown wrapper">
              <a ui-sref="app.page.profile">
                <span class="thumb-lg w-auto-folded avatar m-t-sm">
                  <img src="public/libs/lib/img/a0.jpg" class="img-full" alt="...">
                </span>
              </a>
              <a href="#" data-toggle="dropdown" class="dropdown-toggle hidden-folded">
                <span class="clear">
                  <span class="block m-t-sm">
                    <strong class="font-bold text-lt">John.Smith</strong> 
                    <b class="caret"></b>
                  </span>
                  <span class="text-muted text-xs block">Art Director</span>
                </span>
              </a>
              <!-- dropdown -->
              <ul class="dropdown-menu animated fadeInRight w hidden-folded">
                <li class="wrapper b-b m-b-sm bg-info m-t-n-xs">
                  <span class="arrow top hidden-folded arrow-info"></span>
                  <div>
                    <p>300mb of 500mb used</p>
                  </div>
                  <progressbar value="60" type="white" class="progress-xs m-b-none dker"></progressbar>
                </li>
                <li>
                  <a href>Settings</a>
                </li>
                <li>
                  <a ui-sref="app.page.profile">Profile</a>
                </li>
                <li>
                  <a href>
                    <span class="badge bg-danger pull-right">3</span>
                    Notifications
                  </a>
                </li>
                <li class="divider"></li>
                <li>
                  <a ui-sref="access.signin">Logout</a>
                </li>
              </ul>
              <!-- / dropdown -->
            </div>
            <div class="line dk hidden-folded"></div>
          </div>
          <!-- / user -->



          <!-- nav -->
          <nav ui-nav class="navi"> 
           <!--菜单 menu --> 
            <ul class="nav">
              <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                <span translate="aside.nav.HEADER">后台管理</span>
              </li>
              <li>
                <a href class="auto">      
                  <span class="pull-right text-muted">
                    <i class="fa fa-fw fa-angle-right text"></i>
                    <i class="fa fa-fw fa-angle-down text-active"></i>
                  </span>
                  <i class="glyphicon glyphicon-stats icon text-primary-dker"></i>
                  <span class="font-bold" translate="aside.nav.DASHBOARD">基础数据</span>
                </a>
                <ul class="nav  nav-sub  dk">
                  <li class="nav-sub-header">
                    <a href>
                      <span translate="aside.nav.DASHBOARD">基础数据</span>
                    </a>
                  </li> 
                  <li ui-sref-active="active">
                    <a ui-sref="app.dashboard-v1"  onclick="menuClick('base/store/storeType',this)" >
                     <b class="label bg-info pull-right">仓储</b>
              			<span>仓库类别</span>                     
                    </a>
                  </li>
                  <li ui-sref-active="active">
                    <a ui-sref="app.dashboard-v2" onclick="menuClick('base/store/store',this)">
                      <b class="label bg-info pull-right">仓储</b>
                      <span>仓库列表</span>                    
                    </a>
                  </li>
                  <li ui-sref-active="active">
                    <a ui-sref="app.dashboard-v2" onclick="menuClick('base/store/shelf',this)">
                      <b class="label bg-info pull-right">仓储</b>
                      <span>库位管理 </span>                    
                    </a>
                  </li> 
                   <li ui-sref-active="active">
                    <a ui-sref="app.dashboard-v2" onclick="menuClick('',this)">
                      <b class="label bg-info pull-right">仓储</b>
                      <span>商品库位</span>                    
                    </a>
                  </li>  
                  <li ui-sref-active="active">
                    <a ui-sref="app.dashboard-v2" onclick="menuClick('base/store/staff',this)">
                      <b class="label bg-info pull-right">仓储</b>
                      <span>仓库员工分配</span>                    
                    </a>
                  </li>  
                  <li ui-sref-active="active">
                    <a ui-sref="app.dashboard-v2" onclick="menuClick('base/indent/expressCompany',this)">
                      <b class="label bg-primary pull-right">订单</b>
                      <span>快递公司</span>                    
                    </a>
                  </li>   
                  <li ui-sref-active="active">
                    <a ui-sref="app.dashboard-v2" onclick="menuClick('base/indent/shipping',this)">
                      <b class="label bg-primary pull-right">订单</b>
                      <span>配送方式</span>                    
                    </a>
                  </li>    
                  <li ui-sref-active="active">
                    <a ui-sref="app.dashboard-v2" onclick="menuClick('errorConfirmCode',this)">
                      <b class="label bg-primary pull-right">订单</b>
                      <span>扫描错误码</span>                    
                    </a>
                  </li>  
                  <li ui-sref-active="active">
                    <a ui-sref="app.dashboard-v2" onclick="menuClick('base/manuefacturer/supplierType',this)">
                      <b class="label bg-success pull-right">厂商</b>
                      <span>供应商分类</span>                    
                    </a>
                  </li>  
                  <li ui-sref-active="active">
                    <a ui-sref="app.dashboard-v2" onclick="menuClick('base/manuefacturer/supplier',this)">
                      <b class="label bg-success pull-right">厂商</b>
                      <span>供应商管理</span>                    
                    </a>
                  </li> 
                  <li ui-sref-active="active">
                    <a ui-sref="app.dashboard-v2" onclick="menuClick('base/business/recordType',this)">
                      <b class="label bg-danger pull-right">类型</b>
                      <span>业务类型</span>                    
                    </a>
                  </li>  
                </ul>
              </li>
               
              <li>
                <a href class="auto">
                  <span class="pull-right text-muted">
                    <i class="fa fa-fw fa-angle-right text"></i>
                    <i class="fa fa-fw fa-angle-down text-active"></i>
                  </span>
                  <i class="glyphicon glyphicon-th-large icon text-success"></i>
                  <span class="font-bold">商品管理</span>
                </a>
                <ul class="nav nav-sub dk">
                  <li class="nav-sub-header">
                    <a href>
                      <span>Apps</span>
                    </a>
                  </li>
                  <li ui-sref-active="active">
                    <a ui-sref="apps.note">
                      <span>Note</span>
                    </a>
                  </li>
                  <li ui-sref-active="active">
                    <a ui-sref="apps.contact">
                      <span>Contacts</span>
                    </a>
                  </li>
                  <li ui-sref-active="active">
                    <a ui-sref="app.weather">
                      <span>Weather</span>
                    </a>
                  </li>
                </ul>
              </li>

              <li class="line dk"></li>

              <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                <span translate="aside.nav.components.COMPONENTS">进销存</span>
              </li>
              <li>
                <a href class="auto">      
                  <span class="pull-right text-muted">
                    <i class="fa fa-fw fa-angle-right text"></i>
                    <i class="fa fa-fw fa-angle-down text-active"></i>
                  </span>
                  <b class="badge bg-info pull-right">3</b>
                  <i class="glyphicon glyphicon-th"></i>
                  <span>采购管理</span>
                </a>
                <ul class="nav nav-sub dk">
                  <li class="nav-sub-header">
                    <a href>
                      <span>采购管理</span>
                    </a>
                  </li>
                  <li ui-sref-active="active">
                    <a ui-sref="layout.app">
                      <span>Application</span>
                    </a>
                  </li>
                  <li ui-sref-active="active">
                    <a ui-sref="layout.fullwidth">
                      <span>Full width</span>
                    </a>
                  </li>
                  <li ui-sref-active="active">
                    <a ui-sref="layout.mobile">
                      <span>Mobile</span>
                    </a>
                  </li>      
                </ul>
              </li>
              <li ng-class="{active:$state.includes('app.ui')}">
                <a href class="auto">
                  <span class="pull-right text-muted">
                    <i class="fa fa-fw fa-angle-right text"></i>
                    <i class="fa fa-fw fa-angle-down text-active"></i>
                  </span>
                  <i class="glyphicon glyphicon-briefcase icon"></i>
                  <span translate="aside.nav.components.ui_kits.UI_KITS">库存管理</span>
                </a>
                <ul class="nav nav-sub dk">
                  <li class="nav-sub-header">
                    <a href>
                      <span translate="aside.nav.components.ui_kits.UI_KITS">库存管理</span>
                    </a>
                  </li>
                  <li ui-sref-active="active">
                    <a ui-sref="app.ui.buttons">
                      <span translate="aside.nav.components.ui_kits.BUTTONS">Buttons</span>
                    </a>
                  </li>
                  <li ui-sref-active="active">
                    <a ui-sref="app.ui.icons">
                      <b class="badge bg-info pull-right">3</b>
                      <span translate="aside.nav.components.ui_kits.ICONS">Icons</span>
                    </a>
                  </li>
                  <li ui-sref-active="active">
                    <a ui-sref="app.ui.grid">
                      <span translate="aside.nav.components.ui_kits.GRID">Grid</span>
                    </a>
                  </li>
                  <li ui-sref-active="active">
                    <a ui-sref="app.ui.widgets">
                      <b class="badge bg-success pull-right">13</b>
                      <span translate="aside.nav.WIDGETS">Widgets</span>
                    </a>
                  </li>
                  <li ui-sref-active="active">
                    <a ui-sref="app.ui.bootstrap">
                      <b class="badge bg-primary pull-right">16</b>
                      <span translate="aside.nav.components.ui_kits.BOOTSTRAP">Bootstrap</span>
                    </a>
                  </li>
                  <li ui-sref-active="active">
                    <a ui-sref="app.ui.sortable">
                      <span translate="aside.nav.components.ui_kits.SORTABLE">Sortable</span>
                    </a>
                  </li>
                  <li ui-sref-active="active">
                    <a ui-sref="app.ui.portlet">
                      <span translate="aside.nav.components.ui_kits.PORTLET">Portlet</span>
                    </a>
                  </li>
                  <li ui-sref-active="active">
                    <a ui-sref="app.ui.timeline">
                      <span translate="aside.nav.components.ui_kits.TIMELINE">Timeline</span>
                    </a>
                  </li>
                  <li ui-sref-active="active">
                    <a ui-sref="app.ui.tree">
                      <span>Tree</span>
                    </a>
                  </li>
                  <li ui-sref-active="active">
                    <a ui-sref="app.ui.toaster">
                      <span>Toaster</span>
                    </a>
                  </li>
                  <li ui-sref-active="active">
                    <a ui-sref="app.ui.jvectormap">
                      <span translate="aside.nav.components.ui_kits.VECTOR_MAP">Vector Map</span>
                    </a>
                  </li>
                  <li ui-sref-active="active">
                    <a ui-sref="app.ui.googlemap">
                      <span>Google Map</span>
                    </a>
                  </li>
                </ul>
              </li>
              <li ng-class="{active:$state.includes('app.table')}">
                <a href class="auto">
                  <span class="pull-right text-muted">
                    <i class="fa fa-fw fa-angle-right text"></i>
                    <i class="fa fa-fw fa-angle-down text-active"></i>
                  </span>
                  <b class="label bg-primary pull-right">2</b>
                  <i class="glyphicon glyphicon-list"></i>
                  <span translate="aside.nav.components.table.TABLE">Table</span>
                </a>
                <ul class="nav nav-sub dk">
                  <li class="nav-sub-header">
                    <a href>
                      <span translate="aside.nav.components.table.TABLE">Table</span>
                    </a>
                  </li>
                  <li ui-sref-active="active">
                    <a ui-sref="app.table.static">
                      <span translate="aside.nav.components.table.TABLE_STATIC">Table static</span>
                    </a>
                  </li>
                  <li ui-sref-active="active">
                    <a ui-sref="app.table.datatable">
                      <span translate="aside.nav.components.table.DATATABLE">Datatable</span>
                    </a>
                  </li>
                  <li ui-sref-active="active">
                    <a ui-sref="app.table.footable">
                      <span translate="aside.nav.components.table.FOOTABLE">Footable</span>
                    </a>
                  </li>
                  <li ui-sref-active="active">
                    <a ui-sref="app.table.grid">
                      <span>ngGrid</span>
                    </a>
                  </li>
                </ul>
              </li>
              <li ng-class="{active:$state.includes('app.form')}">
                <a href class="auto">
                  <span class="pull-right text-muted">
                    <i class="fa fa-fw fa-angle-right text"></i>
                    <i class="fa fa-fw fa-angle-down text-active"></i>
                  </span>
                  <i class="glyphicon glyphicon-edit"></i>
                  <span translate="aside.nav.components.form.FORM">Form</span>
                </a>
                <ul class="nav nav-sub dk">
                  <li class="nav-sub-header">
                    <a href>
                      <span translate="aside.nav.components.form.FORM">Form</span>
                    </a>
                  </li>
                  <li ui-sref-active="active">
                    <a ui-sref="app.form.elements">
                      <span translate="aside.nav.components.form.FORM_ELEMENTS">Form elements</span>
                    </a>
                  </li>
                  <li ui-sref-active="active">
                    <a ui-sref="app.form.validation">
                      <span translate="aside.nav.components.form.FORM_VALIDATION">Form validation</span>
                    </a>
                  </li>
                  <li ui-sref-active="active">
                    <a ui-sref="app.form.wizard">
                      <span translate="aside.nav.components.form.FORM_WIZARD">Form wizard</span>
                    </a>
                  </li>
                  <li ui-sref-active="active">
                    <a ui-sref="app.form.fileupload">
                      <span>File upload</span>
                    </a>
                  </li>
                  <li ui-sref-active="active">
                    <a ui-sref="app.form.imagecrop">
                      <span>Image crop</span>
                    </a>
                  </li>
                </ul>
              </li>
              <li ui-sref-active="active">
                <a ui-sref="app.chart">
                  <i class="glyphicon glyphicon-signal"></i>
                  <span translate="aside.nav.components.CHART">Chart</span>
                </a>
              </li>
              <li ng-class="{active:$state.includes('app.page')}">
                <a href class="auto">
                  <span class="pull-right text-muted">
                    <i class="fa fa-fw fa-angle-right text"></i>
                    <i class="fa fa-fw fa-angle-down text-active"></i>
                  </span>
                  <i class="glyphicon glyphicon-file icon"></i>
                  <span translate="aside.nav.components.pages.PAGES">Pages</span>
                </a>
                <ul class="nav nav-sub dk">
                  <li class="nav-sub-header">
                    <a href>
                      <span translate="aside.nav.components.pages.PAGES">Pages</span>
                    </a>
                  </li>
                  <li ui-sref-active="active">
                    <a ui-sref="app.page.profile">
                      <span translate="aside.nav.components.pages.PROFILE">Profile</span>
                    </a>
                  </li>
                  <li ui-sref-active="active">
                    <a ui-sref="app.page.post">
                      <span translate="aside.nav.components.pages.POST">Post</span>
                    </a>
                  </li>
                  <li ui-sref-active="active">
                    <a ui-sref="app.page.search">
                      <span translate="aside.nav.components.pages.SEARCH">Search</span>
                    </a>
                  </li>
                  <li ui-sref-active="active">
                    <a ui-sref="app.page.invoice">
                      <span translate="aside.nav.components.pages.INVOICE">Invoice</span>
                    </a>
                  </li>
                  <li ui-sref-active="active">
                    <a ui-sref="app.page.price">
                      <span>Price</span>
                    </a>
                  </li>
                  <li>
                    <a ui-sref="lockme">
                      <span translate="aside.nav.components.pages.LOCK_SCREEN">Lock screen</span>
                    </a>
                  </li>
                  <li>
                    <a ui-sref="access.signin">
                      <span translate="aside.nav.components.pages.SIGNIN">Signin</span>
                    </a>
                  </li>
                  <li>
                    <a ui-sref="access.signup">
                      <span translate="aside.nav.components.pages.SIGNUP">Signup</span>
                    </a>
                  </li>
                  <li>
                    <a ui-sref="access.forgotpwd">
                      <span translate="aside.nav.components.pages.FORGOT_PASSWORD">Forgot password</span>
                    </a>
                  </li>
                  <li>
                    <a ui-sref="access.404">
                      <span translate="aside.nav.components.pages.404">404</span>
                    </a>
                  </li>
                </ul>
              </li>

              <li class="line dk hidden-folded"></li>

              <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">          
                <span translate="aside.nav.your_stuff.YOUR_STUFF">财务统计</span>
              </li>  
              <li>
                <a ui-sref="app.page.profile">
                  <i class="icon-user icon text-success-lter"></i>
                  <b class="badge bg-success pull-right">30%</b>
                  <span translate="aside.nav.your_stuff.PROFILE">Profile</span>
                </a>
              </li>
              <li>
                <a ui-sref="app.docs">
                  <i class="icon-question icon"></i>
                  <span translate="aside.nav.your_stuff.DOCUMENTS">Documents</span>
                </a>
              </li>
            </ul>
          </nav>
          <!-- nav -->

          <!-- aside footer -->
          <div class="wrapper m-t">
            <div class="text-center-folded">
              <span class="pull-right pull-none-folded">60%</span>
              <span class="hidden-folded" translate="aside.MILESTONE">Milestone</span>
            </div>
            <div class="progress progress-xxs m-t-sm dk">
              <div class="progress-bar progress-bar-info" style="width: 60%;">
              </div>
            </div>
            <div class="text-center-folded">
              <span class="pull-right pull-none-folded">35%</span>
              <span class="hidden-folded" translate="aside.RELEASE">Release</span>
            </div>
            <div class="progress progress-xxs m-t-sm dk">
              <div class="progress-bar progress-bar-primary" style="width: 35%;">
              </div>
            </div>
          </div>
          <!-- / aside footer -->
        </div>
      </div>
    </div>