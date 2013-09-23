#!/usr/bin/env python
#******************************************************************************
# Copyright (c) 2013
# All rights reserved.
#
# Edufill project 
# Hochschule Bonn-Rhein-Sieg
# University of Applied Sciences
# Computer Science Department
#
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#
# Author:
# Nirmal Giftsun, Elizaveta Shpieva, Alexey Ozhigov
# 
# Supervised by:
# Rhama Dwiputra, Bjoern Kahl
#
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#
# This software is published under a dual-license: GNU Lesser General Public
# License LGPL 2.1 and BSD license. The dual-license implies that users of this
# code may choose which terms they prefer.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# * Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
# * Redistributions in binary form must reproduce the above copyright
# notice, this list of conditions and the following disclaimer in the
# documentation and/or other materials provided with the distribution.
# * Neither the name of Locomotec nor the names of its
# contributors may be used to endorse or promote products derived from
# this software without specific prior written permission.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License LGPL as
# published by the Free Software Foundation, either version 2.1 of the
# License, or (at your option) any later version or the BSD license.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Lesser General Public License LGPL and the BSD license for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License LGPL and BSD license along with this program.
#
#******************************************************************************
import numpy as np
import cv2
from myutils import hsv_filter_mask
from myutils_io import read_image
import re

def hue_to_hist(hue_min, hue_max, hist_bins):
    hist = np.array([], dtype='uint8')
    for i in range(hist_bins):
        bin_w = 180.0 / hist_bins
        c = bin_w * (i + 0.5)
        if hue_min < c < hue_max:
            a = c - hue_min
            b = hue_max - c
            min_s = min(a, b)
            max_s = max(a, b)
            val = 255.0 * min_s / max_s
        else:
            val = 0
        hist = np.append(hist, int(val))
    return (255.0 / max(hist) * hist).astype('uint8')


#Input image must be in BGR format
def calc_hue_hist(img, debug = False, hsv = False, user_mask = None, \
                  h_size = 16, h_range = (0, 180)):
    if not hsv:
        img = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
    hist_mask = hsv_filter_mask(img)
    if user_mask != None:
        hist_mask &= user_mask
    histogr = cv2.calcHist( [img], [0], hist_mask, [h_size], h_range )
    cv2.normalize(histogr, histogr, 0, 255, cv2.NORM_MINMAX)
    if debug:
        print 'Histogram:\n', h
        h_samples_total = sum(map(lambda x:    int(x[0]), h))
        print 'Total samples in histogram:', h_samples_total

    return make_hist(h_size, h_range, histogr)

def make_hist(bins = 256, _range = (0, 255), data = np.arange(0, 256)):
    return {'bins': bins, 'range': _range, 'data': data}

def save_hist(_hist, fname):
    f = file(fname, 'w')
    print >>f, 'hist_bins: %d hist_range: %d-%d' % \
                (_hist['bins'], _hist['range'][0], _hist['range'][1])
    for binval in _hist['data']:
        print >>f, binval[0]
    f.close()

def parse_hist_header(header):
    r = re.compile('[: -]')
    header_data = filter(lambda x:    x != '', r.split(header))
    assert len(header_data) == 5
    return (int(header_data[1]), (int(header_data[3]), int(header_data[4])))

def check_hist(h):
    assert h['bins'] == len(h['data'])

def load_hist(fname):
    f = file(fname)
    data = f.readlines()
    f.close()
    (bins, _range) = parse_hist_header(data[0])
    h = make_hist(bins, _range, \
                  np.array(map(lambda x:    [float(x)], data[1:]), np.float32))
    check_hist(h)
    return h

def show_hists(hs, colors):
    for i in range(0, len(hs)):
        plt.plot(hs[i]['data'], colors[i])
    plt.show()

def test_hue_hist():
    img = read_image(FRAME_FILE)
    h = calc_hue_hist(img)
    loaded_h = load_hist(HIST_FILE)
    return all(map(lambda x: x[0], loaded_h['data'] == h['data']))

def test_hist_save():
    fname = 'histogram.hst'
    h = {}
    h['bins'] = 256
    h['range'] = (0, 255)
    h['data'] = np.arange(0, 256)
    save_hist(h, fname)
    lh = load_hist(fname)
    print lh

def test_hist_show():
    hist_files = [\
            YELLOW_HIST_FILE, \
            RED_HIST_FILE, \
            BLUE_HIST_FILE, \
                 ]
    hists = map(lambda x: load_hist(x), hist_files)
    show_hists(hists, ['y', 'r', 'b'])

def generate_hist_files(fnames):
    for fn in fnames:
        pic_fn = fn[0:fn.rfind('.')]
        h = calc_hue_hist(read_image(pic_fn))
        cv2.normalize(h['data'], h['data'], 0, 255, cv2.NORM_MINMAX)
        save_hist(h, fn)

class Histogram:
    hist = None

    def __init__(self):
        pass
    
    def show(self, color = 'r'):
        show_hists([self.hist], color)
    
    def __str__(self):
        ret = ''
        for i in range(len(self.hist['data'])):
            ret += '%2d: %.1f\n' % (i+1, self.hist['data'][i])
        return ret
    
    def calc(self, img, user_mask = None):
        self.hist = calc_hue_hist(img, user_mask = user_mask)
    
    def load(self, hist_file):
        self.hist = load_hist(hist_file)

    def save(self, hist_file):
        save_hist(self.hist, hist_file)

if __name__ == '__main__':
    h = Histogram()
    h.load('../hand_hist.hst')
    print h
    '''
    h = Histogram()
    h.calc(read_image('/home/alex/Desktop/kirche.jpg'))
    print h
    h.save('kirche.hst')
    h.load('kirche.hst')
    print h
    '''
