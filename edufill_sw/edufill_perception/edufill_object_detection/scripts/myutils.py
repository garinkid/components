#Copyright 2012 Alexey Ozhigov.
'''
This file is part of RnD1_Alexey_Ozhigov.
 RnD1_Alexey_Ozhigov is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 RnD1_Alexey_Ozhigov is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 GNU General Public License for more details.
 You should have received a copy of the GNU General Public License along with RnD1_Alexey_Ozhigov. If not, see <http://www.gnu.org/licenses/>.
'''




import cv2
from cv import Scalar
import matplotlib as mpl
import matplotlib.pyplot as plt
import re
from sys import exit, stderr

from cv2.cv import CV_FOURCC
import numpy as np
from myutils_io import read_image, read_image_from_video

SCALAR_BLACK = Scalar(0, 0, 0)
SCALAR_WHITE = Scalar(255, 255, 255)
SCALAR_GREEN = Scalar(0, 255, 0)
SCALAR_RED   = Scalar(0, 0, 255)


if __name__ == '__main__':
    VIDEO_FILE         = '../hand_3markers/out.avi'
    RED_HIST_FILE      ='../hand_3markers/red_marker_frame51.png.hhst'
    RECT_RED_HIST_FILE ='../hand_3markers/rectangle_red_marker_frame51.png.hhst'
    BLUE_HIST_FILE     ='../hand_3markers/blue_marker_frame51.png.hhst'
    BLUE2_HIST_FILE    ='../pure_markers/hand_3fingers_blue_frame300.png.hhst'
    YELLOW_HIST_FILE   ='../hand_3markers/yellow_marker_frame51.png.hhst'
    HIST_FILES         = [RED_HIST_FILE, BLUE_HIST_FILE, YELLOW_HIST_FILE, \
                      RECT_RED_HIST_FILE]

def draw_debug_messages(img, msgs, orig = (30, 30), color=SCALAR_GREEN, font_size = 2.0):
    LINES_INTERVAL = 30
    x, y = orig
    for m in msgs:
        cv2.putText(img, m, (x, y), cv2.FONT_HERSHEY_PLAIN, \
                font_size, color)
        y += LINES_INTERVAL
def draw_label(img, label, orig = (50, 50), color = SCALAR_BLACK):
    cv2.putText(img, label, orig, cv2.FONT_HERSHEY_PLAIN, \
                    2.0, SCALAR_BLACK)
def draw_bound_rectangle(img, points, border, color):
    rect = cv2.boundingRect(points)
    if rect[2] < rect[3]:
        ratio = 1.0 * rect[2] / rect[3]
    else:
        ratio = 1.0 * rect[3] / rect[2]
    if ratio < 0.8:
        thickness = 1
    else:
        thickness = 2
    cv2.rectangle(img, (rect[0] - border, rect[1] - border), \
                       (rect[0] + rect[2] + border, \
                        rect[1] + rect[3] + border), color, thickness)
    return rect
    
def draw_cross(img, pt, length, color, thickness = 3):
    l2 = length / 2
    cv2.line(img, (pt[0] - l2, pt[1]), (pt[0] + l2, pt[1]), color, thickness)
    cv2.line(img, (pt[0], pt[1] - l2), (pt[0], pt[1] + l2), color, thickness)

def HSV(img_in, x, y):
    if type(img_in) == type(''):
        frame = read_image(fname)
    else:
        frame = img_in
    frameHSV = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)
    return {'BGR': frame[x, y], 'HSV': frameHSV[x, y]}
    #return frameHSV[x, y]

#ignore_mask if defined must contain a 3-element np.array with RGB color
# which must not be accounted for when calculated min. and max. values
def MinMaxAvgHSV(img_in, x1, y1, x2, y2, ignore_mask = None):
    if type(img_in) == type(''):
        frame = read_image(fname)
    else:
        frame = img_in
    frameHSV = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)
    MinHSV = np.array([255, 255, 255], dtype='int32')
    MaxHSV = np.array([0, 0, 0], dtype='int32')
    ignored = 0
    not_ignored = 0
    for j in range(x1, x2):
        for i in range(y1, y2):
            try:
                if (frame[j, i] == ignore_mask).all():
                    ignored += 1
                    continue
            except:
                print j, i
                print img_in.shape
            not_ignored += 1
            for k in [0, 1, 2]:
                if frameHSV[j, i][k] < MinHSV[k]:
                    MinHSV[k] = frameHSV[j, i][k]
                if frameHSV[j, i][k] > MaxHSV[k]:
                    MaxHSV[k] = frameHSV[j, i][k]
    print 'ignored px.', ignored, 'not_ignored px.', not_ignored
    AvgHSV = (MinHSV + MaxHSV) / 2
    return (MinHSV.astype('uint8'), MaxHSV.astype('uint8'), AvgHSV.astype('uint8'))


#THE FOLLOWING FUNCTIONS ARE EMPOWERED BY HIGHGUI


mouse_events = dict(map(lambda x:    (x, False), range(0, 10)))
key_events   = dict(map(lambda x:    (x, False), range(0, 256)))
mouse_x      = 0
mouse_y      = 0
KEY_SPACE    = 32

def on_mouse_event(event, x, y, flags, params):
    global left_clicked
    global mouse_x, mouse_y
    mouse_events[event] = True
    mouse_x = x
    mouse_y = y

def clear_events_mouse(event_ids = mouse_events.keys()):
    for eid in event_ids:
        mouse_events[eid] = False

def clear_events_key(event_ids = key_events.keys()):
    for eid in event_ids:
        key_events[eid] = False

def GUIMinMaxHSV(img_in):
    if type(img_in) == type(''):
        frame = read_image(fname)
    else:
        frame = img_in
    cv2.namedWindow('wnd', 0)
    cv2.setMouseCallback('wnd', on_mouse_event, 0)
    cv2.imshow('wnd', frame)
    points_selected = 0
    points = []
    while cv2.waitKey(100) != 32:
        if len(points) == 2:
            print MinMaxAvgHSV(frame, points[0][0], points[0][1], points[1][0], points[1][1])
            points = []
        if mouse_events[cv2.EVENT_LBUTTONDOWN]:
            points.append(np.array([mouse_x, mouse_y], dtype='uint16'))
        clear_events_mouse()
    cv2.destroyWindow('wnd')
    cv2.waitKey(1000)

def cv_u8c3point_inv(p):
    return [255 - p[0], 255 - p[1], 255 - p[2]]

def draw_contour(img, points):
    for p in points:
        try:#some points may appear outside the image boundaries
            p_rev = p[::-1]
            img[p_rev[0]][p_rev[1]] = [0, 0, 0]#cv_u8c3point_inv(img[p[::-1]])
        except:
            pass

def GUICalibrateHSV(img_in, fname):
    if type(img_in) == type(''):
        frame = read_image(fname)
    else:
        frame = img_in
    main_labels = [   '1) Draw a bounding box around next cube to zoom it in;',\
                      '2) In the zoomed area draw a contour around the cube, press \'Enter\';',\
                      '3) Select the color in the terminal:',\
                      ' Type one character designating the color (r, g, b, c, m or y)',\
                      ' and press \'Enter\';',\
                      '4) Then proceed with the next cube in the reopened image window;',\
                      '5) When all the cube types were selected, press \'Esc\' to exit.'\
                  ]

    labels = {\
              'zoom1': main_labels,\
              'zoom2': main_labels,\
              'hsv_select_roi': [],\
              'hsv': main_labels,\
             }
    disp_frame = frame.copy()
    zoomed_frame = None
    wnd_name = 'Calibrate Color for Cube detection'
    cv2.namedWindow(wnd_name, 0)
    cv2.setMouseCallback(wnd_name, on_mouse_event, 0)
    points_selected = 0
    points = []
    state = 'zoom1'
    draw_debug_messages(disp_frame, labels[state], font_size = 1.0)
    cv2.imshow(wnd_name, disp_frame)
    hsv_min = 255 * np.ones([3], dtype='uint8')
    hsv_max = np.zeros([3], dtype='uint8')
    color_strs = {\
                    'r': 'red',\
                    'g': 'green',\
                    'b': 'blue',\
                    'c': 'cyan',\
                    'm': 'magenta',\
                    'y': 'yellow',\
                 }
    contour_selected = False
    sub_state = None
    def debug_state(state, points, events):
        print 'State: %s, points: %s, mouse_events: %s' % (state, str(points), str(events))
    while True:
        #debug_state(state, points, mouse_events)
        key = cv2.waitKey(5)
        if key == 27:#Esc
            break
        key_events[key] = True
        if key == ord('c') and state == 'hsv':
            hsv_min = 255 * np.ones([3], dtype='uint8')
            hsv_max = np.zeros([3], dtype='uint8')
            points = []
        elif state == 'hsv_select_roi':
            if sub_state == 'cont_not_selected':
                if mouse_events[cv2.EVENT_LBUTTONDOWN]:
                    sub_state = 'cont_select'
            elif sub_state == 'cont_select':
                zoomed_frame_contoured = zoomed_frame.copy()
                draw_contour(zoomed_frame_contoured, points)
                draw_debug_messages(zoomed_frame_contoured, labels[state], font_size = 1.0)
                cv2.imshow(wnd_name, zoomed_frame_contoured)
                if mouse_events[cv2.EVENT_LBUTTONUP]:
                    sub_state = 'cont_selected'
                    clear_events_mouse([cv2.EVENT_LBUTTONDOWN, cv2.EVENT_LBUTTONUP])
            elif sub_state == 'cont_selected':
                if key_events[10]:#Enter
                    clear_events_key([10])
                    #TODO: assert len(points) >= 2, otherwise switch to sub_state = 'cont_select',
                    #but also make new clicks be processed (points.append at the end of cycle)
                    state = 'hsv'
                elif mouse_events[cv2.EVENT_LBUTTONDOWN]:
                    sub_state = 'cont_select'
            elif mouse_events[cv2.EVENT_RBUTTONUP]:
                points = []
        elif state == 'hsv':
            cont = np.array([points], dtype='int32')
            #cont = np.array([[[1, 30]], [[30,1]], [[30, 30]], [[1, 1]]], dtype='int32')
            mask = np.zeros_like(zoomed_frame)
            cv2.drawContours(mask, cont, -1, SCALAR_WHITE, -1)#Draw contour with filled internals
            selected_frame = np.bitwise_and(zoomed_frame, mask)
            ignore_mask = np.array(SCALAR_BLACK[0:3], dtype=selected_frame.dtype)
            (mi, ma, _) = MinMaxAvgHSV(selected_frame, 0, 0, selected_frame.shape[0], selected_frame.shape[1], ignore_mask)
            for i in range(len(mi)):
                if mi[i] < hsv_min[i]:
                    hsv_min[i] = mi[i]
                if ma[i] > hsv_max[i]:
                    hsv_max[i] = ma[i]
            cv2.destroyWindow(wnd_name)
            while True:
                try:
                    color = raw_input('colour [r, g, b, c, m, y]> ')
                    color = color_strs[color]
                except KeyError, e:
                    print 'Invalid color: %s. Avaliable colors are: r, g, b, c, m, y. Retry.' % color
                    continue
                break
            f = file(fname, 'a+')
            f.write('%s_hsv_min:\n' % color)
            f.write('  h: %d\n' % hsv_min[0])
            f.write('  s: %d\n' % hsv_min[1])
            f.write('  v: %d\n' % hsv_min[2])
            f.write('%s_hsv_max:\n' % color)
            f.write('  h: %d\n' % hsv_max[0])
            f.write('  s: %d\n' % hsv_max[1])
            f.write('  v: %d\n' % hsv_max[2])
            f.close()
            print '%s written' % fname
            cv2.imwrite('params/%s.png' % color, selected_frame)
            print 'params/%s.png written' % color
            cv2.namedWindow(wnd_name, 0)
            cv2.setMouseCallback(wnd_name, on_mouse_event, 0)
            disp_frame = frame.copy()
            draw_debug_messages(disp_frame, labels[state], font_size = 1.0)
            cv2.imshow(wnd_name, disp_frame)
            state = 'zoom1'
            clear_events_mouse([cv2.EVENT_LBUTTONDOWN, cv2.EVENT_LBUTTONUP])
            hsv_min = 255 * np.ones([3], dtype='uint8')
            hsv_max = np.zeros([3], dtype='uint8')
            points = []
        elif state == 'zoom1':
            if len(points) == 1:
                state = 'zoom2'
        elif state == 'zoom2':
            if len(points) == 2:
                if np.linalg.norm(points[0] - points[1]) > 2:
                    clear_events_mouse([cv2.EVENT_LBUTTONDOWN, cv2.EVENT_LBUTTONUP])
                    #only store two diagonal edge points of the rectangle
                    points = [points[0], points[-1]]
                    disp_frame = frame.copy()
                    zoomed_frame = disp_frame[points[0][1]:points[1][1], points[0][0]:points[1][0]]
                    state = 'hsv_select_roi'
                    sub_state = 'cont_not_selected'
                    draw_debug_messages(zoomed_frame, labels[state], font_size = 1.0)
                    cv2.imshow(wnd_name, zoomed_frame)
                    points = []
                else:
                    print >>stderr, 'Zoom area too small'
                    clear_events_mouse([cv2.EVENT_LBUTTONDOWN, cv2.EVENT_LBUTTONUP])
                    points = []
                    state = 'zoom1'
        #Here we store points' coordinates in the image according to the needs of the current state
        do_append = False
        if state == 'zoom1':
            if mouse_events[cv2.EVENT_LBUTTONDOWN]:
                do_append = True
        elif state == 'zoom2':
            if mouse_events[cv2.EVENT_LBUTTONUP]:
                do_append = True
        elif state == 'hsv_select_roi' and sub_state == 'cont_select':
            if len(points) == 0 or np.all(np.array([mouse_x, mouse_y]) != points[len(points) - 1]):
                do_append = True
        if do_append:
            points.append(np.array([mouse_x, mouse_y], dtype='uint16'))
        #clear_events_mouse()
    cv2.destroyWindow(wnd_name)
    cv2.waitKey(1000)

NO_INTERSECTION = (-1, -1)
def RangeIntersection(rng1, rng2):
    if rng2[0] > rng1[1] or rng1[0] > rng2[1]:
        return NO_INTERSECTION 
    else:
        if rng1[0] < rng2[0]:
            return (rng2[0], min(rng1[1], rng2[1]))
        else:
            return (rng1[0], min(rng1[1], rng2[1]))

def ColorRangeIntersection(rng1, rng2):
    ci11 = (rng1[0][0], rng1[1][0])
    ci12 = (rng1[0][1], rng1[1][1])
    ci13 = (rng1[0][2], rng1[1][2])

    ci21 = (rng2[0][0], rng2[1][0])
    ci22 = (rng2[0][1], rng2[1][1])
    ci23 = (rng2[0][2], rng2[1][2])

    return (RangeIntersection(ci11, ci21), \
            RangeIntersection(ci12, ci22), \
            RangeIntersection(ci13, ci23))

def ColorRangeIntersectionVolume(intrs):
    vol = int(inters[0][1] - inters[0][0] + 1) * \
          int(inters[1][1] - inters[1][0] + 1) * \
          int(inters[2][1] - inters[2][0] + 1)
    return vol

def get_cmass(img_in):
    img = read_image(img_in)
    img_gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    mom = cv2.moments(img_gray)
    mx = mom['m10'] / mom['m00']
    my = mom['m01'] / mom['m00']
    return (int(mx), int(my))

def hsv_filter_mask(hsv, hsv_range_low = np.array([0, 20, 32], dtype=np.uint8), hsv_range_high = np.array([180, 254, 254], dtype=np.uint8)):
    return cv2.inRange(hsv, hsv_range_low, hsv_range_high)

def test_color():
    color_ranges = []
    for color in ['red', 'blue', 'yellow']:
        img = read_image('../pure_markers/hand_3fingers_%s_frame300.png' % color)
        color_rng = MinMaxAvgHSV(img, 0, 0, img.shape[1], img.shape[0], ignore_mask = np.array([255, 255, 255]))
        print color, color_rng
        color_ranges.append(color_rng)
    inters = ColorRangeIntersection(color_ranges[0], color_ranges[2])
    volume = ColorRangeIntersectionVolume(inters)
    print 'Intersection:', inters, 'Intersection volume:', volume 

def calc_back_proj(img, _hist, hsv = False, debug = False):
    if not hsv:
        img = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
    back_proj = cv2.calcBackProject([img], channels = [0], \
                             hist = _hist['data'], \
                             ranges = [_hist['range'][0], _hist['range'][1]], \
                             scale = 1)
    if debug:
        max_val = np.max(back_proj)
        back_proj_uint8 = (back_proj / max_val * 256).astype('uint8')
        cv2.imwrite('calc_back_proj_debug.jpg', back_proj_uint8)
    return back_proj

def halt(msg):
    print '----!!!PROGRAM HALTED!!!----'
    print msg
    print '----------------------------'
    exit(1)

if __name__ == '__main__':
    #test_color()
    #print 'test_hue_hist:', test_hue_hist()
    #save_hist(h, IMAGE_FILE + '.hhst')
    #h = load_hist(IMAGE_FILE + '.hhst')
    #print h['data']
    #test_hist_save()
    #test_hist_show()
    #generate_hist_files(HIST_FILES)
    pass

def img_max(img):
    amax = np.argmax(img)
    max_x = amax % img.shape[1]
    max_y = amax / img.shape[1]
    return (max_x, max_y)

