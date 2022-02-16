# Atari-Breakout with DQN model 

Training DQN variants model on Atari Environment. You can reproduce the results 


## Reproduce Results 

you can reproduce the **training** and **evaluation** with shell scripts which uses `ray`


* ✅ **training**:  `bash docs/experiments/nature_dqn/src/ray_dqn.sh  <environment>` 
* ✅  **evaluation**: `bash docs/experiments/nature_dqn/src/eval_dqn.sh  <environment>  <checkpoint-path>` 
  
*  example 
   *  environment : `BreakoutNoFrameskip-v0` 
   *  checkpoint-path : `'results/ray/BreakoutNoFrameskwip-v0/DQN/nature_dqn/DQNTrainer_BreakoutNoFrameskip-v0_8538f_00000_0_2022-02-12_16-43-51'`


### Notes

*  ⚠️ the checkpoint-path does not include the checkpoint number. Please change shell script to use limited checkpoint. 
*  ⚠️ This experiment will be extend to all atari envrionment 



## The list of implemented environments 

|Environments|Done|
|:-:|:-:|
|`BreakoutNoFrameskip-v0`| ✔️|







<img src="../../asset/nature_dqn_training.png" width=400px>

