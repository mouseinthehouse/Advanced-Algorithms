import java.util.Map;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.ArrayList;
import java.util.Queue;
import java.util.PriorityQueue;

public class Prim {
    // Given a list of edges of a connected undirected graph,
    // with nodes numbered from 1 to n,
    // return a list edges making up the minimum spanning tree.
    public static List<Integer[]> mst(int[][] edges, int n) {
        Map<Integer, ArrayList<Integer[]>> adj = new HashMap<>();
        for (int i = 1; i < n + 1; i++) {
            adj.put(i, new ArrayList<Integer[]>());
        }
        for (int[] edge : edges) {
            int n1 = edge[0], n2 = edge[1], weight = edge[2];
            adj.get(n1).add(new Integer[] {n2, weight});
            adj.get(n2).add(new Integer[] {n1, weight});
        }

        // Initialize the heap by choosing a single node
        // (in this case 1) and pushing all its neighbors.
        Queue<int[]> minHeap = new PriorityQueue<>((n1, n2) -> (n1[0] - n2[0]));
        for (Integer[] neighbor : adj.get(1)) {
            int node = neighbor[0], weight = neighbor[1];
            minHeap.add(new int[]{weight, 1, node});
        }

        List<Integer[]> mst = new ArrayList<>();
        HashSet<Integer> visit = new HashSet<>();
        visit.add(1);
        while(visit.size() < n){
            int[] cur = minHeap.remove();
            int w1 = cur[0], n1 = cur[1], n2 = cur[2];
            if (visit.contains(n2)) {
                continue;
            }
            mst.add(new Integer[]{n1, n2});
            visit.add(n2);
            for (Integer[] pair: adj.get(n2)) {
                Integer neighbor = pair[0], weight = pair[1];
                if (!visit.contains(neighbor)) {
                    minHeap.add(new int[]{weight, n2, neighbor});
                }
            }
        }
        return mst;
    }
}
