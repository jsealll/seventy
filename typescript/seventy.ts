function branch(data: number[], index: number, result: number[][]) {
    var d1: number[] = data.slice(0);
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

function LottoSort(a: number[], b: number[]): number {
    var sa: number[] = a.sort(function (a, b): number { return a - b; });
    var sb: number[] = b.sort(function (a, b): number { return a - b; });
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

var l: number[] = new Array();
var result: number[][] = new Array();
branch(l, 1, result);
for (var i in result.sort(function (a, b): number { return LottoSort(a, b); })) {
    console.log((Number(i) + 1).toString() + " : " + result[i].join(" "));
}
