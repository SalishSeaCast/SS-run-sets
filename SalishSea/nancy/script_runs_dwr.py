""" Script to define and execute a series of Salish Sea NEMO model runs.
All use the same RC4, corr4 files but include different numbers of tidal
constituents
"""
from __future__ import absolute_import

import os

import salishsea_cmd.api


def main():
    run_desc = base_run_description()
    run_ids = ['dwr_kw',]
    for run_id in run_ids:
        do_run(run_id, run_desc)


def do_run(run_id, run_desc):
    run_desc['run_id'] = run_id
    run_desc['namelists'][1] = (
           os.path.join(run_id,'mynamelist.domain' ))
    run_desc['namelists'][5] = (
           os.path.join(run_id,'namelist.tracers'))
    run_desc['namelists'][6] = (
           os.path.join(run_id,'namelist.dynamics'))
    salishsea_cmd.api.run_in_subprocess(
        run_id,
        run_desc,
        'iodef.eddy.1d.xml',
        os.path.join('/home/nksoonti/MEOPAR/SalishSea/results/', run_id))


def base_run_description():
    # Relative paths from SS-run-sets/SalishSea/nancy/
    run_desc = salishsea_cmd.api.run_description(
        walltime='21:00:00',
        NEMO_code='../../../NEMO-code/',
        forcing='../../../NEMO-forcing/',
        runs_dir='../../../SalishSea/',
        init_conditions=(
            '/home/dlatorne/MEOPAR/SalishSea/spin-up/'
            '9aug18aug/'),
        )
    run_desc['email'] = 'nsoontie@eos.ubc.ca'
    # Relative paths to namelist section files
    run_desc['namelists'] = [
        'namelist.time.19aug28sep',
        '../namelist.domain',
        '../tides/mynamelist.surface',
        '../tides/mynamelist.lateral',
        '../namelist.bottom',
        '../namelist.tracers',
        '../tides/mynamelist.dynamics15N',
        '../namelist.compute.12x27',
        ]
    return run_desc
 
 
if __name__ == '__main__':
    main()
