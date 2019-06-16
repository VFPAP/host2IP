# host2IP
Takes a list of hosts (one per line) and outputs the corresponding IP address.
Usefull when dealing with an output from [Sublist3r](https://github.com/aboul3la/Sublist3r) to know which hosts still resolve to an IP address.

## Usage

### Oneliner

```
i=1;rm -f host2IP;while read site;do host=$(host $site | grep -v "not found" |tr '\n' ' '| cut -d " " -f1); add=$(host $site | grep -v "not found" |tr '\n' ' '|cut -d " " -f4); [ ! -z "$host" ] && echo "$host ==> $add" >> host2IP;echo $i / $(wc -l /dev/stdin|cut -d " " -f1);let "i++";done < hosts_file
```

### Script
(Make sure it's executable - sudo chmod +x resolv2IP.sh)

```
./resolv2IP.sh hosts_file
```



## Author
**Vasco Pinto**
<br>Twitter: [@0xVFPAP](https://twitter.com/0xVFPAP)
<br>LinkedIn: [Vasco Pinto](https://linkedin.com/in/vascopinto97)
<br>OpenBugBounty: [VFPAP](https://www.openbugbounty.org/researchers/VFPAP)
