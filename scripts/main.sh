#!/bin/sh

##SBATCH --gpus-per-node=1
#SBATCH --account=pls0151
#SBATCH --time=6:00:00
#SBATCH --cpus-per-task 40
#SBATCH -J diffneighb
##SBATCH -o prativa-%j.out #replace
#SBATCH --mail-type=END
#SBATCH --mail-user=ppokhrel03@student.ysu.edu #replace


module load miniconda3/4.10.3-py37
source activate autoTPred #replace
## srun python ./eye_movement.py callbacks=default datamodule.loader="neighbor" datamodule.neighb=5 > eye_movement_output.txt

# srun python ./Hyperopt/random/Catboost/eye_movement_random.py callbacks=default datamodule.loader="neighbor" datamodule.neighb=5 > ./Hyperopt/random/Catboost/eye_movement_random_output.txt

# srun python ./my_app.py hydra.mode=MULTIRUN framework=hyperopt dataset=gas-concentration sampler=rand algorithm=catboost > ./gas-concentration-rest-4.txt

# srun python ./my_app.py hydra.mode=MULTIRUN framework=hyperopt dataset=gas-concentration sampler=rand,tpe algorithm=xgboost,catboost > ./gas-concentration-rest.txt


srun python ./my_app.py hydra.mode=MULTIRUN framework=optuna dataset=eye_movement sampler=tpe algorithm=catboost,xgboost > ./justin.txt
# srun python ./my_app.py hydra.mode=MULTIRUN framework=hyperopt dataset=gas-concentration sampler=tpe algorithm=catboost > ./gas_new_2.txt

