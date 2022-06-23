function getGraph(callback) {
    $.get('/graph', function (data) {
        return callback(false, data);
    });
}
