=================
Présentation CORS
=================

Présentation du 9 janvier 2018 sur le fonctionnement de CORS_ et les risques d'une mauvaise compréhension. La 
présentation aborde de manière synthétique CORS et montre le risque principal d'une mauvaise utilisation.

Dépôt Git
=========

Le dépôt contient les supports de présentation, le code serveur en python et le code client en elm_. Pour chaque étape 
de code vous pouvez utiliser les tags du dépôt::

   $ git tag
   step_1
   step_2
   step_3
   $ git checkout step_1


Serveur
=======

Le code serveur est en python dans le fichier *server.py*. Pour faire fonctionner le serveur vous avez besoin de python 
3.x et d'installer les requirements::

   pip install -r requirements.txt

L'utilisation d'un environnement virtuel_ est recommandé.

Pour faire tourner le serveur, utilisez gunicorn (dans les requirements)::

   gunicorn -b 0.0.0.0:8888 --reload server:api


Client
======

Le code client est en elm_, c'est un langage qui génére du code javascript, html et css. Il est possible d'utiliser 
elm-reactor_ pour faire tourner le client sur son propre serveur. Pour cela il suffit d'appeler le fichier *Main.elm* 
dans le navigateur::

   elm-reactor -p 8080


Présentation
============

La présentation est faite avec revealjs_. Elle peut être appelée dans un navigateur par son chemin physique sur le 
disque ou en utilisant un serveur http::

   python -m http.server


.. _CORS: https://www.w3.org/TR/cors/
.. _virtuel: http://virtualenvwrapper.readthedocs.io/en/latest/
.. _elm: http://elm-lang.org/
.. _elm-reactor: https://github.com/elm-lang/elm-reactor
.. _revealjs: https://revealjs.com/#/
