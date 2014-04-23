[#-- 所有页面的头部申明  --]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
[@seo type = "index"]
	[#--双问号 “??” 报错不用管--]
	<title>[#if seo.title??][@seo.title?interpret /][#else]${message("shop.index.title")}[/#if][#if systemShowPowered] - Powered By ShouSu[/#if]</title>
	<meta name="author" content="SHOP++ Team" />
	<meta name="copyright" content="SHOP++" />
	[#if seo.keywords??]
		<meta name="keywords" content="[@seo.keywords?interpret /]" />
	[/#if]
	[#if seo.description??]
		<meta name="description" content="[@seo.description?interpret /]" />
	[/#if]
[/@seo]
<link rel="icon" href="${base}/favicon.ico" type="image/x-icon" />
<!--<link href="${base}/resources/shop/slider/slider.css" rel="stylesheet" type="text/css" />-->
<link href="${base}/resources/shop/css/common.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/css/index.css" rel="stylesheet" type="text/css" />

<!--/*DIY*/-->
<link href="${base}/resources/shop/css/common_xf.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/css/index_xf.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="${base}/resources/shop/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/jquery.tools.js"></script>
<!--<script type="text/javascript" src="${base}/resources/shop/slider/slider.js"></script>-->
<script type="text/javascript" src="${base}/resources/shop/js/common.js"></script>

<!--/*DIY*/-->
<script type="text/javascript" src="${base}/resources/shop/js/jquery.Xslider.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/jquery.lazyload.js"></script>

<script type="text/javascript">
$().ready(function() {

	var $slider = $("#slider");
	var $newArticleTab = $("#newArticle .tab");
	var $promotionProductTab = $("#promotionProduct .tab");
	var $promotionProductInfo = $("#promotionProduct .info");
	var $hotProductTab = $("#hotProduct .tab");
	var $newProductTab = $("#newProduct .tab");
	
	$slider.nivoSlider({
		effect: "random",
		animSpeed: 1000,
		pauseTime: 6000,
		controlNav: true,
		keyboardNav: false,
		captionOpacity: 0.4
	});
	
	$newArticleTab.tabs("#newArticle .tabContent", {
		tabs: "li",
		event: "mouseover",
		initialIndex: 1
	});
	
	$promotionProductTab.tabs("#promotionProduct .tabContent", {
		tabs: "li",
		event: "mouseover"
	});
	
	$hotProductTab.tabs("#hotProduct .tabContent", {
		tabs: "li",
		event: "mouseover"
	});
	
	$newProductTab.tabs("#newProduct .tabContent", {
		tabs: "li",
		event: "mouseover"
	});
	
	function promotionInfo() {
		$promotionProductInfo.each(function() {
			var $this = $(this);
			var beginDate = $this.attr("beginTimeStamp") != null ? new Date(parseFloat($this.attr("beginTimeStamp"))) : null;
			var endDate = $this.attr("endTimeStamp") != null ? new Date(parseFloat($this.attr("endTimeStamp"))) : null;
			if (beginDate == null || beginDate <= new Date()) {
				if (endDate != null && endDate >= new Date()) {
					var time = (endDate - new Date()) / 1000;
					$this.html("${message("shop.index.remain")}:<strong>" + Math.floor(time / (24 * 3600)) + "<\/strong> ${message("shop.index.day")} <strong>" + Math.floor((time % (24 * 3600)) / 3600) + "<\/strong> ${message("shop.index.hour")} <strong>" + Math.floor((time % 3600) / 60) + "<\/strong> ${message("shop.index.minute")}");
				} else if (endDate != null && endDate < new Date()) {
					$this.html("${message("shop.index.ended")}");
				} else {
					$this.html("${message("shop.index.going")}");
				}
			}
		});
	}
	
	promotionInfo();
	setInterval(promotionInfo, 60 * 1000);

});
</script>
</head>
<body>
	<!-- 引入header 模块 -->
	[#include "/shop/include/header.ftl" /]
	[#-- index 页面主要部分 --]
	<div class="container index">
		[#-- 轮播广告 --]
		<!-- 轮播广告 -->
		<div class="span18">
			[@ad_position id = 3 /]
		</div>
		
		[#-- 新文章模块，，广告右边div --]
		<!-- 新文章模块，，广告右边div -->
		<div class="span6 last">
			<div id="newArticle" class="newArticle">
				[@article_category_root_list count = 3]
					[#-- 文章标签 --]
					<ul class="tab">
						[#list articleCategories as articleCategory]
							<li>
								<a href="${base}${articleCategory.path}" target="_blank">${articleCategory.name}</a>
							</li>
						[/#list]
					</ul>
					[#-- 文章内容 --]
					[#list articleCategories as articleCategory]
						[@article_list articleCategoryId = articleCategory.id count = 5]
							<ul class="tabContent">
								[#list articles as article]
									<li>
										<a href="${base}${article.path}" title="${article.title}" target="_blank">${abbreviate(article.title, 30)}</a>
									</li>
								[/#list]
							</ul>
						[/@article_list]
					[/#list]
				[/@article_category_root_list]
			</div>
			[#--文章底部广告，春季新品 --]
			[@ad_position id = 4 /]
		</div>
		[#-- 品牌，产品 start --]
		<div class="span18">
			[#-- 热门品牌 --]<!--热门品牌 -->
			
			<!--
			<div class="hotBrand clearfix">
				<div class="title">
					[#-- 所有品牌链接 --]
					<a href="${base}/brand/list/1.jhtml">${message("shop.index.allBrand")}</a>
					<strong>${message("shop.index.hotBrand")}</strong>BRAND
				</div>
				<ul>
					[#-- 允许的品牌个数 --]
					[@brand_list type = "image" count = 14]
						[#list brands as brand]
							[#-- 品牌的链接、图片 --]
							<li>
								<a href="${base}${brand.path}" title="${brand.name}"><img src="${brand.logo}" alt="${brand.name}" /></a>
							</li>
						[/#list]
					[/@brand_list]
				</ul>
			</div>
			-->
			
			
			[#-- 热门品牌  end--]
			[#-- 热门产品分类 start --]
			<div class="hotProductCategory">
				<div class="title">
					[#-- 所有分类链接 --]
					<a href="${base}/product_category.jhtml">${message("shop.index.allProductCategory")}</a>
					<strong>${message("shop.index.hotProductCategory")}</strong>CATEGORY
				</div>
				<div class="content">
					[@product_category_root_list count = 4]
						<table>
							[#list productCategories as rootProductCategory]
								<tr[#if !rootProductCategory_has_next] class="last"[/#if]>
									<th>
										<a href="${base}${rootProductCategory.path}">${rootProductCategory.name}</a>
									</th>
									<td>
										[#list rootProductCategory.children as productCategory]
											<a href="${base}${productCategory.path}">${productCategory.name}</a>
										[/#list]
									</td>
								</tr>
							[/#list]
						</table>
					[/@product_category_root_list]
				</div>
			</div>
			[#-- 热门产品分类 end --]
		</div>
		[#-- 品牌，产品 end --]
		<!--促销商品列表 start-->
		<div class="span6 last">
			<div id="promotionProduct" class="promotionProduct">
				<ul class="tab">
					[@promotion_list hasEnded = false count = 2]
						[#list promotions as promotion]
							<li>
								<a href="${base}/product/list.jhtml?promotionId=${promotion.id}" target="_blank">${promotion.name}</a>
							</li>
						[/#list]
					[/@promotion_list]
				</ul>
				[@promotion_list hasEnded = false count = 2]
					[#list promotions as promotion]
						<ul class="tabContent">
							[@product_list promotionId = promotion.id count = 2]
								[#list products as product]
									<li[#if !product_has_next] class="last"[/#if]>
										<span class="info"[#if promotion.beginDate??] beginTimeStamp="${promotion.beginDate?long}"[/#if][#if promotion.endDate??] endTimeStamp="${promotion.endDate?long}"[/#if]>
											[#if promotion.beginDate??]
												${message("shop.index.begin")}: <strong>${promotion.beginDate?string("yyyy-MM-dd HH:mm")}</strong>
											[/#if]
										</span>
										<div class="product">
											<img src="[#if product.image??]${product.image}[#else]${setting.defaultThumbnailProductImage}[/#if]" alt="${product.name}" />
											<a href="${base}${product.path}" title="${product.name}" target="_blank">${abbreviate(product.name, 24)}</a>
											<div>
												[#if setting.isShowMarketPrice]
													${message("Product.marketPrice")}:
													<del>${currency(product.marketPrice, true)}</del>
												[#else]
													${message("Product.price")}:
													<strong>${currency(product.price, true)}</strong>
												[/#if]
											</div>
										</div>
										[#if setting.isShowMarketPrice]
											<div>
												${message("Product.price")}:
												<strong>${currency(product.price, true)}</strong>
											</div>
										[/#if]
									</li>
								[/#list]
							[/@product_list]
						</ul>
					[/#list]
				[/@promotion_list]
			</div>
			<div class="newReview">
				<div class="title">${message("shop.index.newReview")}</div>
				<ul>
					[@review_list count = 4]
						[#list reviews as review]
							<li>
								<a href="${base}${review.path}" title="${abbreviate(review.content, 100, "...")}" target="_blank">${abbreviate(review.content, 30)}</a>
							</li>
						[/#list]
					[/@review_list]
				</ul>
			</div>
		</div>
		<!--促销商品列表 end-->
		<!-- 中部 广告 start-->
		<!-- 
		<div class="span24">
			[@ad_position id = 5 /]
		</div>
		-->
		
		<!-- 中部 广告 end-->
		<!-- 热门商品 start-->
		<!-- 
		<div class="span24">
			<div id="hotProduct" class="hotProduct clearfix">
				[@product_category_root_list count = 3]
					<div class="title">
						<strong>${message("shop.index.hotProduct")}</strong>
						<a href="${base}/product/list.jhtml?tagIds=1" target="_blank"></a>
					</div>
					<ul class="tab">
						[#list productCategories as productCategory]
							<li>
								<a href="${base}${productCategory.path}?tagIds=1" target="_blank">${productCategory.name}</a>
							</li>
						[/#list]
					</ul>
					<div class="hotProductAd">
						[@ad_position id = 6 /]
					</div>
					[#list productCategories as productCategory]
						<ul class="tabContent">
							[@product_list productCategoryId = productCategory.id tagIds = 1 count = 8]
								[#list products as product]
									<li>
										<a href="${base}${product.path}" title="${product.name}" target="_blank"><img src="[#if product.image??]${product.image}[#else]${setting.defaultThumbnailProductImage}[/#if]" alt="${product.name}" /></a>
									</li>
								[/#list]
							[/@product_list]
						</ul>
					[/#list]
				[/@product_category_root_list]
			</div>
		</div>
		-->
		
		<!-- 热门商品 end-->
		<!-- 最新商品 start-->
		<div class="span24">
			<div id="newProduct" class="newProduct clearfix">
				[@product_category_root_list count = 3]
					<div class="title">
						<strong>${message("shop.index.newProduct")}</strong>
						<a href="${base}/product/list.jhtml?tagIds=2" target="_blank"></a>
					</div>
					<ul class="tab">
						[#list productCategories as productCategory]
							<li>
								<a href="${base}${productCategory.path}?tagIds=2" target="_blank">${productCategory.name}</a>
							</li>
						[/#list]
					</ul>
					<div class="newProductAd">
						[@ad_position id = 7 /]
					</div>
					[#list productCategories as productCategory]
						<ul class="tabContent">
							[@product_list productCategoryId = productCategory.id tagIds = 2 count = 8]
								[#list products as product]
									<li>
										<a href="${base}${product.path}" title="${product.name}" target="_blank"><img src="[#if product.image??]${product.image}[#else]${setting.defaultThumbnailProductImage}[/#if]" alt="${product.name}" /></a>
									</li>
								[/#list]
							[/@product_list]
						</ul>
					[/#list]
				[/@product_category_root_list]
			</div>
		</div>
		<!-- 最新商品 end-->
		<!-- 友好链接 start-->
		<div class="span24">
			<div class="friendLink">
				<dl>
					<dt>${message("shop.index.friendLink")}</dt>
					[@friend_link_list count = 10]
						[#list friendLinks as friendLink]
							<dd>
								<a href="${friendLink.url}" target="_blank">${friendLink.name}</a>
								[#if friendLink_has_next]|[/#if]
							</dd>
						[/#list]
					[/@friend_link_list]
					<dd class="more">
						<a href="${base}/friend_link.jhtml">${message("shop.index.more")}</a>
					</dd>
				</dl>
			</div>
		</div>
		<!-- 友好链接商品 end-->
	</div>
	[#include "/shop/include/footer.ftl" /]
</body>
</html>