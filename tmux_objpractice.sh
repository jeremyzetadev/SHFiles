
#!/bin/bash

SESH="tmuxsesh"

tmux has-session -t $SESH 2>/dev/null

if [ $? != 0 ]; then
	tmux new-session -d -s $SESH -n "js_game"

	tmux send-keys -t $SESH:js_game "cd ~/Documents/SampleProjects/Javascript_Game/" C-m
	tmux send-keys -t $SESH:js_game "nvim script.js" C-m
	
	tmux new-window -t $SESH -n "js_mvc"
	tmux send-keys -t $SESH:js_mvc "cd ~/Documents/Projects/express_mvc-main/" C-m
	tmux send-keys -t $SESH:js_mvc "nvim controllers/employeesController.js" C-m

	tmux new-window -t $SESH -n "c_game"
	tmux send-keys -t $SESH:c_game "cd ~/Documents/SampleProjects/C_SDL2_Game/" C-m
	tmux send-keys -t $SESH:c_game "nvim src/main.c" C-m

	# tmux new-window -t $SESH -n "server"
	# tmux send-keys -t $SESH:server "cd ~/Documents/SampleProjects/my_proj/" C-m
	# tmux send-keys -t $SESH:server "npm run dev" C-m
	tmux select-window -t $SESH:js_game
fi

tmux attach-session -t $SESH
