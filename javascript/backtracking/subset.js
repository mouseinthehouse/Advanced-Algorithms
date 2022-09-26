function subsetsWithoutDuplicates(nums) {
    let subsets = [];
    let curSet = [];
    helper(0, nums, curSet, subsets);
    return subsets;
}

function helper(i, nums, curSet, subsets) {
    if (i >= nums.length) {
        subsets.push([...curSet]);
        return;
    }

    // decision to include nums[i]
    curSet.push(nums[i]);
    helper(i + 1, nums, curSet, subsets);
    curSet.pop();

    // decision NOT to include nums[i]
    helper(i + 1, nums, curSet, subsets);
}


// Time: O(n * 2^n), Space: O(n)
function subsetsWithDuplicates(nums) {
    nums.sort();
    let curSet = [];
    let subsets = [];
    helper2(0, nums, curSet, subsets);
    return subsets;
}


function helper2( i, nums, curSet, subsets) {
    if (i >= nums.length) {
        subsets.push([...curSet]);
        return;
    }

    // decision to include nums[i]
    curSet.push(nums[i]);
    helper2(i + 1, nums, curSet, subsets);
    curSet.pop();

    // decision NOT to include nums[i]
    while (i + 1 < nums.length && nums[i] == nums[i + 1]) {
        i++;
    }
    helper2(i + 1, nums, curSet, subsets);
}