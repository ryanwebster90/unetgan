CUDA_VISIBLE_DEVICES=0 python my_train.py \
--dataset FFHQ --parallel --shuffle   \
--which_best FID \
--batch_size 4 --num_G_accumulations 1 --num_D_accumulations 1 \
--num_D_steps 1 --G_lr 1e-4 --D_lr 5e-4 --D_B2 0.999 --G_B2 0.999 \
--G_attn 0 --D_attn 0 \
--SN_eps 1e-6 --BN_eps 1e-5 --adam_eps 1e-6 \
--G_ortho 0.0 \
--seed 99 \
--G_init ortho --D_init ortho \
--G_eval_mode \
--G_ch 64 --D_ch 64 \
--hier --dim_z 128 \
--ema --use_ema --ema_start 21000 \
--accumulate_stats --num_standing_accumulations 100  \
--test_every 10000 --save_every 10000 --num_best_copies 2 --num_save_copies 1 --seed 0 \
--sample_every 1000   \
--id ffhq_unet_bce_noatt_cutmix_consist --gpus "0" --unconditional \
--unet_mixup --slow_mixup --full_batch_mixup --consistency_loss_and_augmentation --warmup_epochs 100 \
--base_root results \
--data_folder ffhq_256 \
--resume --resume_from pretrained_model --epoch_id ep_82 \
--model my_BigGAN --learn_ratio .25 --name $0
