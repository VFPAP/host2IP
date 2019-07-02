# host2IP
Takes a list of hosts (one per line) and outputs the corresponding IP address.
Usefull when dealing with an output from [Sublist3r](https://github.com/aboul3la/Sublist3r) to know which hosts still resolve to an IP address.

## Usage
(Version 2)

### Oneliner
(Make sure to wait a couple of seconds after executing the command to give time for threads to finish)

```
rm -f host2IP; read -p "Domain: " domain; task(){ result=$(host $site | grep "has.*address" | tr -d "\n"); host=$(echo $result | cut -d " " -f1); add=$(echo $result | rev | cut -d " " -f1 | rev); if echo "$host" | grep "${domain}$" > /dev/null; then echo "$host ==> $add" >> host2IP;fi; };while read site;do (task $site &) done < hosts_file
```

### Script
(Make sure it's executable - sudo chmod +x resolv2IP_v2.sh)

```
./resolv2IP_v2.sh hosts_file
```



## Author
**Vasco Pinto**
<br>Twitter: [@0xVFPAP](https://twitter.com/0xVFPAP)
<br>LinkedIn: [Vasco Pinto](https://linkedin.com/in/vascopinto97)
<br>OpenBugBounty: [VFPAP](https://www.openbugbounty.org/researchers/VFPAP)
