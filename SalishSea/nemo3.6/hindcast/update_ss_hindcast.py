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

"""Functions to update namelist to change walltime and XIOS servers
"""

from __future__ import print_function
import argparse
import arrow
import shutil


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('date', help='Date file to update like 06jan17')
    args = parser.parse_args()
    date = arrow.get(args.date, 'DDMMMYY')

    old_yaml = 'SalishSea_hindcast_'+date.format('DDMMMYY').lower()+'.yaml'
    new_yaml = 'temp.yaml'
    make_yaml(old_yaml, new_yaml, date)
    shutil.copy(new_yaml, old_yaml)


def make_yaml(previous_yaml, new_yaml, date):
    fo = open(new_yaml, 'w')
    with open(previous_yaml) as fp:
        for line in fp:
            if 'walltime' in line:
                print('walltime: 18:00:00', file=fo)
            elif 'XIOS servers' in line:
                print ('  XIOS servers: 3', file=fo)
            else:
                print(line, file=fo, end='')
    fo.close()


if __name__ == '__main__':
    main()

