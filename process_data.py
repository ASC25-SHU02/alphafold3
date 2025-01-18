import os
os.environ['JAX_PLATFORMS'] = 'cpu'
import jax
import jax.numpy as jnp
import numpy as np
from alphafold3.model.network.diffusion_head import fourier_embeddings
from alphafold3.model.network.diffusion_head import noise_schedule


# 调用 fourier_embeddings 函数
noise_levels = noise_schedule(jnp.linspace(0, 1, 200 + 1))
print("Noise levels:", noise_levels)
SIGMA_DATA = 16.0
embedding_dim = 256
fourier_embeddings = fourier_embeddings((1 / 4) * jnp.log(noise_levels[1:] / SIGMA_DATA), dim=embedding_dim)
print("Fourier embeddings:", fourier_embeddings)