""" Script to define and execute a series of Salish Sea NEMO model runs.
"""
from __future__ import absolute_import

import os

import salishsea_cmd.api


def main():
    run_desc = base_run_description()
    run_ids = ['dwr_kw', 'dwr_kkl',
               'dwr_holl','dwr_bcs',
               'dwr_background','dwr_nowinds',]
    verticals = ['namelist.vertical.kw', 'namelist.vertical.kkl',
                'namelist.vertical','namelist.vertical',
                'namelist.vertical.background','namelist.vertical']  
    for run_id, vertical in zip(run_ids,verticals):
        do_run(run_id, vertical, run_desc)


def do_run(run_id, vertical, run_desc):
    run_desc['run_id'] = run_id
    run_desc['namelists']['namelist_cfg'][7]=vertical
    if run_id == 'dwr_nowinds':
       run_desc['namelists']['namelists_cfg'][2]='namelist.surface.nowinds'
    elif run_id == 'dwr_bcs':
       run_desc['namelists']['namelists_cfg'][3]='namelist.lateral.newBCs'
    elif run_id == 'dwr_holl']:
       run_desc['namelists']['namelists_cfg'][6]='namelists.dynamics.holl'
    salishsea_cmd.api.run_in_subprocess(
        run_id,
        run_desc,
        'iodef.xml',
        os.path.join('/home/nksoonti/MEOPAR/SalishSea/results/mixing_paper',
                     run_id))


def base_run_description():
    # Relative paths from SS-run-sets/SalishSea/nancy/
    run_desc = salishsea_cmd.api.run_description(
        walltime='21:00:00',
        NEMO_code='/home/nksoonti/MEOPAR/NEMO-3.6-code/',
        forcing_path='/home/nksoonti/MEOPAR/NEMO-forcing/',
        XIOS_code='/home/nksoonti/MEOPAR/XIOS/',
        runs_dir='/home/nksoonti/MEOPAR/SalishSea/',
        forcing={'NEMO-atmos': {'link to': '/home/nksoonti/MEOPAR/GEM2.5/ops/NEMO-atmos/'},
                 'rivers': {'link to': 'rivers'},
                 'open_boundaries': {'link to': 'open_boundaries'},
                 'initial_strat': {'link to': '/home/dlatorne/MEOPAR/SalishSea/spin-up/9aug18aug/'},
                 },
        )
    run_desc['email'] = 'nsoontie@eos.ubc.ca'
    # Relative paths to namelist section files
    run_desc['namelists']['namelist_cfg'] = [
        'namelist.time.19aug28sep',
        'namelist.domain.19aug',
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
