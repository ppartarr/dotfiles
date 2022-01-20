#!/bin/bash

SESSION="infra"
tmux kill-session -t $SESSION

tmux new-session -d -s 'infra' -x 252 -y 29
tmux select-layout tiled
tmux split-window -t $SESSION:1.1 -h
tmux split-window -t $SESSION:1.2 -h
tmux split-window -t $SESSION:1.3 -h
tmux split-window -t $SESSION:1.4 -h
tmux split-window -t $SESSION:1.5 -h
tmux split-window -t $SESSION:1.6 -h
tmux split-window -t $SESSION:1.7 -h
tmux split-window -t $SESSION:1.8 -h
tmux select-layout even-horizontal
tmux split-window -t $SESSION:1.9 -h
tmux select-layout even-horizontal
tmux split-window -t $SESSION:1.10 -h
tmux select-layout even-horizontal
tmux split-window -t $SESSION:1.11 -h
tmux select-layout even-horizontal
tmux split-window -t $SESSION:1.12 -h
tmux select-layout even-horizontal
#tmux next-layout -t $SESSION
tmux select-layout tiled

tmux send-keys -t $SESSION:1.1 "ssh updates" Enter
tmux send-keys -t $SESSION:1.2 "ssh go" Enter
tmux send-keys -t $SESSION:1.3 "ssh build" Enter
tmux send-keys -t $SESSION:1.4 "ssh log" Enter
tmux send-keys -t $SESSION:1.5 "ssh logger" Enter
tmux send-keys -t $SESSION:1.6 "ssh monitoring" Enter
tmux send-keys -t $SESSION:1.7 "ssh go" Enter
tmux send-keys -t $SESSION:1.8 "ssh docker" Enter
tmux send-keys -t $SESSION:1.9 "ssh lic" Enter
tmux send-keys -t $SESSION:1.10 "ssh kubera" Enter
tmux send-keys -t $SESSION:1.11 "ssh ravana" Enter
tmux send-keys -t $SESSION:1.11 "ssh hub" Enter
# tmux send-keys -t $SESSION:1.12 "ssh hubtest" Enter
# tmux send-keys -t $SESSION:1.13 "ssh winhub" Enter

tmux attach-session -t $SESSION
