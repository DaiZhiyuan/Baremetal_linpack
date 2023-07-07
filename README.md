# Baremetal_linpack
This project demonstrates the linpack benchmark in a baremetal environment.

# Linkpack source code

placeholder | placeholder
--|--
file|linackc
for | The LINPACK benchmark program done in C.(original version)
lang | C
by | Bonnie Toy 5/88.

> Download: https://netlib.org/benchmark/

# Running coremark on Arm FVP

```shell
● make run
terminal_0: Listening for serial connection on port 5000
terminal_1: Listening for serial connection on port 5001
terminal_2: Listening for serial connection on port 5002
terminal_3: Listening for serial connection on port 5003
LINPACK benchmark, Double precision.
Machine precision:  15 digits.
Array size 100 X 100.
Memory required:  79K.
Average rolled and unrolled performance:

    Reps Time(s) DGEFA   DGESL  OVERHEAD    KFLOPS
----------------------------------------------------
     128   0.97  91.75%   4.12%   4.12%  24315.412
     256   1.96  86.73%   5.61%   7.65%  24987.109
     512   3.92  89.29%   5.36%   5.36%  24380.952
    1024   7.88  88.83%   4.82%   6.35%  24513.098
    2048  15.81  88.93%   4.49%   6.58%  24496.502


Info: /OSCI/SystemC: Simulation stopped by user.
```

