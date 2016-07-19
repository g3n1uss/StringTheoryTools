# StringTheoryTools

## What is going on in this repo?

This repository is a collection of various mathematical tools (written in Mathematica) used in String theory/Supergravity such as [T duality](https://en.wikipedia.org/wiki/T-duality), [rotations](https://en.wikipedia.org/wiki/Rotation_matrix), [boosts](https://en.wikipedia.org/wiki/Lorentz_transformation#boost), some [differential geometry](https://en.wikipedia.org/wiki/Differential_geometry), some [group theory](https://en.wikipedia.org/wiki/Group_theory), etc. So far all the functions are collected in three packages **DiffGeometry.m**, **TransformationRules.m** and **GroupTheory.m**. Usage of every function is shown in various examples, e.g. *Example...*.


## Some details. Structure of the repository

Package **TransformationRules.m** implements boosts, rotations, S duality and T duality for NS-NS fields.

A great example of utilizing boosts and T/S dualities is a beautiful solution-generating technique (here by solutions we mean that they solve the equations of motion, such as Einstein and Maxwell equations), in which you start with a simple solution and by performing a series of transformations obtain something new. This solution-generating technique was used to [construct](http://arxiv.org/abs/hep-th/0105136) [fuzzballs](https://en.wikipedia.org/wiki/Fuzzball_(string_theory)).

An example of using the package is presented in *Example.KerrToD1.nb*, in which you start with a rotating black hole in 4 dimensions (Kerr black hole) and perform the series of transformations, namely: "add flat direction"->"boost"-"T duality"->"S duality", to obtain the D1 brane. At the end we take the extremal non-rotating limit to check that the result is the well-known supersymmetric D1 brane.

Package **DiffGemetry.m** implements computation of connections (Christoffel symbols), Riemann and Ricci tensors, Ricci scalar and spin connections.

One simple example of using the package is presented *Example.AdS2xS2.EinsteinEqs.nb*, in which the Einstein equations are checked for AdS2, S2 and AdS2xS2.

Another example is *Example.KillingSpinors.IIB.NearHorizonNS5.nb*, in which we solve SUSY (Killing spinor) equations of type IIB supergravity in the NS-NS sector for one particular background - the near horizon NS5 brane.

Package **GroupTheory.m** so far (TO BE EXPANDED) contains only one function computing of adjoint represenation of Lie algebra.

Example of using this package in shown in *Example.adjoint.su(2).nb* in which we start with su(2) Lie algebra in the fundamenatal represenation and compute the corresponding adjoint represenation.

## FAQ:

1. Why bother writing this code and not just use other available libs/frameworks?

I am not sure if there are any open source libs implementing what I needed, but even if there are, it is better to write my own code to get a better understanding and eliminate errors due to other people :)


## TODO: 

1. Add more detailed description in README file.
2. Add Sen-Hassan-Cvetic method using large matrices to perform a series of dualities in one rotation [arxiv:hep-th/9512127](http://arxiv.org/abs/hep-th/9512127)
3. Add more functions into **GroupTheory.m**
