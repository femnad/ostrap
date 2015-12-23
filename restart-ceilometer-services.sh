#!/bin/bash
for service in ceilometer-{agent-{central,notification},api,collector,alarm-{evaluator,notifier}}
do
    sudo service $service restart
done
