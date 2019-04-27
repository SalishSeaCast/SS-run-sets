""" Script to define and execute a series of Salish Sea NEMO model runs.
"""
from __future__ import absolute_import

import os

import salishsea_cmd.api


def main():
    run_desc = base_run_description()
    run_ids = ['bathy10', 'bathy2', 'bathy2_nowinds',  'bathy6', 'bathy9']
    surfaces = ['mynamelist.surface.bathy69',
                'mynamelist.surface', 'mynamelist.surface.nowinds',
                'mynamelist.surface.bathy69', 'mynamelist.surface.bathy69']
    domains = ['namelist.domain.bathy69',
               'namelist.domain.bathy2', 'namelist.domain.bathy2',
               'namelist.domain.bathy69', 'namelist.domain.bathy69']
    bathys = ['bathy_meter_SalishSea10.nc',
              'bathy_meter_SalishSea2.nc', 'bathy_meter_SalishSea2.nc',
              'bathy_meter_SalishSea6.nc', 'bathy_meter_SalishSea9.nc']
    for run_id, domain, bathy, surface in zip(run_ids, domains, bathys, surfaces):
        do_run(run_id, domain, bathy, surface, run_desc)


def do_run(run_id, domain, bathy, surface, run_desc):
    run_desc['run_id'] = run_id
    run_desc['namelists'][1] = domain
    run_desc['namelists'][2] = surface
    run_desc['grid']['bathymetry'] = bathy
    salishsea_cmd.api.run_in_subprocess(
        run_id,
        run_desc,
        'iodef_tides.xml',
        os.path.join('/home/nksoonti/MEOPAR/SalishSea/results/tides/bathymods', run_id))


def base_run_description():
    # Relative paths from SS-run-sets/SalishSea/nancy/tides/bathymods
    run_desc = salishsea_cmd.api.run_description(
        walltime='21:00:00',
        NEMO_code='../../../../../NEMO-code/',
        forcing='../../../../../NEMO-forcing/',
        runs_dir='../../../../../SalishSea/',
        init_conditions=(
            '/home/dlatorne/MEOPAR/SalishSea/spin-up/'
            '11apr20apr/SalishSea_01529280_restart.nc'),
        )
    run_desc['email'] = 'nsoontie@eos.ubc.ca'
    # Relative paths to namelist section files
    run_desc['forcing']['atmospheric'] = '/home/nksoonti/MEOPAR/CGRF/NEMO-atmos'
    run_desc['namelists'] = [
        'mynamelist21apr30may.time',
        '../../../namelist.domain',
        'mynamelist.surface',
        '../../../namelist.lateral',
        '../../../namelist.bottom',
        '../../../namelist.tracers',
        'namelist.dynamics',
        '../../../namelist.compute.12x27',
        ]
    return run_desc
 
 
if __name__ == '__main__':
    main()
