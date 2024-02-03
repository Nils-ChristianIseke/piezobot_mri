#!/bin/bash
CUDA_VISIBLE_DEVICES=0 nnUNetv2_train 001 3d_fullres --c 0 --npz -device cuda &
CUDA_VISIBLE_DEVICES=1 nnUNetv2_train 001 3d_fullres --c 1 --npz -device cuda &
CUDA_VISIBLE_DEVICES=2 nnUNetv2_train 001 3d_fullres --c 2 --npz -device cuda &
CUDA_VISIBLE_DEVICES=3 nnUNetv2_train 001 3d_fullres --c 3 --npz -device cuda 
