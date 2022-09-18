import java.util.Set; 
import java.util.HashSet; 
import java.util.Map; 
import java.util.HashMap; 
import java.util.List; 
import java.util.ArrayList; 
import java.util.Collections; 

// Given a directed acyclical graph, return a valid 
// topological ordering of the graph. 
public class TopologicalSort { 
    public static List<Integer> topologicalSort(int[][] edges, int n) {
        Map<Integer, ArrayList<Integer>> adj = new HashMap<>(); 
        for (int i = 1; i < n + 1; i++) {
            adj.put(i, new ArrayList<>()); 
        } 
        for (int[] edge : edges) { 
            int src = edge[0], dst = edge[1]; 
            adj.get(src).add(dst); 
        } 
        List<Integer> topSort = new ArrayList<>(); 
        Set<Integer> visit = new HashSet<>(); 
        for (int i = 1; i < n + 1; i++) { 
            dfs(i, adj, visit, topSort); 
        } 
        Collections.reverse(topSort); 
        return topSort; 
    } 
    
    public static void dfs(int src, Map<Integer, ArrayList<Integer>> adj, Set<Integer> visit, List<Integer> topSort) { 
        if (visit.contains(src)) {
            return; 
        } 
        visit.add(src); 
        for (int neighbor : adj.get(src)) {
            dfs(neighbor, adj, visit, topSort); 
        } 
        topSort.add(src); 
        return; 
    } 
}    