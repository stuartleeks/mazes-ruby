help: ## show this help
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%s\033[0m|%s\n", $$1, $$2}' \
	| column -t -s '|'


ROWS?=5
COLUMNS?=5

binary_tree: ## demo binary tree
	ROWS=${ROWS} COLUMNS=${COLUMNS} ruby -I. binary_tree_demo.rb

sidewinder: ## demo Sidewinder
	ROWS=${ROWS} COLUMNS=${COLUMNS} ruby -I. sidewinder_demo.rb

dijkstra: ## demo Dijkstra
	ROWS=${ROWS} COLUMNS=${COLUMNS} ruby -I. dijkstra_demo.rb

longest_path: ## demo longest path search
	ROWS=${ROWS} COLUMNS=${COLUMNS} ruby -I. longest_path_demo.rb
longest_path2: ## demo longest path search (show start/end)
	ROWS=${ROWS} COLUMNS=${COLUMNS} ruby -I. longest_path2_demo.rb
