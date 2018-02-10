function xhr(url, params, callback, data, x) {
    try {
        params = params || {};

        x = new (this.XMLHttpRequest || ActiveXObject)('MSXML2.XMLHTTP.3.0');
        if (params.withCredentials)
            x.withCredentials = true;
        x.open(data ? 'POST' : 'GET', url, 1);
        x.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
        x.setRequestHeader('Content-type', "application/x-www-form-urlencoded");
        x.setRequestHeader('Accept', 'application/json');
        x.onreadystatechange = function () {
            if (x.readyState > 3 && callback) {
                if (x.status === 200) {
                    return callback(null, x);
                }
                else {
                    return callback(x.status, x);
                }

            }
        };

        var dataStr = '';
        Object.keys(data).forEach(function(key) {
            dataStr += key + '=' + data[key] + '&';
        });

        console.log('xhr send', dataStr);
        x.send(dataStr)
    } catch (e) {
        callback(new Error('exception caught ' + e));
    }
}