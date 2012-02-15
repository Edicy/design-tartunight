{% if editmode %}
<div id="langmenu">
<span id="langmenu-inner">{% for language in site.languages %}{%if language.selected? %}{{language.title}}{% endif %}{% endfor %}{{page.language_title}}</span>
<select id="langmenu-select">{% for language in site.languages %}
<option value="{{language.url}}" {% if language.selected? %}selected="selected"{% endif %}>{{language.title}}</option>
{% endfor %}
</select>
</div>
<div class="add-lang">{% languageadd %}</div>
{% else %}
{% if site.has_many_languages? %}
<div id="langmenu">
<span id="langmenu-inner">{% for language in site.languages %}{%if language.selected? %}{{language.title}}{% endif %}{% endfor %}{{page.language_title}}</span>
<select id="langmenu-select">{% for language in site.languages %}
<option value="{{language.url}}" {% if language.selected? %}selected="selected"{% endif %}>{{language.title}}</option>
{% endfor %}
</select>
</div>
{% endif %}{% endif %}