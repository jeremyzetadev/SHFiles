
#!/bin/bash

SESH="tmux_session"

tmux has-session -t $SESH 2>/dev/null

if [ $? != 0 ]; then
	tmux new-session -d -s $SESH -n "network"

	tmux send-keys -t $SESH:network "cd ~/Documents/SampleProjects/C_Networking/groupchat/" C-m
	tmux send-keys -t $SESH:network "nvim server.c" C-m
	
	tmux new-window -t $SESH -n "SDL2Game"
	tmux send-keys -t $SESH:SDL2Game "cd ~/Documents/SampleProjects/C_SDL2_Game/" C-m
	tmux send-keys -t $SESH:SDL2Game "nvim src/main.c" C-m

	tmux new-window -t $SESH -n "SDL2Lib"
	tmux send-keys -t $SESH:SDL2Lib "cd ~/Documents/SampleProjects/C_SDL2/" C-m
	tmux send-keys -t $SESH:SDL2Lib "nvim 09_music-and-icon.c" C-m

	tmux new-window -t $SESH -n "OpenGL"
	tmux send-keys -t $SESH:OpenGL "cd ~/Documents/SampleProjects/CPP_OpenGL_Practice2/" C-m
	tmux send-keys -t $SESH:OpenGL "nvim main.cpp" C-m

	# tmux new-window -t $SESH -n "server"
	# tmux send-keys -t $SESH:server "cd ~/Documents/SampleProjects/my_proj/" C-m
	# tmux send-keys -t $SESH:server "npm run dev" C-m
	tmux select-window -t $SESH:network
fi

tmux attach-session -t $SESH
