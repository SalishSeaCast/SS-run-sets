""" Script to define and execute a series of Salish Sea NEMO model runs.
All use the same RC4, corr4 files but include different numbers of tidal
constituents
"""
from __future__ import absolute_import

import os

import salishsea_cmd.api


def main():
    run_desc = base_run_description()
    run_ids = ['dwr_base_enst', 'dwr_base_apr', 'dwr_corrected_apr']
    laterals = [ 'namelist.lateral', 'namelist.lateral', 'namelist.lateral.corrected']
    dynamics = ['namelist.dynamics.enst', 'namelist.dynamics','namelist.dynamics']
    for run_id, lateral, dyn in zip(run_ids, laterals, dynamics):
        do_run(run_id, run_desc, lateral, dyn)


def do_run(run_id, run_desc, lateral, dyn):
    run_desc['run_id'] = run_id
    run_desc['namelists'][3] = lateral
    run_desc['namelists'][6] = dyn
    salishsea_cmd.api.run_in_subprocess(
        run_id,
        run_desc,
        'iodef.eddy.1d.xml',
        os.path.join('/home/nksoonti/MEOPAR/SalishSea/results/', run_id),
        nemo34=True)


def base_run_description():
    # Relative paths from SS-run-sets/SalishSea/nancy/
    run_desc = salishsea_cmd.api.run_description(
        walltime='22:00:00',
        NEMO_code='../../../../NEMO-code/',
        forcing='../../../../NEMO-forcing/',
        runs_dir='../../../../SalishSea/',
        init_conditions=(
            '/home/dlatorne/MEOPAR/SalishSea/spin-up/'
            '11apr20apr/SalishSea_01529280_restart.nc'),
        nemo34=True
        )
    run_desc['email'] = 'nsoontie@eos.ubc.ca'
    run_desc['forcing']['atmospheric'] = '/home/nksoonti/MEOPAR/CGRF/NEMO-atmos/'
    # Relative paths to namelist section files
    run_desc['namelists'] = [
        'mynamelist21apr30may.time',
        'mynamelist.domain',
        'namelist.surface',
        '../tides/mynamelist.lateral',
        '../../namelist.bottom',
        'namelist.tracers',
        '../../tides/mynamelist.dynamics15N',
        '../../namelist.compute.12x27',
        ]
    return run_desc
 
 
if __name__ == '__main__':
    main()
