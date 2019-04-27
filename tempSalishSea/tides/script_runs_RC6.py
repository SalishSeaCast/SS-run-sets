""" Script to define and execute a series of Salish Sea NEMO model runs.
All use the same RC4, corr4 files but include different numbers of tidal
constituents
"""
from __future__ import absolute_import
 
import os
 
import salishsea_cmd.api
 
 
def main():
    run_desc = base_run_description()
    run_id = 'RC6'
    do_run(run_id, run_desc)
 
 
def do_run(run_id, run_desc):
    run_desc['run_id'] = run_id
    run_desc['namelists'][3] = (
        'M2_Flux/mynamelist.lateral_Flux_{}'.format(run_id))
    salishsea_cmd.api.run_in_subprocess(
        run_id,
        run_desc,
        'iodef_tides_10d.xml',
        os.path.join('/home/sallen/MEOPAR/SalishSea/', run_id))
 
 
def base_run_description():
    # Relative paths from SS-run-sets/SalishSea/tides/
    run_desc = salishsea_cmd.api.run_description(
        walltime='11:00:00',
        NEMO_code='../../../NEMO-code/',
        forcing='../../../NEMO-forcing/',
        runs_dir='../../../SalishSea/',
        init_conditions=(
            '/home/dlatorne/MEOPAR/SalishSea/spin-up/'
            '11apr20apr/SalishSea_01529280_restart.nc'),
        )
    run_desc['email'] = 'foo@example.com'
    # Relative paths to namelist section files
    run_desc['namelists'] = [
        'mynamelist21apr10may.time',
        '../namelist.domain',
        'mynamelist.surface',
        'mynamelist.lateral',
        '../namelist.bottom',
        '../namelist.tracers',
        'mynamelist.dynamics15N',
        '../namelist.compute.12x27',
        ]
    return run_desc
 
 
if __name__ == '__main__':
    main()
