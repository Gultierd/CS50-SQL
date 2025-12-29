# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

Observations would be distributed evenly across all boats, which would be a good idea in terms of load on each of the databases.
On the other side, any queries would have to gather data from all the boats to provide full information.

## Partitioning by Hour

Observations would not be distributed evenly - Boat A (hours 0-7) in the example would carry the biggest load, as most observations were made in these hours.
That could lead to overloading the database on some of the boats, while the rest could be almost empty. The upsides of this approach is much simpler querying,
as the data is now properly sorted and we can reach data from given timespan much quicker

## Partitioning by Hash Value

The effectiveness of this approach would highly depend on the declared hash function. In example provided it acted the same as Random partitioning, as the
numbers calculated are divided evenly - which would divide observations evenly across all boats. On the other hand the hash function could also work similar to partitioning by hour, since it could assign weight to different numbers (year, day, hour, minute) and then send them to a boat covering given number range. This approach would be the most versatile
