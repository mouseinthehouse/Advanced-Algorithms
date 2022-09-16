import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.Queue;
import java.util.PriorityQueue;

public class Dijkstra {
    
    public static Map<Integer, Integer> shortestPath(int[][] edges, int n, int src) {
        Map<Integer, ArrayList<Integer[]>> adj = new HashMap<>();
        for (int i = 1; i < n + 1; i++) {
            adj.put(i, new ArrayList<Integer[]>());
        }
        for (int[] edge : edges) {
            // s = src, d = dst, w = weight
            int s = edge[0], d = edge[1], w = edge[2];
            adj.get(s).add(new Integer[] {d, w});
        }

        HashMap<Integer, Integer> shortest = new HashMap<>();
        Queue<int[]> minHeap = new PriorityQueue<>((n1, n2) -> (n1[0] - n2[0]));
        minHeap.add(new int[]{0, src});

        while(!minHeap.isEmpty()){
            int[] cur = minHeap.remove();
            int w1 = cur[0], n1 = cur[1];
            
            if (shortest.containsKey(n1)) {
                continue;
            }
            shortest.put(n1, w1);
            for (Integer[] pair: adj.get(n1)) {
                int n2 = pair[0], w2 = pair[1];
                if (!shortest.containsKey(n2)) {
                    minHeap.add(new int[]{w1 + w2, n2});
                }
            }
        }
        return shortest;
    }
}
