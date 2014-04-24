<script type="text/javascript">
$().ready(function() {


	var $headerLogin = $("#headerLogin");
	var $headerRegister = $("#headerRegister");
	var $headerUsername = $("#headerUsername");
	var $headerLogout = $("#headerLogout");
	var $productSearchForm = $("#productSearchForm");
	var $keyword = $("input :first");
	
	var $keyword = $("#productSearchForm .keyword");
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
	/*DIY*/
	$("#products").hover(
		function(){$("#p_list").css("display","block");},
		function(){$("#p_list").css("display","none");}
	);
	
	$("#p_list").hover(
		function(){$("#p_list").css("display","block");},
		function(){$("#p_list").css("display","none");}
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

<div id="tp" class="tp">
	<div class="header">
        <div class="msg">
            <div class="mgleft">
                <a href="">收藏本站</a> | <a href="">网站公告</a> | <a href="">正品保障</a>
            </div>
            <!--toptop start-->
           <div class="mgright">
			<ul>
				<!-- login -->
				<li id="headerLogin" class="headerLogin">
					<a href="${base}/login.jhtml">&nbsp;${message("shop.header.login")}&nbsp;</a>|
				</li>
				<!-- register -->
				<li id="headerRegister" class="headerRegister">
					<a href="${base}/register.jhtml">&nbsp;${message("shop.header.register")}&nbsp;</a>|
				</li>
				<!-- username -->
				<li id="headerUsername" class="headerUsername"></li>
				<!-- logout -->
				<li id="headerLogout" class="headerLogout">
					<a href="${base}/logout.jhtml">&nbsp;[${message("shop.header.logout")}]&nbsp;</a>|
				</li>
				<!--DIY  tag-->
				[@navigation_list position = "top"]
					[#list navigations as navigation]
						<li>
							<a href="${navigation.url}"[#if navigation.isBlankTarget][/#if]>&nbsp${navigation.name}</a>
							[#if navigation_has_next]|[/#if]
						</li>
					[/#list]
				[/@navigation_list]
			</ul>
			</div>
            <!--toptop end-->
        </div>
        <!--msg end-->
    	<div class="tp1">
        	<div class="logo"><img src="${base}/resources/shop/images/logo_05.png" /></div>
            <!--logo end-->
            <div class="search">
    			<form id="productSearchForm" action="${base}/product/search.jhtml" method="get">
					<input name="keyword" class="keyword" value="${productKeyword!message("shop.header.keyword")}" maxlength="30" />
					<input type="submit" class="btn" value="" style="none" />
					
				</form>
            </div>
            <!--search end-->
            <!-- 购物车 cart -->
            <div class="shopping" >
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
	            		[@product_category_root_list count = 6]
						[#list productCategories as rootProductCategory]
						<!--<tr[#if !rootProductCategory_has_next] class="last"[/#if]>-->
						<dt>
							<b><a href="${base}${rootProductCategory.path}">${rootProductCategory.name}</a></b>
						</dt>
						<dd>
							[#list rootProductCategory.children as productCategory]
							<a href="${base}${productCategory.path}">${productCategory.name}</a>&nbsp;&nbsp;
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

