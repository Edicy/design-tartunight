<h2>{{"latest_news"|lc}}</h2>
    <ul id="latest-news">
    {% for article in site.latest_1_articles %}
        <li>
			<h3><a href="{{article.url}}">{{article.title}}</a></h3>
			<p class="meta-info">{{article.author.name}}<span class="date">{{article.created_at | format_date:"short"}}</span></p>
			{{article.excerpt | strip_html | truncate : 125}} <br/> <a class="more" href="{{article.url}}">{{"read_more"|lc}}</a>
		</li>
    {% endfor %}
	</ul>