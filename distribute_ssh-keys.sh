for host in node1.fq.dn \
    node2.fq.dn \
    node3.fq.dn; \
    do ssh-copy-id -i ~/.ssh/id_rsa.pub $host; \
    done
