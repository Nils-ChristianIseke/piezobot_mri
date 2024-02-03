#!/bin/bash
#SBATCH --time=00:30:00
#SBATCH --gres=gpu:4
#SBATCH --container-name=nvidia_pytorch_23_06
#SBATCH --container-writable
#SBATCH --container-remap-root
#SBATCH --container-mounts=/etc/slurm/task_prolog:/etc/slurm/task_prolog,/scratch:/scratch,/pfs/work7/workspace/scratch/hd_oy280-nnUNetv2:/workspace
#SBATCH --error=error_job
#SBATCH --output=output_job
#SBATCH --mail-type=ALL
#SBATCH --mail-user=nilsmailiseke@gmail.com
#SBATCH --job-name=nnUnet_job

#. install_nnUnet.sh
#. install_hiddenlayers.sh
. setup_paths.sh
#INPUT_FOLDER="/workspace/nnUNet_raw/Dataset001_NeedlePhantomV1/imagesTr"
INPUT_FOLDER="/workspace/mri_images/test"
#OUTPUT_FOLDER="/workspace/nnUNet_inference/Dataset001_NeedlePhantomV1/inference"
OUTPUT_FOLDER="/workspace/mri_images/test_output"
#OUTPUT_FOLDER_PP="/workspace/nnUNet_inference/Dataset001_NeedlePhantomV1/postprocessed"
OUTPUT_FOLDER_PP="/workspace/mri_images/test_output_pp"

nnUNetv2_predict -d Dataset001_NeedlePhantomV1 -i $INPUT_FOLDER -o $OUTPUT_FOLDER -f  0 1 2 3 4 -tr nnUNetTrainer -c 3d_fullres -p nnUNetPlans

nnUNetv2_apply_postprocessing -i $OUTPUT_FOLDER -o $OUTPUT_FOLDER_PP -pp_pkl_file /workspace/nnUNet_results/Dataset001_NeedlePhantomV1/nnUNetTrainer__nnUNetPlans__3d_fullres/crossval_results_folds_0_1_2_3_4/postprocessing.pkl -np 8 -plans_json /workspace/nnUNet_results/Dataset001_NeedlePhantomV1/nnUNetTrainer__nnUNetPlans__3d_fullres/crossval_results_folds_0_1_2_3_4/plans.json

