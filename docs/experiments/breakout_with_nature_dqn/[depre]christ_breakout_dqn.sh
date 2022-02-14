
#!/bin/bash
api=christ
env=BreakoutNoFrameskip-v0
agent=DQN
gpu_id=1
filename=EVAL_VERSION
learning_iteration=1

output_dir='./results/'$api'/'$env'/'$agent

export CUDA_VISIBLE_DEVICES=$gpu_id
mkdir -p $output_dir

# shell/train_rl.sh ray pong DQN

# chcek deeping/rl/ray/ray_api update_parser
# we need to specify all the parameters
nohup python3  deeping/rl/run.py  \
    --api $api \
    --train \
    --seed 0 \
    --christ-eval \
    --christ-eval-step 1000000 \
    --christ-eval-save-state \
    --christ-eval-iter 30 \
    --christ-store-model \
    --christ-store-model-step 1000000 \
    --env-name $env \
    --agent $agent \
    --lr 0.00025 \
    --gamma 0.99 \
    --horizon 5000 \
    --local-dir $output_dir \
    --buffer-size 1000000 \
    --christ-model-type CNNForNatureDQN  \
    --christ-learning-iteration $learning_iteration  \
    --local-dir $output_dir  \
    --train-batch-size 32 \
    --target-network-update-freq 10000 \
    --exploration-initial 1.0 \
    --exploration-final 0.1 \
    --exploration-final-step 1000000 \
    --gradient-clipping-norm 20 \
    --timesteps-max 200000000  > $output_dir'/'$filename$learning_iteration'_train_log.out'  &