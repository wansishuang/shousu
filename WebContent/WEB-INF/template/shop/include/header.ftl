<script type="text/javascript">
$().ready(function() {
	//初始化JS
	var $headerLogin = $("#headerLogin");
	var $headerRegister = $("#headerRegister");
	var $headerUsername = $("#headerUsername");
	var $headerLogout = $("#headerLogout");
	var $productSearchForm = $("#productSearchForm");
	var $keyword = $("#productSearchForm > .keyword");
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
	//DIY
	$("#products").hover(
		function(){$("#p_list").show();},
		function(){$("#p_list").hide();}
	);
	
	$("#products").hover(
		function(){$("#p_list").css("display","block");},
		function(){$("#p_list").css("display","none");}
	);
	
	$("#p_list").hover(
		function(){$(this).css("display","block");},
		function(){$(this).css("display","none");}
	);
	

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
            <!--toptop start-->
           <div class="topNav clearfix">
			<ul>
				<!-- login -->
				<li id="headerLogin" class="headerLogin">
					<a href="${base}/login.jhtml">${message("shop.header.login")}</a>|
				</li>
				<!-- register -->
				<li id="headerRegister" class="headerRegister">
					<a href="${base}/register.jhtml">${message("shop.header.register")}</a>|
				</li>
				<!-- username -->
				<li id="headerUsername" class="headerUsername"></li>
				<!-- logout -->
				<li id="headerLogout" class="headerLogout">
					<a href="${base}/logout.jhtml">[${message("shop.header.logout")}]</a>|
				</li>
				<!--DIY  tag-->
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
            <!--toptop end-->
        </div>
        <!--msg end-->
    	<div class="tp">
        	<div class="logo"><img src="${base}/resources/shop/images/logo_05.png" /><span>全场满99元免运费</span></div>
            <!--logo end-->
            <div class="search">
    			<form id="productSearchForm" action="${base}/product/search.jhtml" method="get">
					<input name="keyword" class="keyword" value="${productKeyword!message("shop.header.keyword")}" maxlength="30" />
					<input type="submit"  class="btn"value="" />
				</form>
            </div>
            <!--search end-->
            <!-- 购物车 cart -->
            <div class="shopping">
            	<a href="${base}/cart/list.jhtml">${message("shop.header.cart")}</a>
            </div>
            <!-- 购物车 cart End-->
            <!--shopping end-->
        </div>
        
        <!--tp end-->
        <div class="nav">
        <dl>
			[@navigation_list position = "middle"]
				[#list navigations as navigation]
				    <dd><a href="${navigation.url}"[#if navigation.isBlankTarget] target="_blank"[/#if]>${navigation.name}</a></dd>
				[/#list]
			[/@navigation_list]
        	</dl>
        </div>
		<!-- 热门搜索 -->
        <div class="recommend">
        	[#if setting.hotSearches?has_content]
        	<a>
        		<b>${message("shop.header.hotSearch")}:</b>
        	</a>
        	[#list setting.hotSearches as hotSearch]
						<a href="${base}/product/search.jhtml?keyword=${hotSearch?url}">${hotSearch}</a><a> | </a>
			[/#list]
			[/#if]
        </div>
        <!-- 热门搜索  End-->
        <!--recommend-->
          <div class="classify">
    		<div class="product">
    			[#-- 所有分类链接 --]
        		<h1 id="products">
        			<a href="${base}/product_category.jhtml">${message("shop.index.allProductCategory")}</a>
        		</h1>
	            <div class="p_list" id="p_list" style="display:none;">
	            	<dl>
	            		[@product_category_root_list count = 4]
						[#list productCategories as rootProductCategory]
						<!--<tr[#if !rootProductCategory_has_next] class="last"[/#if]>-->
						<dt>
							<b><a href="${base}${rootProductCategory.path}">${rootProductCategory.name}</a></b>
						</dt>
						<dd>
							[#list rootProductCategory.children as productCategory]
							<a href="${base}${productCategory.path}">${productCategory.name}</a>
							[/#list]
						</dd>
						[/#list]
						[/@product_category_root_list]
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
