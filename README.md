Effective bi-directionnal sync in Docker for Mac  
================================================
Description
-----------

Docker on Mac runs mainly inside a virtual machine and offers poor performance for volume mounts.

Some projects like [Dinghy](https://github.com/codekitchen/dinghy) improves this performance by using NFS but it's still slow compared with 
files hosted directly in the container.

[docker-osx-dev](https://github.com/brikis98/docker-osx-dev) was built to provide better performance but has some important drawbacks, mainly files created in the container in a shared mounted are not synced back and worse are deleted when
the next sync runs.

This project attempts to provide a bi-directionnal syncing between files on the Mac host and a not mounted
folder directly in the container, by using:
 
- a derived version of docker-osx-dev` to provide syncing from the mac to the container,
- a container based on [mickaelperrin/lsyncd](https://hub.docker.com/r/mickaelperrin/lsyncd) to provide syncing from the container to the mac.

Configuration is not transparent like with `dinghy` or `docker-osx-dev`. It uses mainly :

- a spectific comment in the `docker-compose.yml` file to configure syncing from the host to the mac,
- an additional container.
 
An example of configured [`docker-compose.yml`](./docker-compose.yml) is provided in this project.

License: [GPLv2](http://www.fsf.org/licensing/licenses/info/GPLv2.html) or any later GPL version.

Prerequesties
-------------

Dinghy must be configured on the host and used to run Docker.

How to use this project
-----------------------

1/ Be sure that dinghy is running
2/ Launch the containers and the sync daemon by running the `start-container-and-sync.sh` 
3/ Launch the test script `test.sh` which perform some basic operation on the host and in a contaier to show how
sync works.

Disclaimer
----------
Besides the usual disclaimer in the license, we want to specifically emphasize that the authors, and any organizations the authors are associated with, can not be held responsible for data-loss caused by possible malfunctions of Lsyncd.
