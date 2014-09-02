#!/bin/bash
time=`date +%Y%m%d%H%M`
#create complete testing temp dir
mkdir -p {{ complete_testing_temp_dir }} {{ complete_testing_dir }}
#copy tpcc test result
cd {{ tpcc_dir }} 
`which cp` -a `ls -lrt |tail -n 1` {{ complete_testing_temp_dir }}
#copy sysbench test result
cd {{ sysbench_dir }}
`which cp` -a `ls -lrt|tail -n 4` {{ complete_testing_temp_dir }}
#copy fio test result
cd {{ fio_dir }}
`which cp` -a `ls -lrt|tail -n 1` {{ complete_testing_temp_dir }}
#grep tpcc test result
tpcc_result=`tail -n 1 {{ complete_testing_temp_dir }}/*tpcc*  |awk '{print $1" "$2}'`
echo "Tpcc reslut is: $tpcc_result" >> {{ complete_testing_dir }}/{{ host }}_complete_testing_result-$time.log
#grep sysbench test result
cputest=`grep taken {{ complete_testing_temp_dir }}/*sysbench_cputest*`
echo "Sysbench cpu_test result is: $cputest" >> {{ complete_testing_dir }}/{{ host }}_complete_testing_result-$time.log
threads=`grep taken {{ complete_testing_temp_dir }}/*sysbench_threads*` 
echo "Sysbench sysbench_threads result is: $threads" >> {{ complete_testing_dir }}/{{ host }}_complete_testing_result-$time.log
mutexxx=`grep taken {{ complete_testing_temp_dir }}/*sysbench_mutexxx*`
echo "Sysbench sysbench_mutexxx result is: $mutexxx" >> {{ complete_testing_dir }}/{{ host }}_complete_testing_result-$time.log
memory=`grep taken {{ complete_testing_temp_dir }}/*sysbench_memory*`
echo "Sysbench sysbench_memory result is: memory" >> {{ complete_testing_dir }}/{{ host }}_complete_testing_result-$time.log
#grep fio test result
fio=`grep iops {{ complete_testing_temp_dir }}/*fio*`
echo "Fio result is: $fio" >> {{ complete_testing_dir }}/{{ host }}_complete_testing_result-$time.log
rm -rf {{ complete_testing_temp_dir }}
