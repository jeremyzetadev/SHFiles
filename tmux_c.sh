#!/bin/bash

SESH="my_tmux_session"

tmux has-session -t $SESH 2>/dev/null

if [ $? != 0]; then
	tmux new-session -d -s $SESH -n "arrptr"
	tmux send-keys -t $SESH:arrptr "cd ~/Documents/SampleProjects/c_Ptr_Mem_Obj/advanced_pointers/array_of_pointers/" C-m
	tmux send-keys -t $SESH:arrptr "nvim arrPtr.c" C-m
	
	tmux new-session -d -s $SESH -n "ptrptr"
	tmux send-keys -t $SESH:arrptr "cd ~/Documents/SampleProjects/c_Ptr_Mem_Obj/advanced_pointers/pointer_pointer/" C-m
	tmux send-keys -t $SESH:arrptr "nvim pointer_pointer.c" C-m
	
	tmux new-session -d -s $SESH -n "strcpy"
	tmux send-keys -t $SESH:arrptr "cd ~/Documents/SampleProjects/c_Ptr_Mem_Obj/simple/charArray/" C-m
	tmux send-keys -t $SESH:arrptr "nvim charStrcpy.c" C-m
	
	tmux new-session -d -s $SESH -n "ptrheap"
	tmux send-keys -t $SESH:arrptr "cd ~/Documents/SampleProjects/c_Ptr_Mem_Obj/simple/ptr_in_heap/" C-m
	tmux send-keys -t $SESH:arrptr "nvim ptr_in_heap.c" C-m
	
	#tmux new-session -d -s $SESH -n "server
	#tmux send-keys -t $SESH:arrptr "cd ~/Documents/SampleProjects/my_proj/" C-m
	#tmux send-keys -t $SESH:arrptr "npm run dev" C-m
fi

tmux attach-session -t $SESH