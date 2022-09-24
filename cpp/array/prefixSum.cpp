#include <vector>

using std::vector;

class PrefixSum {
public:
    vector<int> prefix_;

    PrefixSum(vector<int>& nums) {
        int total = 0;
        for (int n : nums) {
            total += n;
            prefix_.push_back(total);
        }
    }

    int rangeSum(int left, int right) {
        int preRight = prefix_[right];
        int preLeft = left > 0 ? prefix_[left - 1] : 0;
        return preRight - preLeft;
    }
};
