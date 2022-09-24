#include <vector>
#include <queue>

using std::vector;
using std::priority_queue;
using std::greater;


class Median {
public:
    priority_queue<int> small_; // max heap
    priority_queue<int, vector<int>, greater<int>> large_; // min heap

    Median() {}

    void insert(int num) {
        // Push to the max heap and swap with min heap if needed.
        small_.push(num);
        if (!small_.empty() && !large_.empty() && small_.top() > large_.top()) {
            large_.push(small_.top());
            small_.pop();
        }
        // Handle uneven size
        if (small_.size() > large_.size() + 1) {
            large_.push(small_.top());
            small_.pop();
        }
        if (large_.size() > small_.size() + 1) {
            small_.push(large_.top());
            large_.pop();
        }
    }

    double getMedian() {
        if (small_.size() > large_.size()) {
            return (double) small_.top();
        } else if (large_.size() > small_.size()) {
            return (double) large_.top();
        }
        // Even # of elements, return avg of two middle nums
        return (double)(small_.top() + large_.top()) / 2.0;
    }
};
