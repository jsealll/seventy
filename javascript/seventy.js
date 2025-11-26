function branch(data, index, result) {
    var d1 = data.slice(0);
    if (data.length == 6 && data.reduce(function (a, n) { return a + n; }, 0) == 70) {
        result.push(d1);
        return;
    }
    if (index > 45 || data.length >= 6) {
        return;
    }
    branch(data, index + 1, result);
    d1.push(index);
    branch(d1, index + 1, result);
}

function LottoSort(a, b) {
    var sa = a.sort(function (a, b) { a - b; });
    var sb = b.sort(function (a, b) { a - b; });
    for (var i in sa) {
        if (sa[i] > sb[i]) {
            return 1;
        }
        if (sa[i] < sb[i]) {
            return -1;
        }
    }
    return 0;
}

var l = new Array();
var result = new Array();
branch(l, 1, result);
for (var i in result.sort(function (a, b) { return LottoSort(a, b); })) {
    console.log((Number(i) + 1).toString() + " : " + result[i].join(" "));
}
