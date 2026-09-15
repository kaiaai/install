# Install Kaia.ai on Ubuntu without Docker

Requires Ubuntu 24.04. These scripts build the same packages as the `kaiaai/kaiaai:jazzy` Docker image ([Dockerfile](../docker/kaiaai/Dockerfile)).

## Step 1 - Install ROS2 Jazzy
Skip this step if ROS2 Jazzy is already installed.
```
git clone --depth 1 https://github.com/kaiaai/install
cd install/ubuntu
./install_ros2_jazzy_ubuntu_24_04.sh
```

## Step 2 - Install Kaia.ai Platform
Run as a regular user, not root. The script calls `sudo` when it needs to.
```
./install_kaiaai_jazzy.sh
```
Then open a new terminal, or run `source ~/.bashrc`.

What it does:
- `~/uros_ws` - builds the micro-ROS agent, which talks to the robot's ESP32
- `~/ros_ws` - clones and builds the Kaia.ai and Maker's Pet packages, `jazzy` branches
- installs dependencies with `apt` and `rosdep` only - no `pip` into the system Python
- copies Fast DDS profiles that disable shared memory transport to `~/.ros/`
- appends a `# >>> kaiaai >>>` block to `~/.bashrc` that sources both workspaces, sets `RMW_IMPLEMENTATION=rmw_fastrtps_cpp` and adds the `kaia` alias
- adds common launch commands to `~/.bash_history`, so they are one up-arrow away
- creates `~/maps`

Safe to re-run: existing clones and the micro-ROS agent build are kept, and `~/.bashrc` is only edited once. To update a package, `git pull` it in `~/ros_ws/src` and run `colcon build --symlink-install` in `~/ros_ws`.

The Docker image also installs the [Remake SDK](https://github.com/remakeai/remake-sdk) `remake` CLI. The ROS2 packages do not need it, so this script leaves it out.

### Running in a Virtual Machine
- if using VMWare Workstation Player
  - set Player -> Manage -> Virtual Machine Settings -> Network Adapter -> Network Connection -> to Bridged
  - run `hostname -I` to get the IP address
