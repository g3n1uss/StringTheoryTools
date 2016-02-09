# StringTheoryTools

## Intro

The code in this repository is written in Mathematica and implemets various tools used in String theory/Supergravity such as [T duality](https://en.wikipedia.org/wiki/T-duality), [S duality](https://en.wikipedia.org/wiki/S-duality), rotations, boosts, some differential geometry, etc.

A great example of utilizing T- S dualities and boosts is several solution-generating techniques, when you start with a simple solution and by performing a series of tranformations obtain something new. One of such solution-generating techniques was used to [construct](http://arxiv.org/abs/hep-th/0105136) explicit [fuzzballs](https://en.wikipedia.org/wiki/Fuzzball_(string_theory)) solutions.

## What is going on in this repo?

Package TransformationRules.m: boosts, rotations, S duality and T duality for NS-NS fields.

An example of using the package is presented in Example.KerrToD1.nb, in which you start with a rotating black hole in 4 dimensions and perform a series of tranformations (add flat direction-boost-T duality-S duality) to obtain D1 brane. As a check we take the extremal non-rotating limit to check that the result is the well-known supersymmetric D1 brane.

Package DiffGemetry: calculation of connections, Riemann and Ricci tensors, Ricci scalar.

An example of using the package is in Example.AdS2xS2.nb in which Einstein equations are checked for AdS2, S2 and AdS2xS2.

## FAQ:

1. Why bother writing the code and not use available libs/frameworks?

I am not sure if there are any open source libs implemeting what I needed, but even if there are, it is better to write my own code to get a better understanding and eliminate errors due to other people :)


## TODO: 

1. Add Sen-Hassan-Cvetic method using large matrices to perform a series of dualities in one rotation [arxiv:hep-th/9512127](http://arxiv.org/abs/hep-th/9512127)
2. Implement duality rules for RR-fields
3. Add more examples.
