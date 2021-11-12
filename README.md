# CAD Class V2X simulation

Before you begin, please make sure you have docker compose installed and working properly. You can run docker Compose on macOS, Windows, and 64-bit Linux. Follow the instructions [click](https://docs.docker.com/compose/install/), to install compose on Mac, Windows, Linux. If the docker working well: 
    - Test that your docker installation is working: `docker run hello-world` should work.

Start with CAD Class V2X Simulation: 

1.	Download the CAD-Class-V2X-simulation repository from GitHub. 
2.	Start all services with `docker-compose up`. The first time will take a while as it downloads the required docker images. You can stop all services using `docker-compose down`. 
3.	Open a terminal inside the docker container: `docker-compose exec cad-v2x-lab bash`
    - Test the environment is working on docker terminal run `sumo-gui` to test sumo is working.
    - Open [http://localhost:8080/vnc_auto.html](http://localhost:8080/vnc_auto.html) to access GUIs that are running within the docker container.
    - Test OMNeT++ is working on docker terminal run omnetpp to run OMNeT++, check that OMNeT++ gui appears in the browser.



