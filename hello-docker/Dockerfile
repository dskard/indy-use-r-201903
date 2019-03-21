FROM ubuntu:bionic-20180526

# install build dependencies
# echo command provided by coreutils package
RUN set -ex; \
    \
    apt-get update; \
    apt-get install -y \
        coreutils; \
    rm -rf /var/lib/apt/lists/*;

# set the default command that will run
# when the container is launched
CMD ["echo", "hello IndyUseR!"]

