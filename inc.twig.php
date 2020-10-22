<?php
	//On inclut Autoloader qui permet de charger nos autres pages
	include_once('lib/Twig/Autoloader.php');

	//Charge les classes Twig
	Twig_Autoloader::register();

	//On charge les fichiers .tpl du dossier templates
	$templates = new Twig_Loader_Filesystem('templates');

	//Object central du moteur Twig a chaque création d'appplication effectué avec le moteur Twig
	//celui-ci crée un environement qui permet d'avoir un loader qui permet lui de charger les templates
	$twig      = new Twig_Environment($templates);//
 