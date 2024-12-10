## Step 1 - Install ROS2 Humble
Requires Ubuntu 22.04
```
wget https://raw.githubusercontent.com/kaiaai/install/main/ubuntu/install_ros2_humble.sh
chmod +x install_ros2_humble.sh
./install_ros2_humble.sh
```

## Step 2 - Install Kaia.ai Platform
```
wget https://raw.githubusercontent.com/kaiaai/install/main/ubuntu/install_kaiaai_humble.sh
chmod +x install_kaiaai_humble.sh
./install_kaiaai_humble.sh
```

### Running in a Virtual Machine
- if using VMWare Workstation Player
  - set Player -> Manage -> Virtual Machine Settings -> Network Adapter -> Network Connection -> to Bridged
  - run `hostname -I` to get the IP address
