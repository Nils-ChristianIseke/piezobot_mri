#!/bin/bash
CUDA_VISIBLE_DEVICES=0 nnUNetv2_train 001 3d_fullres 0 --npz -device cuda &
CUDA_VISIBLE_DEVICES=1 nnUNetv2_train 001 3d_fullres 1 --npz -device cuda &
CUDA_VISIBLE_DEVICES=2 nnUNetv2_train 001 3d_fullres 2 --npz -device cuda &
CUDA_VISIBLE_DEVICES=3 nnUNetv2_train 001 3d_fullres 3 --npz -device cuda &
nnUNetv2_train 001 3d_fullres 4 --npz -num_gpus 2
