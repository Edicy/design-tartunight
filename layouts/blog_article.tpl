<!DOCTYPE html>
<html>
    <head>
     {% include "SiteHeader" %}
     {{blog.rss_link}}
    </head>
    <body id="article">
        <div id="header" class="clear">
			<div class="wrapper">
				{% include "Mainmenu" %}
        <div class="site-options">
           {% include "Search" %}
           {% include "Langmenu" %}
        </div>
		</div>
		<!-- //header -->
		<div id="wrap">
			<div class="hgroup clear">
				<h1 id="logo" class="clear">{% editable site.header %}</h1>
				<h2>{% editable article.title %}</h2>
                <div class="meta-data">{{article.created_at | format_date:"long"}} / <a href="#comments">{% case article.comments_count %}{% when 0 %}{{"no_comments"|lc}}{% else %}{{"comments_for_count"|lc}}: <span class="edy-site-blog-comments-count">
       {{article.comments_count}}</span>{% endcase %}</a></div>
			</div>
			<div id="content-wrap" class="clear">
                <div class="left-column clear">
				<div class="excerpt" data-search-indexing-allowed="true">{% editable article.excerpt %}</div>
				<div data-search-indexing-allowed="true">{% editable article.body %}</div>
						

            {% if editmode %}
                <div class="article-tags">
                    <div class="article-tag-icon"></div>
                    {% editable article.tags %}
                </div>
              {% else %}
                {% unless article.tags == empty %}
                    <div class="cfx article-tags">
                        <div class="article-tag-icon"></div>
                        {% for tag in article.tags %}
                            <a href="{{ article.page.url }}/tagged/{{ tag.path }}">{{ tag.name }}</a>{% unless forloop.last %}, {% endunless %}
                        {% endfor %}
                    </div>
                {% endunless %}
            {% endif %}

    <div id="comments">
    <h2>{% case article.comments_count %}{% when 0 %}{{"no_comments"|lc}}{% else %}{{"comments_for_count"|lc}}: <span class="edy-site-blog-comments-count">
       {{article.comments_count}}</span>{% endcase %}</h2>
    <ul>
    {% for comment in article.comments %}
      <li class="edy-site-blog-comment">
        <p><span class="comment-author">{{comment.author}}</span> <span class="date">{{comment.created_at | format_date:"short"}}</span>{% removebutton %}</p>
        <div class="comment"> {{comment.body_html}}</div>
      </li>
      {% endfor %}
    </ul>
  </div>
  <!-- //comments -->


  <div id="comment-form">
    <h2>{{"add_a_comment"|lc}}</h2>
    {% commentform %}
    {% unless comment.valid? %}<ul>
    {% for error in comment.errors %}
    <li>{{ error | lc }}</li>
    {% endfor %}
    </ul>{% endunless %}
     <div class="form_field">
        <label for="commentform-name">{{"name"|lc}}</label>
        <input type="text" class="form_field_textfield" id="commentform-name" value="{{comment.author}}" name="comment[author]" />
     </div>
     <div class="form_field">
        <label for="commentform-email">{{"email"|lc}}</label>
        <input type="text" class="form_field_textfield" id="commentform-email" value="{{comment.author_email}}" name="comment[author_email]" />
     </div>
     <div class="form_field">
        <label for="commentform-body">{{"comment"|lc}}</label>
        <textarea class="form_field_textarea" rows="4" cols="62" name="comment[body]">{{comment.body}}</textarea>
     </div>
     <div class="form_submit">
        <input type="submit" class="submit" value="{{"submit"|lc}}" />
     </div>
    {% endcommentform %}
  </div>
  <!-- //comment-form -->
</div>
		
	<div class="right-column">
		<div id="dark-box" class="no-border">
			<div class="heading">{{"latest_news"|lc}}</div>
			<ul class="clear" id="submenu">
             {% for article in site.latest_articles %}
				<li><a href="{{article.url}}"><span class="article-head">{{article.title}}</span></a><span class="date2">{{article.created_at | format_date:"%d.%m"}}</span></li>
            {% endfor %}
            </ul>
		</div>
    </div>
			</div>
			<!-- //content-wrap -->
			{% include "Footer" %}
		</div><!-- //wrap -->
		{% include "JS" %}
	</body>
</html>