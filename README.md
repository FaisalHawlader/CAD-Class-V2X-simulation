# CAD Class V2X simulation

1. Test that your docker installation is working: `docker run hello-world` should work.
2. Start all services with `docker-compose up`. The first time will take a while as it downloads the required docker images. Leave this running the whole time you're working. You can stop all services using `docker-compose down`.
3. Open [http://localhost:8080/vnc_auto.html](http://localhost:8080/vnc_auto.html) to access GUIs that are running within the docker container.
4. Open a terminals inside the omnet and sumo docker container: `docker-compose exec cad-v2x-lab-omnet bash` and `docker-compose exec cad-v2x-lab-sumo bash`.
    - Check that the GUI in your browser displays eyes when you run `xeyes` in one of the docker terminal you just opened.
    - You should be good to start the lab.


