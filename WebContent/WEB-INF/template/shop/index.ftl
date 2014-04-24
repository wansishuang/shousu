[#-- 所有页面的头部申明  --]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
[@seo type = "index"]
	[#--双问号 “??” 报错不用管--]
	<title>[#if seo.title??][@seo.title?interpret /][#else]${message("shop.index.title")}[/#if][#if systemShowPowered] - Powered By ShouSu[/#if]</title>
	<meta name="author" content="SHOUSU Team" />
	<meta name="copyright" content="SHOUSU" />
	[#if seo.keywords??]
		<meta name="keywords" content="[@seo.keywords?interpret /]" />
	[/#if]
	[#if seo.description??]
		<meta name="description" content="[@seo.description?interpret /]" />
	[/#if]
[/@seo]
<link rel="icon" href="${base}/favicon.ico" type="image/x-icon" />
<link href="${base}/resources/shop/slider/slider.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/css/common.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/css/index.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="${base}/resources/shop/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/resources/shop/slider/slider.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/common.js"></script>

<!--/*DIY*/-->

<script type="text/javascript">
$().ready(function() {
	
	/* 滑动效果 */
	var $slider = $("#slider");
	$slider.nivoSlider({
		effect: "random",
		animSpeed: 1000,
		pauseTime: 6000,
		controlNav: true,
		keyboardNav: false,
		captionOpacity: 0.4
	});
	
	
	/* 销量热的产品 */
	var $hotProductTab = $("#hotProduct .tab");
	$hotProductTab.tabs("#hotProduct .tabContent", {
		tabs: "li",
		event: "mouseover"
	});
	
	
	/* 新产品标签  */
	var $newProductTab = $("#newProduct .tab");
	$newProductTab.tabs("#newProduct .tabContent", {
		tabs: "li",
		event: "mouseover"
	});
	
	/* 神马意思 
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
	*/
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
		<div class="span24">
			[@ad_position id = 3 /]
		</div>
		[#-- 品牌，产品 start --]
		<div class="span24">
			[#-- 热门品牌 --]<!--热门品牌 -->
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
			[#-- 热门品牌  end--]
		</div>
		<!--热门商品-->
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
		<!-- 热门商品 end-->
		<!-- 最新商品 start-->
		<div class="span24">
			<div id="newProduct" class="newProduct clearfix">
				[@product_category_root_list count = 5][#--加载的产品组数--]
					<!-- 标题 -->
					<div class="title">
						<strong>${message("shop.index.newProduct")}</strong>
						<a href="${base}/product/list.jhtml?tagIds=2" target="_blank"></a>
					</div>
					<!-- 标题 End-->
					<!-- 标签 -->
					<ul class="tab">
						[#list productCategories as productCategory]
							<li>
								<a href="${base}${productCategory.path}?tagIds=2" target="_blank">${productCategory.name}</a>
							</li>
						[/#list]
					</ul>
					<!-- 标签 End-->
					<!-- 标签图片 -->
					<div class="newProductAd">
						[@ad_position id = 7 /]
					</div>
					<!-- 标签图片 End-->
					
					<!-- 展示图片 -->
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
				<!-- 展示图片 End-->
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