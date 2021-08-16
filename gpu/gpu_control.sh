# powersave mode - set graphics clock to be 210MHz, memory 405MHz
alias gpupowersave='sudo nvidia-smi -lgc 210; sudo nvidia-smi -lmc 405'
alias gpudefault='sudo nvidia-smi -rgc; sudo nvidia-smi -rmc'
alias gpuclockinfo='nvidia-smi -q -d CLOCK'
alias gpupowerinfo='nvidia-smi -q -d POWER'
alias gpuperfinfo='nvidia-smi -q -d PERFORMANCE'
# the output is not accruate, e.g, gpu 210MHz is supported but not listed
alias gpusupportedgr='nvidia-smi --query-supported-clocks=gr --format=csv'
alias gpusupportedmem='nvidia-smi --query-supported-clocks=mem --format=csv'
