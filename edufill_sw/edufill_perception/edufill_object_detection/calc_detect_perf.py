#!/usr/bin/env python

from sys import argv
import numpy as np

assert len(argv) == 4, 'USAGE: calc_detect_perf <perf_data.txt> <cx> <cy>'

fname = argv[1]
ideal_x = int(argv[2])
ideal_y = int(argv[3])
good_cnt = 0
misdet_cnt = 0
fail_cnt = 0
rects = [np.array(x.split()).astype(np.int32) for x in file(fname).readlines()]
total = len(rects)

def close_to_ideal(a):
    cx = a[0] + a[2] / 2
    cy = a[1] + a[3] / 2
    dx = cx - ideal_x
    dy = cy - ideal_y
    d = np.sqrt(dx*dx + dy*dy)
    return d >= 11

def is_fail(a):
    if a[2] > 200 and a[3] > 200:
        return True
    else:
        return False

good_cnt = np.array([close_to_ideal(x) and not is_fail(x) for x in rects]).sum()
misdet_cnt = np.array([not close_to_ideal(x) and not is_fail(x) for x in rects]).sum()
fail_cnt = np.array([is_fail(x) for x in rects]).sum()

print 'good_cnt:', good_cnt
print 'misdet_cnt:', misdet_cnt
print 'fail_cnt:', fail_cnt
