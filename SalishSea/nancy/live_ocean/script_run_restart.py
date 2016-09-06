""" Script to define and execute a series of Salish Sea NEMO model runs.
"""
from __future__ import absolute_import

import os

import salishsea_cmd.api


def main():
    run_ids = ['base', 'live_ocean_test',]
    laterals = ['namelist.lateral','namelist.lateral.live_ocean',]
    for run_id, lateral in zip(run_ids, laterals):
        print(lateral)
        run_desc = base_run_description(run_id)
        do_run(run_id, run_desc, lateral)


def do_run(run_id, run_desc, lateral):
    run_desc['run_id'] = run_id
    run_desc['namelists']['namelist_cfg'][3] = lateral
    salishsea_cmd.api.run_in_subprocess(
        run_id,
        run_desc,
        'iodef.xml',
        os.path.join('/home/nksoonti/MEOPAR/SalishSea/results/live_ocean',
                     run_id, 'restart'))


def base_run_description(run_id):
    # Relative paths from SS-run-sets/SalishSea/nancy/
    run_desc = salishsea_cmd.api.run_description(
        walltime='23:00:00',
        NEMO_code='/home/nksoonti/MEOPAR/NEMO-3.6-code/',
        forcing_path='/home/nksoonti/MEOPAR/NEMO-forcing/',
        XIOS_code='/home/nksoonti/MEOPAR/XIOS/',
        runs_dir='/home/nksoonti/MEOPAR/SalishSea/',
        forcing={'NEMO-atmos': {'link to': '/home/sallen/MEOPAR/GEM2.5/ops/NEMO-atmos/'},
                 'rivers': {'link to': '/home/nksoonti/MEOPAR/rivers/'},
                 'open_boundaries': {'link to': 'open_boundaries'},
                 'restart.nc': {'link to': os.path.join('/home/nksoonti/MEOPAR/SalishSea/results/live_ocean', run_id, 'SalishSea_00080640_restart.nc')},
                 },
        )
    run_desc['email'] = 'nsoontie@eos.ubc.ca'
    # Relative paths to namelist section files
    run_desc['namelists']['namelist_cfg'] = [
        'namelist.time.restart',
        'namelist.domain.restart',
        'namelist.surface',
        'namelist.lateral',
        'namelist.bottom',
        'namelist.tracers',
        'namelist.dynamics',
        'namelist.vertical',
        'namelist.compute',
        ]
    return run_desc
 
 
if __name__ == '__main__':
    main()
