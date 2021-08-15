# use cpupower to control cpu frequency
# to check if cpupower is available, run "cpupower" in terminal
alias cpupowersave='sudo cpupower frequency-set -g powersave'
alias cpudefault='sudo cpupower frequency-set -g schedutil'
alias cpuperformance='sudo cpupower frequency-set -g performance'
alias cpu1200='sudo cpupower frequency-set -f 1200MHz'
alias cpuinfo='cpupower frequency-info'
