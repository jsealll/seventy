function sum_list(l)
    local total = 0
    for _, v in ipairs(l) do
        total = total + v
    end
    return total
end

function get_70(lo, index)
    local l = table.getn(lo)
    local s = sum_list(lo)
    if l == 6 and s == 70 then
        table.insert(li, lo)
        return
    end
    if l > 6 or s >= 70 or index > 45 then
        return
    end
    local lo2 = copy_list(lo)
    get_70(lo, index + 1)
    table.insert(lo2, index)
    get_70(lo2, index + 1)
end

function l_compare(a, b)
    for i in pairs({0, 1, 2, 3, 4, 5}) do
        if a[i] > b[i] then
            return false
        end
        if a[i] < b[i] then
            return true
        end
    end
    return false
end

li = {}
get_70({}, 1)
table.sort(li, l_compare)
for k, v in pairs(li) do
    print(string.format("%d : %s", k, table.concat(v, " ")))
end
