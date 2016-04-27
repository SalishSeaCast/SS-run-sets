""" Script to define and execute a series of Salish Sea NEMO model runs.
"""
from __future__ import absolute_import

import os

import salishsea_cmd.api


def main():
    run_ids = ['new_bcs_jun9', 'all_improve',]
    dynamics = ['namelist.dynamics','namelist.dynamics.holl',]
    for run_id, dynamic in zip(run_ids, dynamics):
        print(dynamic)
        run_desc = base_run_description(run_id)
        do_run(run_id, run_desc, dynamic)


def do_run(run_id, run_desc, dynamic):
    run_desc['run_id'] = run_id
    run_desc['namelists']['namelist_cfg'][6] = dynamic
    salishsea_cmd.api.run_in_subprocess(
        run_id,
        run_desc,
        'iodef.xml',
        os.path.join('/home/nksoonti/MEOPAR/SalishSea/results/mixing_paper',
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
                 'initial_strat': {'link to': os.path.join('/home/nksoonti/MEOPAR/SalishSea/results/mixing_paper', run_id, 'SalishSea_00086400_restart.nc')},
                 },
        )
    run_desc['email'] = 'nsoontie@eos.ubc.ca'
    # Relative paths to namelist section files
    run_desc['namelists']['namelist_cfg'] = [
        'namelist.time.9jul18aug.restart',
        'namelist.domain.restart',
        'namelist.surface',
        'namelist.lateral.newBCs',
        'namelist.bottom',
        'namelist.tracers',
        'namelist.dynamics',
        'namelist.vertical',
        'namelist.compute',
        ]
    return run_desc
 
 
if __name__ == '__main__':
    main()
