Configure the variable in `playbooks/variables.yaml` and configure the `hosts.yaml`

Test pinging the nodes
```
ansible all -m ping
```

Run the playbook
```
ansible-playbook playbooks/containerd-1.24.6.yaml
```

List tags
```
ansible-playbook playbooks/containerd-1.24.6.yaml --list-tags
```

Use tags
```
ansible-playbook playbooks/containerd-1.24.6.yaml --tags cleanup
```
