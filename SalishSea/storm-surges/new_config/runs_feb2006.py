"""Example script to define and execute a series of Salish Sea NEMO model runs.
"""
from __future__ import absolute_import
 
import os
 
import salishsea_cmd.api
 
 
def main():
    run_desc = base_run_description()
    runs = ('all_forcing', 'tidesonly', 'weather_only', 'surgeonly')
    tides= ('lateral', 'lateral.tidesonly', 'lateral.tidesonly','lateral')
    surface=('surface','surface.nosurge','surface','surface.nosurge')
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
        os.path.join('/home/nksoonti/MEOPAR/SalishSea/results/storm_surges/final/feb2006/', run_id))
 
 
def base_run_description():
# Relative paths from SS-run-sets/SalishSea/storm_surges/new_config
    run_desc = salishsea_cmd.api.run_description(
        walltime='7:00:00',
        NEMO_code='../../../../NEMO-code/',
        forcing='../../../../NEMO-forcing/',
        runs_dir='../../../../SalishSea/',
        init_conditions=(
            '/home/dlatorne/MEOPAR/SalishSea/spin-up/31jan9feb'),
        )
    run_desc['email'] = 'nsoontie@eos.ubc.ca'
    # Relative paths to namelist section files
    run_desc['namelists'] = [
        'namelist.feb2006.time',
        'namelist.feb2006.domain',
        'namelist.surface',
        'namelist.lateral',
        'namelist.bottom',
        'namelist.tracers',
        'namelist.dynamics',
        'namelist.compute.12x27',
        ]
    return run_desc
 
 
if __name__ == '__main__':
    main()
