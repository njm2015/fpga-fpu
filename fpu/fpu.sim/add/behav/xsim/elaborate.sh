#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2022.1 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Mon Dec 26 13:41:12 CST 2022
# SW Build 3526262 on Mon Apr 18 15:47:01 MDT 2022
#
# IP Build 3524634 on Mon Apr 18 20:55:01 MDT 2022
#
# usage: elaborate.sh
#
# ****************************************************************************
set -Eeuo pipefail
# elaborate design
echo "xelab --incr --debug typical --relax --mt 8 -L lib_fp -L global_main -L lib_common -L secureip --snapshot add_sim_behav lib_fp.add_sim -log elaborate.log"
xelab --incr --debug typical --relax --mt 8 -L lib_fp -L global_main -L lib_common -L secureip --snapshot add_sim_behav lib_fp.add_sim -log elaborate.log
