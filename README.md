# Boris Bikes


## Objective

Build a program that will emulate all the docking stations, bikes, and infrastructure (repair staff, and so on) required to operate Boris Bikes aka Santader Cycles by TFL.


## User Stories


```
As a person,
So that I can use a bike,
I'd like a docking station to release a bike.

As a person,
So that I can use a good bike,
I'd like to see if a bike is working. 
```


Objects | Messages
--------|---------
User | 
Bike | working?
Docking Station | release_bike


## Diagram

```
Bike <-- working? --> true/false
DockingStation <-- release_bike --> a Bike
```