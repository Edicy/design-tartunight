{% if site.search.enabled %}
<div id="search-wrap">
    <div id="search-btn">
        <span>Search</span>
    </div>
	<form action="#" method="post" id="search" class="clear edys-search" name="search">
		<p><input type="text" name="" id="onpage_search" class="edys-search-input" placeholder="{{ "search"|lc }}"></p>
        <div class="loading-icon"><img src="{{ images_path }}/ajax-loader.gif" /></div>
	</form>
</div>
{% endif %}