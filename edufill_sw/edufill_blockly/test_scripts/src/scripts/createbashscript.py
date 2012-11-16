#!/usr/bin/python

if __name__ == '__main__':
    f = open('setrobotenv','w')
    f.write('#!/bin/sh'+'\n'+'export ROBOT_ENV=brsu-iros2012')
    f.close()

