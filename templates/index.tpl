<!-- On charge la page top.tpl qui correspond à la définition du head et du html. -->
{{ include('top.tpl') }}

<!--Correspond à l'animation du soleil -->
<div class="preloader">
	<div class="preloader-top">
		<div class="preloader-top-sun">
			<div class="preloader-top-sun-bg"></div>
			<div class="preloader-top-sun-line preloader-top-sun-line-0"></div>
			<div class="preloader-top-sun-line preloader-top-sun-line-45"></div>
			<div class="preloader-top-sun-line preloader-top-sun-line-90"></div>
			<div class="preloader-top-sun-line preloader-top-sun-line-135"></div>
			<div class="preloader-top-sun-line preloader-top-sun-line-180"></div>
			<div class="preloader-top-sun-line preloader-top-sun-line-225"></div>
			<div class="preloader-top-sun-line preloader-top-sun-line-270"></div>
			<div class="preloader-top-sun-line preloader-top-sun-line-315"></div>
		</div>
	</div>
	<div class="preloader-bottom">
		<div class="preloader-bottom-line preloader-bottom-line-lg"></div>
		<div class="preloader-bottom-line preloader-bottom-line-md"></div>
		<div class="preloader-bottom-line preloader-bottom-line-sm"></div>
		<div class="preloader-bottom-line preloader-bottom-line-xs"></div>
	</div> 
</div>

<!-- Contenu principal de la page -->
<div class="wrapper">
	<section class="bordure">
	    <p>Météo</p>
	</section>

	<section class="contenu">

        <!-- On récupère le nom de la ville, du pays ainsi que les cordonnées GPS de celle ci -->
	    <h1>
	    	{{_ville|capitalize}}, {{_ville2.country|upper}} 
	    	<a href="http://maps.google.com/maps?q={{_ville2.coord.lat}},{{_ville2.coord.lon}}" class="lk" target="_blank" title="Voir sur une carte">
	    		Voir sur une carte
	    	</a>
	    </h1>

        <!-- On ajoute la fin qui manque %} -->
        <!-- Boucle permettant de récupérer et afficher différentes informations météorologique pour les jours qu'on a prévu -->
	    {% for journee in _journees_meteo %}
	    	<div class="jour">

                <!-- On affiche la date -->
	    		<div class="numero_jour">
	    			<h2>Météo du {{journee.dt|date('d/m/Y')}}</h2>
	    		</div>

                <!-- On affiche la température -->
			    <div class="temperature {{journee.meteo}}">
			      <h2>{{journee.temp.day}}<span class="degree-symbol">°</span>C</h2>
			    </div>
			    <ul>

                <!-- On affiche la vitesse du vent -->
			      <li class="fontawesome-leaf left">
			        <span>{{journee.speed}} km/h</span>
			      </li>

                  <!-- On affiche le taux d'humidité -->
			      <li class="fontawesome-tint center">
			        <span>{{journee.humidity}}%</span>
			      </li>

                  <!-- On affiche la pression atmosphérique -->
			      <li class="fontawesome-dashboard right">
			        <span>{{journee.pressure}}</span>
			      </li>
			    </ul> 

                <!-- On affiche une courte description de la méteo, comme pluie, beau temps... -->
			    <div class="description">
			    	Description : {{journee.weather|first.description|capitalize}}
			    </div>
			</div>
	    {% endfor %}

        <!-- Boucle permettant d'afficher le nombre de point en fonction du nombre de jours choisi pour les prévisions -->
	    <div class="bullets">
	    	{% for i in 1..n_jours_previsions %}
	    		<span class="entypo-record" data-cible="{{i-1}}"></span>
	    	{% endfor %}
	    </div>

	</section>
</div>

<!-- ajout 'include' à la place de incle -->
<!-- On charge la page bottom.tpl qui correspond à l'appelle des scripts et la fermeture des des balise body et html -->
{{ include('bottom.tpl') }}
