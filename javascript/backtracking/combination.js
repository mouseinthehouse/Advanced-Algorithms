// Given n numbers (1 - n), return all possible combinations
// of size k. (n choose k math problem).
// Time: O(k * 2^n)
function combinations(n, k) {
    let combs = []
    helper(1, [], combs, n, k);
    return combs;
}

function helper(i, curComb, combs, n, k) {
    if (curComb.length == k) {
        combs.push([...curComb]);
        return;
    }
    if (i > n) {
        return;
    }

    // decision to include i
    
    curComb.push(i);
    helper(i + 1, curComb, combs, n, k);
    curComb.pop();
    
    // decision to NOT include i
    helper(i + 1, curComb, combs, n, k);

}


// Time: O(k * C(n, k))
function combinations2(n, k) {
    let combs = [];
    helper2(1, [], combs, n, k);
    return combs;
}

function helper2(i, curComb, combs, n, k) {
    if (curComb.length == k) {
        combs.push([...curComb]);
        return;
    }
    if (i > n) {
        return;
    }

    for (let j = i; j < n + 1; j++) {
        curComb.push(j);
        helper2(j + 1, curComb, combs, n, k);
        curComb.pop();
    }
}