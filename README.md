namegen
=======

NAME
----
namegen - a random name generator

SYNOPSIS
--------
``namegen.sh [amount] [gender]``

DESCRIPTION
-----------
Generates ``amount`` (default: 10) names of the specified ``gender`` (default: b).

Valid ``gender``s are *b*oth, *f*emale, *m*ale. Female/male will ony generate
female/male names. If both is specified a random split is chosen and upto this
split female names are generated, the remaining names are male.

EXAMPLE
-------

Generate 10 name of both genders:

	namegen.sh

Generate a single male name:

	namegen.sh 1 m

Generate a single female name:

	namegen.sh 1 f


GETTING DATA
------------
Because the author does not own any rights to distribute the data. You have to
get data somewhere. Fortunately, you may use the census data from 1990, provided
by <http://deron.meranda.us/data/>.

To use the census-90 data you may just run the ``get-data-census90.sh`` script.

CONFIGURATION
-------------
You may want to adjust the config section in the script file to your needs.

Because of the circumstance, that the generator uses just three list files (one
item per line), you can provide what ever data you want.

AUTHORS
-------
Sebastian Claus <sc@inferum.net>


