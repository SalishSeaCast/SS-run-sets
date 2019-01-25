#!/bin/bash

#SBATCH --job-name=deflate
#SBATCH --time=3:00:00
#SBATCH --mem=5G
#SBATCH --mail-user=eolson@eoas.ubc.ca
#SBATCH --mail-type=ALL
#SBATCH --account=def-allen
# stdout and stderr file paths/names
#SBATCH --output=/scratch/eolson/results/GLSsummer15_0/stdout_deflate4
#SBATCH --error=/scratch/eolson/results/GLSsummer15_0/stderr_deflate4

ff=/scratch/eolson/results/GLSsummer15_0/

echo "started at $(date)"
module load nco/4.6.6

ncrcat $ff"SalishSea_1h_20150501_20150629_prod_T_20150501-20150501.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150502-20150502.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150503-20150503.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150504-20150504.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150505-20150505.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150506-20150506.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150507-20150507.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150508-20150508.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150509-20150509.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150510-20150510.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150501-20150510.nc"

ncrcat $ff"SalishSea_1h_20150501_20150629_prod_T_20150511-20150511.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150512-20150512.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150513-20150513.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150514-20150514.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150515-20150515.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150516-20150516.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150517-20150517.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150518-20150518.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150519-20150519.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150520-20150520.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150511-20150520.nc"

ncrcat $ff"SalishSea_1h_20150501_20150629_prod_T_20150521-20150521.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150522-20150522.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150523-20150523.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150524-20150524.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150525-20150525.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150526-20150526.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150527-20150527.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150528-20150528.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150529-20150529.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150530-20150530.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150521-20150530.nc"

ncrcat $ff"SalishSea_1h_20150501_20150629_prod_T_20150531-20150531.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150601-20150601.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150602-20150602.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150603-20150603.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150604-20150604.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150605-20150605.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150606-20150606.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150607-20150607.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150608-20150608.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150609-20150609.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150531-20150609.nc"

ncrcat $ff"SalishSea_1h_20150501_20150629_prod_T_20150610-20150610.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150611-20150611.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150612-20150612.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150613-20150613.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150614-20150614.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150615-20150615.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150616-20150616.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150617-20150617.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150618-20150618.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150619-20150619.nc" $ff"SalishSea_1h_20150501_20150629_prod_T_20150610-20150619.nc"

echo "Results deflation ended at $(date)"