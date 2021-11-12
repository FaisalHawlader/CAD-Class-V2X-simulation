// This file is part of an OMNeT++ simulation example for Connected and Autonomous Vehicles class (Winter semester 2021-2022)

#include <string.h>
#include <omnetpp.h>


using namespace omnetpp;

/**
 * Derive the Car class from cSimpleModule. In the Ex1 network,
 * both the `car1' and `car2' modules are Ex1 objects, created by OMNeT++
 * at the beginning of the simulation.
 */

class Car : public cSimpleModule
{
  protected:
    // The following redefined virtual function holds the algorithm.
    virtual void initialize() override;
    virtual void handleMessage(cMessage *msg) override;
};


// The module class needs to be registered with OMNeT++
Define_Module(Car);


void Car::initialize()
{
// Initialize is called at the beginning of the simulation.
// To bootstrap the car1-car2-car1-car2 process, one of the modules needs
// to send the first message. Let this be `car1'.

// Am I car1 or car2?
if (strcmp("car1", getName()) == 0) {
    // create and send first message on gate "out". "HelloWorld" is an
    // arbitrary string which will be the name of the message object.
    cMessage *msg = new cMessage("HelloWorld");
    send(msg, "out");
}
}



void Car::handleMessage(cMessage *msg)
{
    // The handleMessage() method is called whenever a message arrives
    // at the module. Here, we just send it to the other module, through
    // gate `out'. Because both `car1' and `car2' does the same, the message
    // will bounce between the two.
    send(msg, "out"); // send out the message
}
