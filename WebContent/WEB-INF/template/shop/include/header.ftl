<script type="text/javascript">
$().ready(function() {
	//初始化JS
	var $headerLogin = $("#headerLogin");
	var $headerRegister = $("#headerRegister");
	var $headerUsername = $("#headerUsername");
	var $headerLogout = $("#headerLogout");
	var $productSearchForm = $("#productSearchForm");
	var $keyword = $("#productSearchForm .tex");
	var defaultKeyword = "${message("shop.header.keyword")}";
	
	var username = getCookie("username");
	if (username != null) {
		$headerUsername.text("${message("shop.header.welcome")}, " + username).show();
		$headerLogout.show();
	} else {
		$headerLogin.show();
		$headerRegister.show();
	}
	
	$keyword.focus(function() {
		if ($keyword.val() == defaultKeyword) {
			$keyword.val("");
		}
	});
	
	$keyword.blur(function() {
		if ($keyword.val() == "") {
			$keyword.val(defaultKeyword);
		}
	});
	
	$productSearchForm.submit(function() {
		if ($.trim($keyword.val()) == "" || $keyword.val() == defaultKeyword) {
			return false;
		}
	});

});
</script>
<div class="quick">
	<dl>
    	<dt>快速导航</dt>
        <dd><a href="">1.男装专区</a></dd>
        <dd><a href="">2.女装专区</a></dd>
        <dd><a href="">3.男鞋专区</a></dd>
        <dd><a href="">4.女鞋专区</a></dd>
        <dd><a href="">5.儿童专区</a></dd>
        <dd><a href="">6.箱包专区</a></dd>
        <dd class="returntop"><a href="#tp">返回顶部</a></dd>
    </dl>
</div>

<div id="tp" class="top">
	<div class="header">
        <div class="msg">
            <div class="mgleft">
                <a href="">收藏本站11</a> | <a href="">网站公告</a> | <a href="">正品保障</a>
            </div>
            <!--msgleft end-->
           <div class="topNav clearfix">
			<ul>
				<li id="headerLogin" class="headerLogin">
					<a href="${base}/login.jhtml">${message("shop.header.login")}</a>|
				</li>
				<li id="headerRegister" class="headerRegister">
					<a href="${base}/register.jhtml">${message("shop.header.register")}</a>|
				</li>
				<li id="headerUsername" class="headerUsername"></li>
				<li id="headerLogout" class="headerLogout">
					<a href="${base}/logout.jhtml">[${message("shop.header.logout")}]</a>|
				</li>
				[@navigation_list position = "top"]
					[#list navigations as navigation]
						<li>
							<a href="${navigation.url}"[#if navigation.isBlankTarget][/#if]>${navigation.name}</a>
							[#if navigation_has_next]|[/#if]
						</li>
					[/#list]
				[/@navigation_list]
			</ul>
			</div>
            <!--mgright end-->
        </div>
        <!--msg end-->
    	<div class="tp">
        	<div class="logo"><img src="${base}/resources/shop/images/logo_05.png" /><span>全场满99元免运费</span></div>
            <!--logo end-->
            <div class="search">
    			<form id="productSearchForm" action="${base}/product/search.jhtml" method="get">
					<input name="keyword" class="tex" value="${productKeyword!message("shop.header.keyword")}" maxlength="30" />
					<input type="submit" value="" class="btn" />
				</form>
            </div>
            <!--search end-->
            <div class="shopping">
            	<a href="${base}/cart/list.jhtml">${message("shop.header.cart")}</a>
            </div>
            <!--shopping end-->
        </div>
        
        <!--tp end-->
        <div class="nav">
        <dl>
			[@navigation_list position = "middle"]
				[#list navigations as navigation]
				    <dd><a href="${navigation.url}"[#if navigation.isBlankTarget] target="_blank"[/#if]>${navigation.name}</a></dd>
                	<dt></dt>
				[/#list]
			[/@navigation_list]
        	</dl>
        </div>
        <div class="recommend">
        	<a><b>冬季推荐：</b></a><a href="">羽绒服</a><a> | </a><a href="">夹克</a><a> | </a><a href="">毛衣</a><a> | </a><a href="">风衣</a><a> | </a><a href="">卫衣</a><a> | </a><a href="">板鞋</a><a> | </a><a href="">跑步鞋</a><a> | </a><a href="">滑雪服</a> 
        </div>
        <!--recommend-->
          <div class="classify">
    		<div class="product">
        		<h1 id="products">全部商品分类</h1>
	            <div class="p_list" id="p_list" style="display:none;">
	            	<dl>
	                	<dt><b>女鞋</b> ></dt>
	                    <dd><a href="">新款女单</a>&nbsp;&nbsp;<a href="">休闲鞋</a>&nbsp;&nbsp;<a href="">女凉鞋</a>&nbsp;&nbsp;<a href="">凉拖</a></dd>
	                </dl>
	                <dl>
	                	<dt><b>男鞋</b> ></dt>
	                    <dd><a href="">新款女单</a>&nbsp;&nbsp;<a href="">休闲鞋</a>&nbsp;&nbsp;<a href="">女凉鞋</a>&nbsp;&nbsp;<a href="">凉拖</a></dd>
	                </dl>
	            </div>
            <!--p_list end-->
        </div>
        <!--product end-->
    </div>
    <!--classify end-->
    </div>
    <!--header end-->
</div>

<!--
[#-- Header 头部 --]
<div class="container header">
	[#-- Logo图片 --]
	<div class="span5">
		<div class="logo">
			<a href="${base}/">
				<img src="${setting.logo}" alt="${setting.siteName}" />
			</a>
		</div>
	</div>
	[#-- header 头部广告位 --]
	<div class="span9">
		[@ad_position id = 1 /]
	</div>
	[#-- header 顶部导航 --]
	<div class="span10 last">
		<div class="topNav clearfix">
			<ul>
				[#-- login --]
				<li id="headerLogin" class="headerLogin">
					<a href="${base}/login.jhtml">${message("shop.header.login")}</a>|
				</li>
				[#-- register --]
				<li id="headerRegister" class="headerRegister">
					<a href="${base}/register.jhtml">${message("shop.header.register")}</a>|
				</li>
				[#-- User Name --]
				<li id="headerUsername" class="headerUsername"></li>
				[#-- logout 注销 --]
				<li id="headerLogout" class="headerLogout">
					<a href="${base}/logout.jhtml">[${message("shop.header.logout")}]</a>|
				</li>
				[#-- 动态添加导航 --]
				[@navigation_list position = "top"]
					[#list navigations as navigation]
						<li>
							<a href="${navigation.url}"[#if navigation.isBlankTarget] target="_blank"[/#if]>${navigation.name}</a>
							[#if navigation_has_next]|[/#if]
						</li>
					[/#list]
				[/@navigation_list]
			</ul>
		</div>
		[#-- 购物车 --]
		<div class="cart">
			<a href="${base}/cart/list.jhtml">${message("shop.header.cart")}</a>
		</div>
		[#-- 商城电话 --]
		[#if setting.phone??]
			<div class="phone">
				${message("shop.header.phone")}:
				<strong>${setting.phone}</strong>
			</div>
		[/#if]
	</div>
	[#-- header 中部导航  --]
	<div class="span24">
		<ul class="mainNav">
			[@navigation_list position = "middle"]
				[#list navigations as navigation]
					<li[#if navigation.url = url] class="current"[/#if]>
						<a href="${navigation.url}"[#if navigation.isBlankTarget] target="_blank"[/#if]>${navigation.name}</a>
						[#if navigation_has_next]|[/#if]
					</li>
				[/#list]
			[/@navigation_list]
		</ul>
	</div>
	[#-- header 底部导航 --]
	<div class="span24">
		[#-- 商品标签  --]
		<div class="tagWrap">
			<ul class="tag">
				[@tag_list type="product" count = 3]
					[#list tags as tag]
						<li[#if tag.icon??] class="icon" style="background: url(${tag.icon}) right no-repeat;"[/#if]>
							<a href="${base}/product/list.jhtml?tagIds=${tag.id}">${tag.name}</a>
						</li>
					[/#list]
				[/@tag_list]
			</ul>
			[#-- 热门搜素 --]
			<div class="hotSearch">
				[#if setting.hotSearches?has_content]
					${message("shop.header.hotSearch")}:
					[#list setting.hotSearches as hotSearch]
						<a href="${base}/product/search.jhtml?keyword=${hotSearch?url}">${hotSearch}</a>
					[/#list]
				[/#if]
			</div>
			[#-- 商品搜索 --]
			<div class="search">
				<form id="productSearchForm" action="${base}/product/search.jhtml" method="get">
					<input name="keyword" class="keyword" value="${productKeyword!message("shop.header.keyword")}" maxlength="30" />
					<button type="submit">${message("shop.header.search")}</button>
				</form>
			</div>
		</div>
	</div>
</div>
-->
