---
title: Finances
---

## Fares and Fare classes

Fares are the different prices for seats paid for, by passengers. When a PIREP is filed, 3 places are checked for the price for a certain fare class:

1. The fare assigned to a flight
2. The fare assigned to the subfleet of the aircraft that was used for the flight
3. The fare itself

## Flight fares

If a fare is added to a flight, it will take precedence over the fares assigned to the subfleet.

When a fare is assigned to a flight, the value it can be given is either a monetary amount, or a multiplier. (e.g, 100, or 100%). The multiplier is applied from the subfleet amount, or the fare amount, if one isn't specified on the subfleet. By default, if there is no value, it is assumed at 100% of the amount.

If there are expected to be aircraft substitutions, you can add only the fares that may apply. For example, on a normal route, you may only have an Economy and First Class fare. But perhaps an aircraft with an additional fare, Premium Economy may be used. You can add Premium Economy to the flight, and set it to either a monetary amount, or to the multiplier, e.g, it might be set to 120%. When the PIREP is filed, for that flight, the seat prices for that flight, on that aircraft, will be set to 120% of the base premium economy price.