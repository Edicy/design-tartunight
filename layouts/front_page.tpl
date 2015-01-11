<!DOCTYPE html>
<html>
    <head>
     {% include "SiteHeader" %}
    </head>
	<body id="front">
		<div id="header" class="clear">
			<div class="wrapper">
				{% include "Mainmenu" %}
                {% include "Langmenu" %}
                {% include "Search" %}
			</div>
		</div>
		<!-- //header -->
		<div id="wrap">
			<div class="hgroup clear">
				<h1 id="logo" class="clear">{% editable site.header %}</h1>
				<h2>{% content name="slogan" %}</h2>
			</div>
			<div id="content-wrap" class="clear">
				<div class="left-column" data-search-indexing-allowed="true">
                    {% content %}
				</div>
				<div class="right-column">
				   {% if site.latest_articles.size > 0 %}{% include "News" %}{% else %}{% content name="sidebar" %}{% endif %}
				</div>
			</div>
			<!-- //content-wrap -->
			{% include "Footer" %}
		</div><!-- //wrap -->
		{% include "JS" %}
	</body>
</html>