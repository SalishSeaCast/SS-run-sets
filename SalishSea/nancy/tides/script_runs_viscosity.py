""" Script to define and execute a series of Salish Sea NEMO model runs.
"""
from __future__ import absolute_import

import os

import salishsea_cmd.api


def main():
    run_desc = base_run_description()
    run_ids = ['visc1e-4', 'visc1e-5',  'visc1e-6']
    dynamics= ['namelist.dynamics', 'namelist.dynamics.visc5', 
               'namelist.dynamics.visc']
    for run_id, dynamic in zip(run_ids, dynamics):
        do_run(run_id, dynamic, run_desc)


def do_run(run_id, dynamic, run_desc):
    run_desc['run_id'] = run_id
    run_desc['namelists'][6] = dynamic
    salishsea_cmd.api.run_in_subprocess(
        run_id,
        run_desc,
        'iodef_tides.xml',
        os.path.join('/home/nksoonti/MEOPAR/SalishSea/results/tides', run_id))


def base_run_description():
    # Relative paths from SS-run-sets/SalishSea/tides/
    run_desc = salishsea_cmd.api.run_description(
        walltime='21:00:00',
        NEMO_code='../../../../NEMO-code/',
        forcing='../../../../NEMO-forcing/',
        runs_dir='../../../../SalishSea/',
        init_conditions=(
            '/home/dlatorne/MEOPAR/SalishSea/spin-up/'
            '11apr20apr/SalishSea_01529280_restart.nc'),
        )
    run_desc['email'] = 'nsoontie@eos.ubc.ca'
    # Relative paths to namelist section files
    run_desc['namelists'] = [
        'mynamelist21apr30may.time',
        '../../namelist.domain',
        'mynamelist.surface',
        '../../namelist.lateral',
        '../../namelist.bottom',
        '../../namelist.tracers',
        '../../namelist.dynamics',
        '../../namelist.compute.12x27',
        ]
    return run_desc
 
 
if __name__ == '__main__':
    main()
