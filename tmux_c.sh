
#!/bin/bash

SESH="tmux_session"

tmux has-session -t $SESH 2>/dev/null

if [ $? != 0 ]; then
	tmux new-session -d -s $SESH -n "arrptr"

	tmux send-keys -t $SESH:arrptr "cd ~/Documents/SampleProjects/c_Ptr_Mem_Obj/advanced_pointers/array_of_pointers/" C-m
	tmux send-keys -t $SESH:arrptr "nvim arrPtr.c" C-m
	
	tmux new-window -t $SESH -n "ptrptr"
	tmux send-keys -t $SESH:ptrptr "cd ~/Documents/SampleProjects/c_Ptr_Mem_Obj/advanced_pointers/pointer_pointer/" C-m
	tmux send-keys -t $SESH:ptrptr "nvim pointer_pointer.c" C-m

	tmux new-window -t $SESH -n "strcpy"
	tmux send-keys -t $SESH:strcpy "cd ~/Documents/SampleProjects/c_Ptr_Mem_Obj/simple/charArray/" C-m
	tmux send-keys -t $SESH:strcpy "nvim charStrcpy.c" C-m

	tmux new-window -t $SESH -n "ptrheap"
	tmux send-keys -t $SESH:ptrheap "cd ~/Documents/SampleProjects/c_Ptr_Mem_Obj/simple/ptr_in_heap/" C-m
	tmux send-keys -t $SESH:ptrheap "nvim ptr_in_heap.c" C-m

	# tmux new-window -t $SESH -n "server"
	# tmux send-keys -t $SESH:server "cd ~/Documents/SampleProjects/my_proj/" C-m
	# tmux send-keys -t $SESH:server "npm run dev" C-m
	tmux select-window -t $SESH:arrptr
fi

tmux attach-session -t $SESH
