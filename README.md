## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![TODO: Update the path with the name of your diagram](ELK_Stack/README/Images/12_Cloud_Security_Diagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the _____ file may be used to install only certain pieces of it, such as Filebeat.

  - _TODO: Enter the playbook file._
  * install-elk.yml

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting attacks to the network.
- _TODO: What aspect of security do load balancers protect? What is the advantage of a jump box?_
* Load balancers protect against DDos attacks bt distributing the traffic across multiple serves, ensuring that if one is taken offline the website or webapp maintains online as a whole.
* The main advantage of having a jumpbox server is having a single source that can be used to configure and push updates to all the other serves. Meaning the Admin doesn't have to log into each server to apply changes but instead can do them all from one location in a single push.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the log files and system files.
- _TODO: What does Filebeat watch for?_
* Filebeat monitors log events and files
- _TODO: What does Metricbeat record?_
* Metricbeat collects data from the operating system and running proccesses

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function       | IP Address | Operating System |
|----------|----------------|------------|------------------|
| Jump Box | Gateway        | 10.1.0.4   | Linux            |
| Web-1    | Webserver      | 10.1.0.5   | Linux            |
| Web-2    | Webserver      | 10.1.0.6   | Linux            |
| Web-3    | Webserver      | 10.1.0.7   | Linux            |
| ELK      | ELK Data store | 10.0.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the jumpbox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- _TODO: Add whitelisted IP addresses_
* Static VPN: 185.134.22.81
* Personal IP: 69.180.161.248

Machines within the network can only be accessed by SSH from jumpbox docker.
- _TODO: Which machine did you allow to access your ELK VM? What was its IP address?_
* jumpbox
* 10.1.0.5

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses            |
|----------|---------------------|---------------------------------|
| Jump Box | Yes                 | 185.134.22.81 69.180.161.248    |
| Web-1    | No                  | 10.1.0.5                        |
| Web-2    | No                  | 10.1.0.5                        |
| Web-3    | No                  | 10.1.0.5                        |
| ELK      | No                  | 10.1.0.5                        |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- _TODO: What is the main advantage of automating configuration with Ansible?_
* Ansibles biggest advantage is being able to deploy multiple updates and configurations across a number of machines at once, instead of manually installing each action individually.

The playbook implements the following tasks:
- _TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
* increase the memory use
* uninstall apache
* install docker
* install python3
* install docker python modle
* installation of docker web container
* configure docker to launch on boot up

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![TODO: Update the path with the name of your screenshot of docker ps output](ELK_Stack/README/Images/docker_ps.PNG)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- _TODO: List the IP addresses of the machines you are monitoring_
* web-1 IP: 10.1.0.5
* web-2 IP: 10.1.0.6
* web-3 IP: 10.1.0.7

We have installed the following Beats on these machines:
- _TODO: Specify which Beats you successfully installed_
* Metricbeats 
* Filebeats

These Beats allow us to collect the following information from each machine:
- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._
* Filebeat collects log files, including system logs and error used to ensure the integrity of a server.
* Metricbeat collects data on the OS and running services, an example would be current memory usage.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the id_rsa.pub file to your jumpbox.
- Update the ansible hosts file to include your ELK VM's IP
- Run the playbook, and navigate to http://10.0.0.4:5601/app/kibana to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_
* Run the install-elk.yml file on your jumpbox vm from inside your docker from path ~/etc/ansible/install-elk.yml
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
* Update your hosts file, this needs to have an [elk] section with your ELK VM's IP followed by ansible_python_interpreter=/usr/bin/python3
* Upadte the install-elk.yml file. Under the Configure ELK VM with Docker section make sure "hosts" is set to "elk"
- _Which URL do you navigate to in order to check that the ELK server is running?_
* http://10.0.0.4:5601/app/kibana

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
