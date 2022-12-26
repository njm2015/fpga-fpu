#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2022.1 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Mon Dec 26 13:41:14 CST 2022
# SW Build 3526262 on Mon Apr 18 15:47:01 MDT 2022
#
# IP Build 3524634 on Mon Apr 18 20:55:01 MDT 2022
#
# usage: simulate.sh
#
# ****************************************************************************
set -Eeuo pipefail
# simulate design
echo "xsim add_sim_behav -key {Behavioral:add:Functional:add_sim} -tclbatch add_sim.tcl -log simulate.log"
xsim add_sim_behav -key {Behavioral:add:Functional:add_sim} -tclbatch add_sim.tcl -log simulate.log
