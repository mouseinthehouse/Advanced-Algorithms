import { MinPriorityQueue } from '@datastructures-js/priority-queue';

// Given a list of edges of a connected undirected graph,
// with nodes numbered from 1 to n,
// return a list edges making up the minimum spanning tree.
function minimumSpanningTree(edges, n) {
    let adj = {};
    for (i = 1; i < n + 1; i++) {
        adj[i] = [];
    }
    for (let edge of edges) {
        let {n1, n2, weight} = edge;
        adj[n1].push([n2, weight]);
        adj[n2].push([n1, weight]);
    }

    // Initialize the heap by choosing a single node
    // (in this case 1) and pushing all its neighbors.
    let minHeap = new MinPriorityQueue({
        priority: (item) => item[0]
    });
    for (let neighbor of adj[1]) {
        let node = neighbor[0], weight = neighbor[1];
        minHeap.enqueue([weight, 1, node]);
    }
    let mst = [];
    let visit = new Set();
    visit.add(1);
    while (visit.size() < n) {
        let {w1, n1, n2} = minHeap.dequeue().element;
        if (visit.has(n2)) {
            continue;
        }
        mst.push([n1, n2]);
        visit.add(n2);
        for (let pair of adj[n2]) {
            let {neighbor, weight} = pair;
            if (!visit.has(neighbor)) {
                minHeap.add([weight, n2, neighbor]);
            }
        }
    } 
    return mst;
}