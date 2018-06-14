# NodeBB needs a database to install plugins, so we have to do this at runtime rather
# than compile time. Lame.

./nodebb activate nodebb-plugin-composer-default
./nodebb activate nodebb-plugin-custom-pages
./nodebb activate nodebb-plugin-dbsearch
./nodebb activate nodebb-plugin-markdown
./nodebb activate nodebb-plugin-mentions
./nodebb activate nodebb-plugin-poll
./nodebb activate nodebb-rewards-essentials
./nodebb activate nodebb-widget-essentials
./nodebb activate nodebb-theme-themanadrain
