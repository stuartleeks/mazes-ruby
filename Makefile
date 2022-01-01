help: ## show this help
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%s\033[0m|%s\n", $$1, $$2}' \
	| column -t -s '|'


ROWS?=4
COLUMNS?=4

binary_tree: ## demo binary tree
	ROWS=${ROWS} COLUMNS=${COLUMNS} ruby -I. binary_tree_demo.rb

sidewinder: ## demo Sidewinder
	ROWS=${ROWS} COLUMNS=${COLUMNS} ruby -I. sidewinder_demo.rb

dijkstra: ## demo Dijkstra
	ROWS=${ROWS} COLUMNS=${COLUMNS} ruby -I. dijkstra_demo.rb
