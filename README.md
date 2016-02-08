# StringTheoryTransformations

The code in this repository is written in Mathematica and implemets various symmetry transformations in String theory/Supergravity such as [T duality](https://en.wikipedia.org/wiki/T-duality), [S duality](https://en.wikipedia.org/wiki/S-duality), rotations, boosts.

A great example of utilizing such symmetries is solution-generating techniques, when one can start with a simple solution and by performing a series of dualities obtain something new. One of such solution-generating techniques was used to [obtain](http://arxiv.org/abs/hep-th/0105136) the explicit solution for [fuzzballs](https://en.wikipedia.org/wiki/Fuzzball_(string_theory)).

Boosts, rotations, S duality and T duality for NS-NS fields are implemented in the package TranformationRules.m. The example of using these transformations is presented in Example.KerrToD1.nb, in which you start with a rotating black hole in 4 dimensions and perform a series of tranformations (add flat direction-boost-T duality-S duality) to obtain D1 brane. As a check we take the extremal non-rotating limit to check that the result is the well-known supersymmetric D1 brane.




TODO: 

1. Add Sen-Hassan-Cvetic method using large matrices to perform a series of dualities in one rotation [arxiv:hep-th/9512127](http://arxiv.org/abs/hep-th/9512127)
2. Implement duality rules for RR-fields
3. Add more examples.
