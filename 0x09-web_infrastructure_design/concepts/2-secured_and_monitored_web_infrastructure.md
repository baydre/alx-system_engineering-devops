## 2.Secured and Monitored Web Infrastructure
A three server web infrastructure that hosts the website www.foobar.com, it must be secured, serve encrypted traffic, and be monitored.<br><br>![Secured and Monitored Web Infrastructure](../images/secured_&_monitored_web_infrastructure.png)<br><br>
## How It Works
In this design a secure HTTP (HTTPS) connection with an SSL Certificate, firewalls and monitoring services were added to [Distributed Web Infrastructure](https://github.com/baydre/alx-system_engineering-devops/blob/master/0x09-web_infrastructure_design/concepts/1-distributed_web_infrastructure.md). The goal is to ensure that the infrastructure secured with an encrypted traffic and data are collected. <br><br> **Firewalls** are network security systems that monitor and control incoming and outgoing network traffic based on predetermined security rules. They act as a barrier between the internal network and the internet, preventing unauthorized access to the network while allowing legitimate traffic to pass through.

**SSL certificates** are digital certificates that establish a secure connection between a web server and a browser. They encrypt the data transmitted between the two, ensuring that sensitive information such as login credentials, credit card numbers, etc., cannot be intercepted by third parties.

**Monitoring clients** are software agents that monitor the performance and availability of web applications and services. They collect data on various metrics such as response time, uptime, error rates, etc., and alert system administrators in case of any anomalies or issues.

## Issues with the Secured and Monitored Web Infrastructure
**Why terminating SSL at the load balancer level is an issue**. Terminating SSL at the load balancer level can be an issue because it leaves the traffic between the load balancer and the app servers unencrypted. This could leave the app servers vulnerable to packet sniffing or ARP poisoning.

**Why having only one MySQL server capable of accepting writes is an issue**. Having only one MySQL server capable of accepting writes is an issue because it can lead to data inconsistency. If multiple servers accept writes, you’re into the multimaster scenarios that come with scalability issues and data consistency problem.

**Why having servers with all the same components (database, web server and application server) might be a problem**. Having servers with all the same components (database, web server, and application server) might be a problem because it can lead to a single point of failure. If one component fails, it could bring down the entire system. It’s best to have redundancy in place to ensure high availability and fault tolerance.