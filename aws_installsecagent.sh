#!/bin/bash

echo "===================================================="
echo "GLOBE DSG INFRASTRUCTURE"
echo "WELCOME! DSG INSTALLATION OF SEC-AGENTS"
echo "==================================================="
echo

sudo mkdir /tmp/secagents
sudo chmod 777 -R /tmp/secagents
sudo mv ./security-agent-2021 /tmp/secagents
cd /tmp/secagents

#INSTANCE_IDINFO=$(cat ec2instanceid.txt)

if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$NAME
    VER=$VERSION_ID
    ID_OS=$ID
    OS_VER="${VER:0:2}"
    OS_VER_AMZ="${VER:0:4}"
    echo $NAME "$OS_VER" 
    

    if [ $ID == "centos" ] && [ $OS_VER -eq "7" ]
    then
        cd /tmp/secagents/security-agent-2021/Installers/
        #Installation of Deepsec
        cd /tmp/secagents/security-agent-2021/Installers
        sudo chmod a+x /tmp/secagents/security-agent-2021/Installers/DVAgentDeploymentScript.sh
        sudo /tmp/secagents/security-agent-2021/Installers/./DVAgentDeploymentScript.sh
        cd /tmp/secagents/security-agent-2021/Installers/
        #Install Crowdstrike
        sudo yum install -y libnl-genl-3-200
        sudo rpm -i falcon-sensor-6.14.0-11110.amzn2.x86_64.rpm
        sudo /opt/CrowdStrike/falconctl -s --cid="8C81692122F14CE8BA112211F6B3A09A-41"
        sudo /opt/CrowdStrike/falconctl -s --aph=10.225.208.170 --app=8090
        sudo /opt/CrowdStrike/falconctl -s --apd=FALSE
        sudo /opt/CrowdStrike/falconctl -g --aph --app --apd
        sudo service falcon-sensor start
        #Install Nessus
        sudo rpm -i NessusAgent-7.7.0-amzn.x86_64.rpm
        #Move and extract Splunk
        sudo mkdir /opt/agent-installer
        sudo mkdir /opt/agent-installer/splunk
        sudo chmod 777 -R /opt/agent-installer
        sudo mv splunkforwarder-7.0.0-c8a78efdd40f-Linux-x86_64.tgz /opt/agent-installer/splunk/
        cd /opt/agent-installer/splunk
        sudo tar -xvf splunkforwarder-7.0.0-c8a78efdd40f-Linux-x86_64.tgz
    fi

    if [ $ID == "ubuntu" ] && [ $OS_VER == "20" ]
    then
        cd /tmp/secagents/security-agent-2021/Installers/
        #Install Crowdstrike
        sudo apt-get install -y libnl-genl-3-200
        sudo dpkg -i falcon-sensor_6.14.0-11110_amd64.deb
        sudo /opt/CrowdStrike/falconctl -s --cid="8C81692122F14CE8BA112211F6B3A09A-41"
        sudo /opt/CrowdStrike/falconctl -s --aph=10.225.208.170 --app=8090
        sudo /opt/CrowdStrike/falconctl -s --apd=FALSE
        sudo /opt/CrowdStrike/falconctl -g --aph --app --apd
        sudo service falcon-sensor start
        #Install Nessus
        sudo dpkg -i NessusAgent-7.7.0-ubuntu1110_amd64.deb 
        #Move and extract Splunk
        sudo mkdir /opt/agent-installer
        sudo mkdir /opt/agent-installer/splunk
        sudo chmod 777 -R /opt/agent-installer
        sudo mv splunkforwarder-7.0.0-c8a78efdd40f-Linux-x86_64.tgz /opt/agent-installer/splunk/
        cd /opt/agent-installer/splunk
        sudo tar -xvf splunkforwarder-7.0.0-c8a78efdd40f-Linux-x86_64.tgz  
    fi


    if [ $ID == "ubuntu" ] && [ $OS_VER == "18" ]
    then
        cd /tmp/secagents/security-agent-2021/Installers/
        #Install Crowdstrike
        sudo apt-get install -y libnl-genl-3-200
        sudo dpkg -i falcon-sensor_6.14.0-11110_amd64.deb
        sudo /opt/CrowdStrike/falconctl -s --cid="8C81692122F14CE8BA112211F6B3A09A-41"
        sudo /opt/CrowdStrike/falconctl -s --aph=10.225.208.170 --app=8090
        sudo /opt/CrowdStrike/falconctl -s --apd=FALSE
        sudo /opt/CrowdStrike/falconctl -g --aph --app --apd
        sudo service falcon-sensor start
        #Install Nessus
        sudo dpkg -i NessusAgent-7.7.0-ubuntu1110_amd64.deb 
        #Move and extract Splunk
        sudo mkdir /opt/agent-installer
        sudo mkdir /opt/agent-installer/splunk
        sudo chmod 777 -R /opt/agent-installer
        sudo mv splunkforwarder-7.0.0-c8a78efdd40f-Linux-x86_64.tgz /opt/agent-installer/splunk/
        cd /opt/agent-installer/splunk
        sudo tar -xvf splunkforwarder-7.0.0-c8a78efdd40f-Linux-x86_64.tgz  
    fi



    if [ $ID == "ubuntu" ] && [ $OS_VER == "16" ]
    then
        cd /tmp/secagents/security-agent-2021/Installers/
        #Install Crowdstrike
        sudo apt-get install -y libnl-genl-3-200
        sudo dpkg -i falcon-sensor_6.14.0-11110_amd64.deb
        sudo /opt/CrowdStrike/falconctl -s --cid="8C81692122F14CE8BA112211F6B3A09A-41"
        sudo /opt/CrowdStrike/falconctl -s --aph=10.225.208.170 --app=8090
        sudo /opt/CrowdStrike/falconctl -s --apd=FALSE
        sudo /opt/CrowdStrike/falconctl -g --aph --app --apd
        sudo service falcon-sensor start
        #Install Nessus
        sudo dpkg -i NessusAgent-7.7.0-ubuntu1110_amd64.deb 
        #Move and extract Splunk
        sudo mkdir /opt/agent-installer
        sudo mkdir /opt/agent-installer/splunk
        sudo chmod 777 -R /opt/agent-installer
        sudo mv splunkforwarder-7.0.0-c8a78efdd40f-Linux-x86_64.tgz /opt/agent-installer/splunk/
        cd /opt/agent-installer/splunk
        sudo tar -xvf splunkforwarder-7.0.0-c8a78efdd40f-Linux-x86_64.tgz  
    fi



    if [ $ID == "ubuntu" ] && [ $OS_VER == "14" ]
    then
        cd /tmp/secagents/security-agent-2021/Installers/
        #Install Crowdstrike
        sudo apt-get install -y libnl-genl-3-200
        sudo dpkg -i falcon-sensor-5.33.0-9804.amzn1.x86_64
        sudo /opt/CrowdStrike/falconctl -s --cid="8C81692122F14CE8BA112211F6B3A09A-41"
        sudo /opt/CrowdStrike/falconctl -s --aph=10.225.208.170 --app=8090
        sudo /opt/CrowdStrike/falconctl -s --apd=FALSE
        sudo /opt/CrowdStrike/falconctl -g --aph --app --apd
        sudo service falcon-sensor start
        #Install Nessus
        sudo dpkg -i NessusAgent-7.7.0-ubuntu1110_amd64.deb 
        #Move and extract Splunk
        sudo mkdir /opt/agent-installer
        sudo mkdir /opt/agent-installer/splunk
        sudo chmod 777 -R /opt/agent-installer
        sudo mv splunkforwarder-7.0.0-c8a78efdd40f-Linux-x86_64.tgz /opt/agent-installer/splunk/
        cd /opt/agent-installer/splunk
        sudo tar -xvf splunkforwarder-7.0.0-c8a78efdd40f-Linux-x86_64.tgz   
    fi


    if [ $ID == "amzn" ] && [ $OS_VER_AMZ == "2018" ]
    then
        cd /tmp/secagents/security-agent-2021/Installers/
        #Install Crowdstrike
        sudo yum install -y libnl-genl-3-200
        sudo rpm -i falcon-sensor-5.33.0-9804.amzn1.x86_64
        sudo /opt/CrowdStrike/falconctl -s --cid="8C81692122F14CE8BA112211F6B3A09A-41"
        sudo /opt/CrowdStrike/falconctl -s --aph=10.225.208.170 --app=8090
        sudo /opt/CrowdStrike/falconctl -s --apd=FALSE
        sudo /opt/CrowdStrike/falconctl -g --aph --app --apd
        sudo service falcon-sensor start
        #Install Nessus
        sudo rpm -i NessusAgent-7.7.0-amzn.x86_64.rpm
        #Move and extract Splunk
        sudo mkdir /opt/agent-installer
        sudo mkdir /opt/agent-installer/splunk
        sudo chmod 777 -R /opt/agent-installer
        sudo mv splunkforwarder-7.0.0-c8a78efdd40f-Linux-x86_64.tgz /opt/agent-installer/splunk/
        cd /opt/agent-installer/splunk
        sudo tar -xvf splunkforwarder-7.0.0-c8a78efdd40f-Linux-x86_64.tgz
    fi

    if [ $ID == "amzn" ] && [ $OS_VER_AMZ == "2015" ]
    then
        cd /tmp/secagents/security-agent-2021/Installers/
        #Install Crowdstrike
        sudo yum install -y libnl-genl-3-200
        sudo rpm -i falcon-sensor-6.14.0-11110.amzn2.x86_64.rpm
        sudo /opt/CrowdStrike/falconctl -s --cid="8C81692122F14CE8BA112211F6B3A09A-41"
        sudo /opt/CrowdStrike/falconctl -s --aph=10.225.208.170 --app=8090
        sudo /opt/CrowdStrike/falconctl -s --apd=FALSE
        sudo /opt/CrowdStrike/falconctl -g --aph --app --apd
        sudo service falcon-sensor start
        #Install Nessus
        sudo rpm -i NessusAgent-7.7.0-amzn.x86_64.rpm
        #Move and extract Splunk
        sudo mkdir /opt/agent-installer
        sudo mkdir /opt/agent-installer/splunk
        sudo chmod 777 -R /opt/agent-installer
        sudo mv splunkforwarder-7.0.0-c8a78efdd40f-Linux-x86_64.tgz /opt/agent-installer/splunk/
        cd /opt/agent-installer/splunk
        sudo tar -xvf splunkforwarder-7.0.0-c8a78efdd40f-Linux-x86_64.tgz
    fi

    if [ $ID == "amzn" ] && [ $OS_VER_AMZ == "2017" ]
    then
        cd /tmp/secagents/security-agent-2021/Installers/
        #Install Crowdstrike
        sudo yum install -y libnl-genl-3-200
        sudo rpm -i falcon-sensor-6.14.0-11110.amzn2.x86_64.rpm
        sudo /opt/CrowdStrike/falconctl -s --cid="8C81692122F14CE8BA112211F6B3A09A-41"
        sudo /opt/CrowdStrike/falconctl -s --aph=10.225.208.170 --app=8090
        sudo /opt/CrowdStrike/falconctl -s --apd=FALSE
        sudo /opt/CrowdStrike/falconctl -g --aph --app --apd
        sudo service falcon-sensor start
        #Install Nessus
        sudo rpm -i NessusAgent-7.7.0-amzn.x86_64.rpm
        #Move and extract Splunk
        sudo mkdir /opt/agent-installer
        sudo mkdir /opt/agent-installer/splunk
        sudo chmod 777 -R /opt/agent-installer
        sudo mv splunkforwarder-7.0.0-c8a78efdd40f-Linux-x86_64.tgz /opt/agent-installer/splunk/
        cd /opt/agent-installer/splunk
        sudo tar -xvf splunkforwarder-7.0.0-c8a78efdd40f-Linux-x86_64.tgz
    fi

    if [ $ID == "amzn" ] && [ $OS_VER == "2" ]
    then
        cd /tmp/secagents/security-agent-2021/Installers/
        #Install Crowdstrike
        sudo yum install -y libnl-genl-3-200
        sudo rpm -i falcon-sensor-6.14.0-11110.amzn2.x86_64.rpm
        sudo /opt/CrowdStrike/falconctl -s --cid="8C81692122F14CE8BA112211F6B3A09A-41"
        sudo /opt/CrowdStrike/falconctl -s --aph=10.225.208.170 --app=8090
        sudo /opt/CrowdStrike/falconctl -s --apd=FALSE
        sudo /opt/CrowdStrike/falconctl -g --aph --app --apd
        sudo service falcon-sensor start
        #Install Nessus
        sudo rpm -i NessusAgent-7.7.0-amzn.x86_64.rpm
        #Move and extract Splunk
        sudo mkdir /opt/agent-installer
        sudo mkdir /opt/agent-installer/splunk
        sudo chmod 777 -R /opt/agent-installer
        sudo mv splunkforwarder-7.0.0-c8a78efdd40f-Linux-x86_64.tgz /opt/agent-installer/splunk/
        cd /opt/agent-installer/splunk
        sudo tar -xvf splunkforwarder-7.0.0-c8a78efdd40f-Linux-x86_64.tgz
    fi




    if [ $ID == "rhel" ] && [ $OS_VER == "7." ]
    then
        cd /tmp/secagents/security-agent-2021/Installers/
        #Install Crowdstrike
        sudo yum install -y libnl-genl-3-200
        sudo rpm -i falcon-sensor-6.14.0-11110.amzn2.x86_64.rpm
        sudo /opt/CrowdStrike/falconctl -s --cid="8C81692122F14CE8BA112211F6B3A09A-41"
        sudo /opt/CrowdStrike/falconctl -s --aph=10.225.208.170 --app=8090
        sudo /opt/CrowdStrike/falconctl -s --apd=FALSE
        sudo /opt/CrowdStrike/falconctl -g --aph --app --apd
        sudo service falcon-sensor start
        #Install Nessus
        sudo rpm -i NessusAgent-7.7.0-amzn.x86_64.rpm
        #Move and extract Splunk
        sudo mkdir /opt/agent-installer
        sudo mkdir /opt/agent-installer/splunk
        sudo chmod 777 -R /opt/agent-installer
        sudo mv splunkforwarder-7.0.0-c8a78efdd40f-Linux-x86_64.tgz /opt/agent-installer/splunk/
        cd /opt/agent-installer/splunk
        sudo tar -xvf splunkforwarder-7.0.0-c8a78efdd40f-Linux-x86_64.tgz
        
    fi



 
fi

    echo
    echo "Completed..."

# #DS AGENT
# ACTIVATIONURL='dsm://agents.deepsecurity.trendmicro.com:443/'
# MANAGERURL='https://app.deepsecurity.trendmicro.com:443'
# CURLOPTIONS='--silent --tlsv1.2'
# linuxPlatform='';
# isRPM='';

#     if [[ $(/usr/bin/id -u) -ne 0 ]]; then
#         echo You are not running as the root user.  Please try again with root privileges.;
#         logger -t You are not running as the root user.  Please try again with root privileges.;
#         exit 1;
#     fi;

#     if ! type curl >/dev/null 2>&1; then
#         echo "Please install CURL before running this script."
#         logger -t Please install CURL before running this script
#         exit 1
#     fi

#     CURLOUT=$(eval curl $MANAGERURL/software/deploymentscript/platform/linuxdetectscriptv1/ -o /tmp/PlatformDetection $CURLOPTIONS;)
#     err=$?

#     if [[ $err -eq 60 ]]; then
#         echo "TLS certificate validation for the agent package download has failed. Please check that your Deep Security Manager TLS certificate is signed by a trusted root certificate authority. For more information, search for \"deployment scripts\" in the Deep Security Help Center."
#         logger -t TLS certificate validation for the agent package download has failed. Please check that your Deep Security Manager TLS certificate is signed by a trusted root certificate authority. For more information, search for \"deployment scripts\" in the Deep Security Help Center.
#         exit 1;
#     fi

#     if [ -s /tmp/PlatformDetection ]; then
#         . /tmp/PlatformDetection
#     else
#         echo "Failed to download the agent installation support script."
#         logger -t Failed to download the Deep Security Agent installation support script
#         exit 1
#     fi

#     platform_detect
#     if [[ -z "${linuxPlatform}" ]] || [[ -z "${isRPM}" ]]; then
#         echo Unsupported platform is detected
#         logger -t Unsupported platform is detected
#         exit 1
#     fi

#     echo Downloading agent package...
#     if [[ $isRPM == 1 ]]; then package='agent.rpm'
#         else package='agent.deb'
#     fi
#     curl -H "Agent-Version-Control: on" $MANAGERURL/software/agent/${runningPlatform}${majorVersion}/${archType}/$package?tenantID=67712 -o /tmp/$package $CURLOPTIONS

#     echo Installing agent package...
#     rc=1
#     if [[ $isRPM == 1 && -s /tmp/agent.rpm ]]; then
#         rpm -ihv /tmp/agent.rpm
#         rc=$?
#     elif [[ -s /tmp/agent.deb ]]; then
#         dpkg -i /tmp/agent.deb
#         rc=$?
#     else
#         echo Failed to download the agent package. Please make sure the package is imported in the Deep Security Manager
#         logger -t Failed to download the agent package. Please make sure the package is imported in the Deep Security Manager
#         exit 1
#     fi
#     if [[ ${rc} != 0 ]]; then
#         echo Failed to install the agent package
#         logger -t Failed to install the agent package
#         exit 1
#     fi

# echo Install the agent package successfully

# sleep 15
# /opt/ds_agent/dsa_control -r
# /opt/ds_agent/dsa_control -a $ACTIVATIONURL "tenantID:954A3F6C-2C30-6359-C466-3A40FC6BFAEE" "token:60C7D34B-2D92-9510-305F-0AAC9861EA66"
# # /opt/ds_agent/dsa_control -a dsm://agents.deepsecurity.trendmicro.com:443/ "tenantID:954A3F6C-2C30-6359-C466-3A40FC6BFAEE" "token:60C7D34B-2D92-9510-305F-0AAC9861EA66"sysadmin@jenkins:~/ubuntu/aws_shellscript/aws_scriptautomation/aws_installsecagent/pat/security-agent-2021/Installers$
 


