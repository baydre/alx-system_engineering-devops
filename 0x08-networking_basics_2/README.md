# 0x08-networking_basics_2
## Learning Objectives
At the end of this project, the following concepts below were explained and understood.
- What is `localhost/127.0.0.1`.
<br> localhost, a hostname that refers to the current computer used to access it.
- What is `0.0.0.0`
<br> This is a non-routable address that describes an invalid, unknown or non-applicable target.
- What is `/etc/hosts`
<br> This was used to translate the IP addressed (8.8.8.8) to human-readable form (www.google.com) in the earlier days.
- How to display a machine's active network interfaces
<br> `ifconfig | grep 'inet ' | awk '{print$2}'`