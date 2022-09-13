import java.util.Map;
import java.util.HashMap;

public class UnionFind {
    
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
}