# Find shortest path between every pair of V in a directed graph.
# O(V^3), so worse than Dijkstra O(E logV)
# But works for graphs with negative edges, unlike dijkstra
# Doesnt work for negative cycles of course