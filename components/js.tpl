<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="{{ site.static_asset_host }}/libs/picturefill/latest/picturefill.min.js"></script>
<script type="text/javascript">
$(function() {  
  $('#langmenu select').change(function() { window.location = $(this).find(':selected').val(); });
})
</script>
{% if site.search.enabled %}
    <script type="text/javascript" src="{{ site.static_asset_host }}/assets/site_search/3.0/site_search.js?2"></script>
    <script type="text/javascript">
        var edys_site_search_options = {
           texts: {
             noresults: "{{ "search_noresults"|lc }}"
           },
           default_stylesheet_enabled: false,
           popup_css_positioning: 'fixed',
           popup_position: 'bottom',
           init_complete: function($){
            		$('#search').bind('beforeSearch', function() {
						$(this).find('.loading-icon').show();
					});
					$('#search').bind('afterSearch', function() {
						$(this).find('.loading-icon').hide();
					});
		    }
        }      
    	$('#search-btn').click(function() {
				$('#search').slideToggle(300);
				$(this).toggleClass('active');
				return false;
		});
    </script>
{% endif %}
<script type="text/javascript">
        var resize_header = function () {
        var header = $('#header');
		    if (header.height() < 50 ) {
		      header.css({'position':'fixed', 'top': 0, 'left': 0, 'width' : '100%'});
              $('#wrap').css('padding-top','92px');
		    }
		}
		$(window).bind('resize', resize_header);
        resize_header();
</script>
{% unless editmode %}{{site.analytics}}{% endunless %}