# StringTheoryTools

## Intro

The code in this repository is written in Mathematica and implemets various tools used in String theory/Supergravity such as [T duality](https://en.wikipedia.org/wiki/T-duality), [S duality](https://en.wikipedia.org/wiki/S-duality), rotations, boosts, some differential geometry, etc. So far all the functions are collected in two packages **DiffGeometry.m** and **TransformationRules.m**. Usage of every function is shown in various examples *Example...*.


## What is going on in this repo?

Package **TransformationRules.m**: boosts, rotations, S duality and T duality for NS-NS fields.

The package **TransformationRules** implements various dualities in String theory/Supergravity. A great example of utilizing T- S dualities and boosts is one of the solution-generating techniques, when you start with a simple solution and by performing a series of tranformations obtain something new. One of such solution-generating techniques was used to [construct](http://arxiv.org/abs/hep-th/0105136) explicit [fuzzballs](https://en.wikipedia.org/wiki/Fuzzball_(string_theory)) solutions.

An example of using the package is presented in *Example.KerrToD1.nb*, in which you start with a rotating black hole in 4 dimensions and perform a series of tranformations (add flat direction-boost-T duality-S duality) to obtain D1 brane. As a check we take the extremal non-rotating limit to check that the result is the well-known supersymmetric D1 brane.

Package **DiffGemetry**: calculation of connections, Riemann and Ricci tensors, Ricci scalar, spin connections.

One example of using the package is *Example.AdS2xS2.nb*, in which Einstein equations are checked for AdS2, S2 and AdS2xS2.

Another example is *Example.SUSY.IIB.nb*, in which we solve SUSY (Killing spinor) equations of type IIB supergravity in the NS-NS sector for one particular background - the near horizon NS5 brane.

## FAQ:

1. Why bother writing this code and not just use other available libs/frameworks?

I am not sure if there are any open source libs implemeting what I needed, but even if there are, it is better to write my own code to get a better understanding and eliminate errors due to other people :)


## TODO: 

1. Add more detailed description in README file.
2. Add Sen-Hassan-Cvetic method using large matrices to perform a series of dualities in one rotation [arxiv:hep-th/9512127](http://arxiv.org/abs/hep-th/9512127)
2. Implement duality rules for RR-fields
