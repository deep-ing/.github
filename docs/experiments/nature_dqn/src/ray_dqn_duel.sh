
api=ray
env=$1
agent=DQN
gpu_id=2
filename=nature_dqn_dueling

output_dir='./results/'$api'/'$env'/'$agent

export CUDA_VISIBLE_DEVICES=$gpu_id
mkdir -p $output_dir


# chcek deeping/rl/ray/ray_api update_parser
# we need to specify all the parameters
nohup python3  deeping/rl/run.py  \
    --api $api \
    --train \
    --env-name $env \
    --agent $agent \
    --custom-model CNNForNatureDQN \
    --dqn-horizon 108000 \
    --dqn-dueling \
    --buffer-size 1000000 \
    --checkpoint-freq 1000 \
    --checkpoint-name  $filename  \
    --num-workers 4 \
    --num-gpus 1 \
    --verbose 1 \
    --local-dir $output_dir \
    --train-batch-size 32 \
    --rollout-fragment-length 8 \
    --learning-starts 1 \
    --target-network-update-freq 10000 \
    --exploration-initial 1.0 \
    --exploration-final 0.1 \
    --exploration-final-step 1000000 \
    --stop-training-iteration 200000000 \
    --stop-episode-reward-mean 10000  > $output_dir'/'$filename'_train_log.out'  &
