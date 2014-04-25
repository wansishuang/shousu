
[#-- 网页内容底部 --]
<div class="container footer">
	<!-- 底部导航 End-->
	[#-- 底部广告 --]
	<!--
		<div class="span24">
		[@ad_position id = 2 /]
	</div>
	-->
	[#-- 底部友好链接 --]
	<div class="span24">
		<ul class="bottomNav">
			[@navigation_list position = "bottom"]
				[#list navigations as navigation]
					<li>
						<a href="${navigation.url}"[#if navigation.isBlankTarget] target="_blank"[/#if]>${navigation.name}</a>
						[#if navigation_has_next]|[/#if]
					</li>
				[/#list]
			[/@navigation_list]
		</ul>
	</div>
	[#-- 底部导航 --]
	<div class="span24">
		<div class="copyright">${message("shop.footer.copyright", setting.siteName)}</div>
	</div>
	[#-- 站长统计 --]
	[#include "/shop/include/statistics.ftl" /]
</div>