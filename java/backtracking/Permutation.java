import java.util.List;
import java.util.ArrayList;

public class Permutation {
    
    // Time: O(n^2 * n!)
    public static List<List<Integer>> permutationsRecursive(int[] nums) {
        return helper(0, nums);
    }

    public static List<List<Integer>> helper(int i, int[] nums) {
        if (i == nums.length) {
            List<List<Integer>> res = new ArrayList<>();
            res.add(new ArrayList<>());
            return res;
        }

        List<List<Integer>> resPerms = new ArrayList<>();
        List<List<Integer>> perms = helper(i + 1, nums);
        for (List<Integer> p : perms) {
            for (int j = 0; j < p.size() + 1; j++) {
                List<Integer> pCopy = new ArrayList<>();
                pCopy.addAll(p);
                pCopy.add(j, nums[i]);
                resPerms.add(pCopy);
            }
        }
        return resPerms; 
    }
    

    // Time: O(n^2 * n!)
    public static List<List<Integer>> permutationsIterative(int[] nums) {
        List<List<Integer>> perms = new ArrayList<>();
        perms.add(new ArrayList<>());

        for (int n : nums) {
            List<List<Integer>> nextPerms = new ArrayList<>();
            for (List<Integer> p : perms) {
                for (int i = 0; i < p.size() + 1; i++) {
                    List<Integer> pCopy = new ArrayList<>();
                    pCopy.addAll(p);
                    pCopy.add(i, n);
                    nextPerms.add(pCopy);
                }  
            }
            perms = nextPerms;
        }
        return perms;
    }    
}