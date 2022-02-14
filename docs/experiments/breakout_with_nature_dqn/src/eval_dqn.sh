api=ray
env=BreakoutNoFrameskip-v0
agent=DQN
gpu_id=2
filename=nature_dqn

output_dir='./results/eval/'$api'/'$env'/'$agent
restore_dir=results/ray/BreakoutNoFrameskip-v0/DQN/nature_dqn/DQNTrainer_BreakoutNoFrameskip-v0_13167_00000_0_2022-02-12_16-40-39/checkpoint_016000/checkpoint-16000

export CUDA_VISIBLE_DEVICES=$gpu_id
mkdir -p $output_dir

# shell/train_rl.sh ray pong DQN

# chcek deeping/rl/ray/ray_api update_parser
# we need to specify all the parameters
nohup python3  deeping/rl/run.py  \
    --api $api \
    --test \
    --env-name $env \
    --agent $agent \
    --custom-model CNNForNatureDQN \
    --restore-dir  $restore_dir\
    --test-epochs 5  \
    --test-save-info  \
    --dqn-horizon 108000 \
    --buffer-size 1000000 \
    --checkpoint-freq 1000 \
    --checkpoint-name  $filename  \
    --num-workers 0 \
    --num-gpus 0 \
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
    --stop-episode-reward-mean 10000  > $output_dir'/'$filename'_eval.out'  &