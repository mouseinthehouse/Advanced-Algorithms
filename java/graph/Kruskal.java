import java.util.List;
import java.util.ArrayList;
import java.util.Queue;
import java.util.PriorityQueue;

/* UnionFind Implementation */
/* public class UnionFind {
    Map<Integer, Integer> par;
    Map<Integer, Integer> rank;

    public UnionFind(int n) {
        par = new HashMap<>();
        rank = new HashMap<>();

        for (int i = 1; i < n + 1; i++) {
            par.put(i,i);
            rank.put(i,0);
        }
    }

    // Find parent of n, with path compression.
    public int find(int n) {
        int p = par.get(n);
        while (p != par.get(p)) {
            par.put(p, par.get(par.get(p)));
            p = par.get(p);
        }
        return p;
    }

    // Union by height / rank.
    // Return false if already connected, true otherwise.
    public boolean union(int n1, int n2) {
        int p1 = this.find(n1), p2 = this.find(n2);
        if (p1 == p2) {
            return false;
        }

        if (rank.get(p1) > rank.get(p2)) {
            par.put(p2, p1);
        } else if (rank.get(p1) < rank.get(p2)) {
            par.put(p1, p2);
        } else {
            par.put(p1, p2);
            rank.put(p2, rank.get(p2) + 1);
        }
        return true;
    }
} */

public class Kruskal {
    // Given an list of edges of a connected undirected graph,
    // with nodes numbered from 1 to n,
    // return a list edges making up the minimum spanning tree.
    public static List<Integer[]> mst(int[][] edges, int n) {
        Queue<int[]> minHeap = new PriorityQueue<>((n1, n2) -> (n1[0] - n2[0]));
        for (int[] edge : edges) {
            int n1 = edge[0], n2 = edge[1], weight = edge[2];
            minHeap.add(new int[]{weight, n1, n2});
        }

        UnionFind unionFind = new UnionFind(n);
        List<Integer[]> mst = new ArrayList<>();
        while(mst.size() < n - 1){
            int[] cur = minHeap.remove();
            int w1 = cur[0], n1 = cur[1], n2 = cur[2];
            if (unionFind.union(n1, n2) == false) {
                continue;
            }
            mst.add(new Integer[]{n1, n2});
        }
        return mst;
    }
}