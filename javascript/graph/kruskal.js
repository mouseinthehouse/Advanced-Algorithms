import { MinPriorityQueue } from '@datastructures-js/priority-queue';

/* UnionFind implementation */
/* class UnionFind {

    constructor(n) {
        this.par = new Map();
        this.rank = new Map();

        for (let i = 1; i < n + 1; i++) {
            this.par.set(i,i);
            this.rank.set(i,0);
        }
    }

    // Find parent of n, with path compression.
    find(n) {
        let p = this.par.get(n);
        while (p != this.par.get(p)) {
            this.par.set(p, this.par.get(this.par.get(p)));
            p = this.par.get(p);
        }
        return p;
    }

    // Union by height / rank.
    // Return false if already connected, true otherwise.
    union(n1, n2) {
        let p1 = this.find(n1), p2 = this.find(n2);
        if (p1 == p2) {
            return false;
        }

        if (this.rank.get(p1) > this.rank.get(p2)) {
            this.par.set(p2, p1);
        } else if (this.rank.get(p1) < this.rank.get(p2)) {
            this.par.set(p1, p2);
        } else {
            this.par.set(p1, p2);
            this.rank.set(p2, this.rank.get(p2) + 1);
        }
        return true;
    }
} */

// Given a list of edges of a connected undirected graph,
// with nodes numbered from 1 to n,
// return a list edges making up the minimum spanning tree.
function minimumSpanningTree(edges, n) {
    let minHeap = new MinPriorityQueue({
        priority: (item) => item[0]
    });
    for (let edge of edges) {
        let {n1, n2, weight} = edge;
        minHeap.enqueue([weight, n1, n2]);
    }

    let unionFind = new UnionFind(n);
    let mst = [];
    while (mst.size() < n - 1) {
        let {w1, n1, n2} = minHeap.dequeue().element;
        if (unionFind.union(n1, n2) == false) {
            continue;
        }
        mst.push([n1, n2]);
    } 
    return mst;
}