var cy = cytoscape({
    container: document.getElementById('cy'),

    style: [
        {
            selector: 'node',
            style: {
                'background-image':'http://server1102.cs.technik.fhnw.ch/bilder/007821SE4.jpg',
                'background-width': '120%',
                'background-height': '120%',
                'shape': 'rectangle',
                'background-color': '#666',
                'label': 'data(name)'

            }
        },
        {
            selector: 'edge',
            style: {
                'width': 3,
                'target-arrow-color': '#ccc',
                'target-arrow-shape': 'triangle'
            }
        }
    ],
    elements: {
        nodes: [
            { data: { id: '0'} },
            { data: { id: '1'} },
        ],
        edges: [
            { data: { source: '0', target: '1' } },
        ]
    }
});
