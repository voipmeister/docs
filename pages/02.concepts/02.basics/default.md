---
title: Basics
---

phpVMS 7 has a few fundamental differences from the old version, on how schedules and flights are handled.

* schedules are now called flights
* flights, at a minimum, consist of:
  1. An airline it belongs to
  1. A flight number
  1. a departure airport
  1. an arrival airport
  1. one or more assigned subfleets

## Airlines

One or more airlines needs to be created. Users choose and airline on registration. 

## Airports

Airports can be added to the system, and optionally selected as hubs. When users register, they select a home hub.

## Fares

An unlimited number of fares can be added, and then fares are attached to subfleets, therefor, all of these fares are then applied to any aircraft in that subfleet. These include examples of "First Class", "Economy", etc. You can add as many or as few as you want. Fares include:

* Capacity - how many seats this fare class holds
* Price - the amount a ticket in this fare class costs
* Cost - the amount it costs for a ticket; this is the amount it costs you to run a single seat

In order to facilitate not needing multiple fares of the same type, but with different capacity/costs/price, when a fare it assigned to a subfleet, those properties can be changed on a per-subfleet basis.

## Subfleets and Fleets

In phpVMS 7, fleets are now organized into units of subfleets. Subfleet examples may include `744-GE`, where you can handle any number of Boeing 747's with GE engines. This mimics real-world operations.

* Subfleets have a name, type and a fuel type. The name and type are arbitrary, and just convention to your VA. [Here's an example for Continental Airlines](http://www.aerotransport.org/php/go.php?query=operator&luck=1&where=70913)
* Any number of aircraft can be assigned
* Any number of fares can be assigned, and the properties overridden.
* Any number of subfleets can be assigned to a flight

## Flights

A flight consists of:

* Flight number
* Departure airport
* Arrival airport
* Any number of subfleets