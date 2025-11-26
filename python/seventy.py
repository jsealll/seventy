"""
Get list of Lotto that meet the specific condition.
"""
import typing
import itertools

def branch(data: typing.List[int], index: int) -> typing.List[typing.List[int]]:
    """
    branch()
    """
    s = sum(data)
    l_data = len(data)
    if l_data == 6 and s == 70:
        return [data]
    if l_data >= 6 or s > 70 or 46 - index + l_data < 6:
        return []
    d1 = branch(data, index + 1)
    d2 = branch(data + [index], index + 1)
    return d1 + d2

if __name__ == "__main__":
    d = branch([], 1)
    c = itertools.count(1)
    print('\n'.join([f'{next(c)} : ' + ' '.join([str(x) for x in i]) for i in sorted(d)]))
