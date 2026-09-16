# Sourced by kaiaai-entrypoint.sh and ~/.bashrc.
# Shared memory transport stays on unless MICROROS_DISABLE_SHM=1 is set,
# e.g. docker run -e MICROROS_DISABLE_SHM=1 ...
if [ "$MICROROS_DISABLE_SHM" = "1" ] ; then
    if [ "$ROS_LOCALHOST_ONLY" = "1" ] || [ "$ROS_AUTOMATIC_DISCOVERY_RANGE" = "LOCALHOST" ] ; then
        export FASTRTPS_DEFAULT_PROFILES_FILE=/tmp/disable_fastdds_shm_localhost_only.xml
    else
        export FASTRTPS_DEFAULT_PROFILES_FILE=/tmp/disable_fastdds_shm.xml
    fi
fi
