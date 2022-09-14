public class SegmentTree {
    int sum;
    SegmentTree left;
    SegmentTree right;
    int L;
    int R; 

    public SegmentTree(int total, int L , int R) {
        this.sum = total;
        this.left = null;
        this.right = null;
        this.L = L;
        this.R = R;
    }

    // O(n)
    public static SegmentTree build(int[] nums, int L, int R) {
        if (L == R) {
            return new SegmentTree(nums[L], L, R);
        }

        int M = (L + R) / 2;
        SegmentTree root = new SegmentTree(0, L, R);
        root.left = SegmentTree.build(nums, L, M);
        root.right =  SegmentTree.build(nums, M + 1, R);
        root.sum = root.left.sum + root.right.sum;
        return root;
    }

    // O(logn)
    public void update(int index, int val) {
        if (this.L == this.R) {
            this.sum = val;
            return;
        }

        int M = (this.L + this.R) / 2;
        if (index > M) {
            this.right.update(index, val);
        } else {
            this.left.update(index, val);
        }
        this.sum = this.left.sum + this.right.sum;
    }

    // O(logn)
    public int rangeQuery(int L, int R) {
        if (L == this.L && R == this.R) {
            return this.sum;
        }

        int M = (this.L + this.L) / 2;
        if (L > M) {
            return this.right.rangeQuery(L, R);
        } else if (R <= M) {
            return this.left.rangeQuery(L, R);
        } else {
            return (this.left.rangeQuery(L, M) +
                    this.right.rangeQuery(M + 1, R));
        }
    }
}    