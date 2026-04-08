# Overview
This repository contains the input configuration files and training datasets required to reproduce the results presented in:
[![arXiv](https://img.shields.io/badge/arXiv-2510.05020-b31b1b.svg)](https://arxiv.org/abs/2510.05020)
[![DOI](https://img.shields.io/badge/DOI-10.48550/arXiv.2510.05020-blue)](https://doi.org/10.48550/arXiv.2510.05020)

**Comparing fine-tuning strategies for machine learning force fields in lithium-ion diffusion**· Nada Alghamdi, Paolo de Angelis, Pietro Asinari, Eliodoro Chiavazzo

## Repository Contents

### Fine-tuning_with_DeePMD_data

| Directory | Description |
|-----------|-------------|
| `ft200_pt{0, 100, 1000}/` | 210 fine-tuning data, (0, 100, 1000) pre-training data|
| `ft400_pt1000/` | 410 fine-tuning data, 1000 pre-training data|
| `ft700_pt{0,100,1000,10000}/` | 710 fine-tuning data with varying (0, 100, 1000, 10000) pre-training data|
| `ft800_pt{0,100,1000,10000}/` | 800 fine-tuning data with varying (0, 100, 1000, 10000) pre-training data|
| `ft1600_pt1000/` | 1600 fine-tuning data, 1000 pre-training data|

### Fine-tuning_with_MACE-MPA-0_data

| Directory | Description |
|-----------|-------------|
| `step_0/` | Initial step (FT1 & FT2 baseline) |
| `a_step_1/` | FT1 after step 1 |
| `a_step_2/` | FT1 after step 2 |
| `b_step_1/` | FT2 after step 1 |

## Citation

If you use this data in your research, please cite the original paper:

```bibtex
@article{alghamdi2025comparing,
  title={Comparing fine-tuning strategies of MACE machine learning force field for modeling Li-ion diffusion in LiF for batteries},
  author={Alghamdi, Nada and de Angelis, Paolo and Asinari, Pietro and Chiavazzo, Eliodoro},
  journal={arXiv preprint arXiv:2510.05020},
  year={2025}
}
```
## License

This work is licensed under a Creative Commons Attribution 4.0 International License.

You are free to:
- **Share** — copy and redistribute the material in any medium or format
- **Adapt** — remix, transform, and build upon the material for any purpose

Under the following terms:
- **Attribution** — You must give appropriate credit, provide a link to the license, and indicate if changes were made.

See the full license at: https://creativecommons.org/licenses/by/4.0/
