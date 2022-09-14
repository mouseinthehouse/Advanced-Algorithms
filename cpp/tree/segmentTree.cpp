#include <vector>

using std::vector;

class SegmentTree {
public:
    int sum_;
    SegmentTree* left_;
    SegmentTree* right_;
    int L_;
    int R_;

    SegmentTree(int total, int L, int R) {
        sum_ = total;
        L_ = L, R_ = R;
        left_ = nullptr, right_ = nullptr;
    }

    // O(n)
    static SegmentTree* build(vector<int>& nums, int L, int R) {
        if (L == R) {
            return new SegmentTree(nums[L], L, R);
        }

        int M = (L + R) / 2;
        SegmentTree *root = new SegmentTree(0, L, R);
        root->left_ = SegmentTree::build(nums, L, M);
        root->right_ = SegmentTree::build(nums, M + 1, R);
        root->sum_ = root->left_->sum_ + root->right_->sum_; 
        return root;
    }

    void update(int index, int val) {
        if (L_ == R_) {
            sum_ = val;
            return;
        }
        int M = (L_ + R_) / 2;
        if (index > M) {
             right_->update(index, val);
        } else {
            left_->update(index, val);
        }
        sum_ = left_->sum_ + right_->sum_;
    }

    int rangeQuery(int L, int R) {
        if (L == L_ && R == R_) {
            return sum_;
        }
        int M = (L_ + R_) / 2;
        if (L > M) {
            return right_->rangeQuery(L, R);
        } else if (R <= M) {
            return left_->rangeQuery(L, R);
        } else {
            return (left_->rangeQuery(L, M) + 
                right_->rangeQuery(M + 1, R));
        }
    }
};