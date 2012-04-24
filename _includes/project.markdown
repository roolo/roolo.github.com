<section>
	<h3 id="{{name_id}}">{{name}}</h3>
	<div class="project-info">
		<div class="row project-overview">
			<div class="span5">
        {{perex | markdownify}}
      </div>
      <div class="span1">
  			<img class="project-screenshot" src="/images/projects/{{image_name}}.png" />
      </div>
		</div>
		{{description | markdownify}}
		<table class="table table-condensed">
			<tr><th>Kód</th><td><a href="{{url_code}}">{{url_code}}</a></td></tr>
			<tr><th>Vyzkoušejte</th><td><a href="{{url_app}}">{{url_app}}</a></td></tr>
			<tr><th>Technologie</th><td><a href="{{url_app}}">{{technologies}}</a></td></tr>
		</table>
	</div>
  <a href="#overview">&#x2191; Nahoru</a>
	<hr />
</section>
