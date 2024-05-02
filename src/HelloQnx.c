#include <stdio.h>
#include <sys/syspage.h>

int main() {
    struct cpuinfo_info info;
    
    if (init_cpuinfo(&info) == -1) {
        perror("init_cpuinfo");
        return 1;
    }

    printf("CPU ID: %d\n", info.cpu);

    return 0;
}