"""Example script to define and execute a series of Salish Sea NEMO model runs.
"""
from __future__ import absolute_import
 
import os
 
import salishsea_cmd.api
 
 
def main():
    runs = ('30min','4hour')
    iodefs= ('iodef_30min.xml','iodef.xml')
    for run_id,iodefid in zip(runs,iodefs):
        run_desc = base_run_description(run_id)
        do_run(run_id, run_desc, iodefid)
       
 
def do_run(run_id, run_desc, iodefid):
    run_desc['run_id'] = run_id        
    salishsea_cmd.api.run_in_subprocess(
        run_id,
        run_desc,
        iodefid,
        os.path.join('/home/nksoonti/MEOPAR/SalishSea/results/storm_surges/final/dec2006/restart',run_id))
 
 
def base_run_description(run_id):
# Relative paths from SS-run-sets/SalishSea/storm_surges/new_config
    run_desc = salishsea_cmd.api.run_description(
        walltime='7:00:00',
        NEMO_code='../../../../NEMO-code/',
        forcing='../../../../NEMO-forcing/',
        runs_dir='../../../../SalishSea/',
        init_conditions=(
            '/home/nksoonti/MEOPAR/SalishSea/results/storm_surges/final/dec2006/all_forcing/SalishSea_00025920_restart.nc')
        )
    run_desc['email'] = 'nsoontie@eos.ubc.ca'
    # Relative paths to namelist section files
    run_desc['namelists'] = [
        'namelist.dec2006.rtime',
        'namelist.dec2006.domain',
        'namelist.surface',
        'namelist.lateral',
        'namelist.bottom',
        'namelist.tracers',
        'namelist.dynamics',
        'namelist.compute.6x14',
        ]
    return run_desc
 
 
if __name__ == '__main__':
    main()
