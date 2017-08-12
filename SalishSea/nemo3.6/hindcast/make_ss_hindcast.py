# Copyright 2017 The Salish Sea NEMO Project and
# The University of British Columbia

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#    http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""Functions to make ss-run-sets files for hindcast based on previous ones
"""

from __future__ import print_function
import argparse
import arrow


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('prevdate', help='Date of previous file like 06jan17')
    parser.add_argument('adddays', help='how many days to step forward')
    args = parser.parse_args()
    date_prev = arrow.get(args.prevdate, 'DDMMMYY')
    adays = int(args.adddays)
    newdate = date_prev.replace(days=+adays)

    previous_namelist = 'namelist.time.'+date_prev.format('DDMMMYY').lower()
    new_namelist =  'namelist.time.'+newdate.format('DDMMMYY').lower()
    make_namelist(previous_namelist, new_namelist, newdate, adays)

    previous_yaml = 'SalishSea_hindcast_'+date_prev.format('DDMMMYY').lower()+'.yaml'
    new_yaml = 'SalishSea_hindcast_'+newdate.format('DDMMMYY').lower()+'.yaml'
    make_yaml(previous_yaml, new_yaml, newdate, date_prev, new_namelist, adays)


def make_namelist(previous_namelist, new_namelist, newdate, adays):
    fo = open(new_namelist, 'w')
    with open(previous_namelist) as fp:
        for line in fp:
            if 'first time step' in line:
                pieces = line.split()
                new_pieces = [str(int(piece)+2160*adays) if piece.isdigit() else piece for piece in pieces]
                print (' '.join(new_pieces), file=fo)
            elif 'last time step' in line:
                pieces = line.split()
                new_pieces = [str(int(piece)+2160*adays) if piece.isdigit() else piece for piece in pieces]
                print (' '.join(new_pieces), file=fo)
            elif 'START OF THIS SEGMENT' in line:
                pieces = line.split()
                for index, piece in enumerate(pieces):
                    if piece.isdigit():
                        pieces[index] = newdate.format('YYYYMMDD')
                print (' '.join(pieces), file=fo)
            else:
                print (line, file=fo, end='')
    fo.close()


def make_yaml(previous_yaml, new_yaml, newdate, date_prev, new_namelist, adays):
    fo = open(new_yaml, 'w')
    with open(previous_yaml) as fp:
        for line in fp:
            if 'run_id' in line:
                print('run_id: '+newdate.format('DDMMMYY').lower()+'_hindcast', file=fo)
            elif 'restart' in line and 'nc' in line:
                pieces = line.split('_')
                for index, piece in enumerate(pieces):
                    if piece.isdigit():
                        pieces[index] = str(int(piece)+2160*adays).zfill(8)
                newline = '_'.join(pieces)
                pieces = newline.split('/')
                pieces[-2] = date_prev.format('DDMMMYY').lower()
                print ('/'.join(pieces), file=fo, end='')
            elif 'namelist.time' in line:
                print ('    - ./'+new_namelist, file=fo)
            else:
                print(line, file=fo, end='')
    fo.close()


if __name__ == '__main__':
    main()

