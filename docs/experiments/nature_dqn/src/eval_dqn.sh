#!/bin/bash

api=ray
env=$1
agent=DQN
gpu_id=2
filename=nature_dqn

base_dir=$2

for check in $(seq 1000 1000 15000)
do
    if [[ $check -gt 10000 ]]
    then
        check_dir='0'$check
    else
        check_dir='00'$check
    fi

    output_dir='./results/eval/'$api'/'$env'/'$agent'/'$filename
    restore_dir=$base_dir'/checkpoint_'$check_dir'/checkpoint-'$check

    export CUDA_VISIBLE_DEVICES=$gpu_id
    mkdir -p $output_dir

    python3  deeping/rl/run.py  \
        --api $api \
        --test \
        --env-name $env \
        --agent $agent \
        --custom-model CNNForNatureDQN \
        --restore-dir  $restore_dir\
        --test-epochs 200  \
        --test-save-info  \
        --dqn-horizon 108000 \
        --buffer-size 1000000 \
        --checkpoint-freq 1000 \
        --checkpoint-name  $filename  \
        --num-workers 0 \
        --num-gpus 1 \
        --local-dir $output_dir \
        --train-batch-size 32 \
        --rollout-fragment-length 8 \
        --learning-starts 1 \
        --target-network-update-freq 10000 \
        --ray-hiddens 512 \
        --ray-fcnet-hiddens 512 \
        --exploration-initial 0.05 \
        --exploration-final 0.05 \
        --exploration-final-step 1000000 \
        --stop-training-iteration 100000000 \
        --stop-episode-reward-mean 10000
done