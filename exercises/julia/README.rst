Julia Cython
------------

This exercise provides practice at writing a C extension module using Cython.
The object of this is to take an existing Python module `julia_pure_python.py`
and speed it up by re-writing it in Cython.

1. The file `julia_pure_python.py` calculates the Julia set in pure Python. 
   To time it, run the following::

        python timing.py julia_pure_python.py

   See `python timing.py -h` to see other arguments that the timing script
   accepts.

2. To bring up an interactive Julia set explorer, run the following::

        python julia_ui.py julia_pure_python.py

3. The pure Python version of the code has been copied into
   `julia_cython.pyx`.  You will be modifying this file to get better runtime
   performance.  To get a simple timing, please run the following from the
   command line or Windows cmd prompt::

       python timing.py julia_cython.pyx

   Do you notice any speedup over the pure Python version?  To use the
   interactive GUI, run::

      python julia_ui.py julia_cython.pyx
  
3. Add variable typing for the scalar variables in the julia_cython.pyx file.
   See how much of a speed-up you get.  See the slide material for reference.

4. Turn the `kernel` function into a C only function.

5. Use typed memoryviews to further improve performance.

Bonus
~~~~~

If you are using an OpenMP-capable compiler (e.g. gcc; unfortunately clang
does not support OpenMP at this time), use cython's prange to parallelize the
computation.
