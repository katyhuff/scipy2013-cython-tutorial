# --- Python std lib imports -------------------------------------------------
from time import time
import numpy as np

def abs_sq(zr, zi):
    return zr * zr + zi * zi

def kernel(zr, zi, cr, ci, lim, cutoff):
    count = 0
    lim_sq = lim * lim
    while abs_sq(zr, zi) < lim_sq and count < cutoff:
        zr, zi = zr * zr - zi * zi + cr, 2 * zr * zi + ci
        count += 1
    return count

def compute_julia(cr, ci, N, bound, lim, cutoff):
    julia = np.empty((N, N), dtype=np.uint32)
    grid = np.array(np.linspace(-bound, bound, N), dtype=np.float32)
    t0 = time()
    for i in range(N):
        x = grid[i]
        for j in range(N):
            y = grid[j]
            julia[i,j] = kernel(x, y, cr, ci, lim, cutoff)
    return julia, time() - t0
