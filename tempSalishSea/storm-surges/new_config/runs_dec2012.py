"""Example script to define and execute a series of Salish Sea NEMO model runs.
"""
from __future__ import absolute_import
 
import os
 
import salishsea_cmd.api
 
 
def main():
    run_desc = base_run_description()
    runs = ('all_forcing','weather_only','no_pressure',)
    tides= ('lateral','lateral.tidesonly','lateral.tidesonly',)
    surface=('surface.ops','surface.ops','surface.nopressure.ops',)
    for run_id,tide_id,surface_id in zip(runs,tides,surface):
        do_run(run_id, run_desc, tide_id, surface_id)
 
 
def do_run(run_id, run_desc, tide_id, surface_id):
    run_desc['run_id'] = run_id
    run_desc['namelists'][3] = (
        'namelist.{}'.format(tide_id))
    run_desc['namelists'][2] = (
        'namelist.{}'.format(surface_id))
    salishsea_cmd.api.run_in_subprocess(
        run_id,
        run_desc,
        'iodef.xml',
        os.path.join('/home/nksoonti/MEOPAR/SalishSea/results/storm_surges/final/dec2012/ops/', run_id))
 
 
def base_run_description():
# Relative paths from SS-run-sets/SalishSea/storm_surges/new_config
    run_desc = salishsea_cmd.api.run_description(
        walltime='15:00:00',
        NEMO_code='../../../../NEMO-code/',
        forcing='../../../../NEMO-forcing/',
        runs_dir='../../../../SalishSea/',
        init_conditions=(
            '/home/nksoonti/MEOPAR/SalishSea/results/spin-up/7dec16dec'),
        )
    run_desc['email'] = 'nsoontie@eos.ubc.ca'
    # Relative paths to namelist section files
    run_desc['namelists'] = [
        'namelist.dec2012.time',
        'namelist.dec2012.domain',
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
