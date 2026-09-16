# Install Kaia.ai on Ubuntu without Docker (ROS2 Iron)

Requires Ubuntu 22.04. For ROS2 Jazzy on Ubuntu 24.04, see the [jazzy branch](https://github.com/kaiaai/install/tree/jazzy/ubuntu).

## Step 1 - Install ROS2 Iron
Skip this step if ROS2 Iron is already installed.
```
git clone --depth 1 -b iron https://github.com/kaiaai/install
cd install/ubuntu
./install_ros2_iron_ubuntu_22_04.sh
```

## Step 2 - Install Kaia.ai Platform
```
./install_kaiaai_iron.sh
```
Then open a new terminal, or run `source ~/.bashrc`.

Note `-b iron` above: the repo's default branch is `jazzy`, which does not have these Iron scripts.

### Running in a Virtual Machine
- if using VMWare Workstation Player
  - set Player -> Manage -> Virtual Machine Settings -> Network Adapter -> Network Connection -> to Bridged
  - run `hostname -I` to get the IP address
