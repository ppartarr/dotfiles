#!/bin/bash

session="aws"
tmux kill-session -t $session
tmux new-session -d -s $session

ips=$(aws ec2 describe-instances --filter "Name=tag-value,Values=opti-servers" --query 'Reservations[*].Instances[*].[PrivateIpAddress]' --output text)
for ip in $ips; do
  echo $ip
  if [[ "$ip" != "None" ]]; then
    echo "ssh ec2-user@$ip"
    tmux send-keys -t $session:$logs "ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no ec2-user@$ip" Enter
    tmux send-keys -t $session:$logs "sudo su" Enter
    tmux send-keys -t $session:$pgre "cd /root" Enter
    tmux send-keys -t $session:$logs "tail -f run.log" Enter
    tmux split-window -h -t $session
  fi
done

tmux attach-session -t $session
