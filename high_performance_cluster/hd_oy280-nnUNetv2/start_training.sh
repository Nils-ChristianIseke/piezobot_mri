#!/bin/bash
for fold in 0 1 2 3 4;
do CUDA_VISIBLE_DEVICES=0 nnUNetv2_train 001 3d_fullres $fold --npz -device cuda; done;
