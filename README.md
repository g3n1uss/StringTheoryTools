# StringTheoryTools

## FAQ, disclaimer.

1. Why bother writing this code and not just use other available libs/frameworks?

I am not sure if there are any open source libs implementing desired functionality, but even if there are, it is better to write my own code to get a better understanding and eliminate possible errors.

## What is going on in this repo?

This repository is a collection of various mathematical tools (written in Mathematica) used in String theory/Supergravity such as [T duality](https://en.wikipedia.org/wiki/T-duality), [rotations](https://en.wikipedia.org/wiki/Rotation_matrix), [boosts](https://en.wikipedia.org/wiki/Lorentz_transformation#boost), some [differential geometry](https://en.wikipedia.org/wiki/Differential_geometry) and [group theory](https://en.wikipedia.org/wiki/Group_theory), etc. So far all the functions are collected in three packages **DiffGeometry.m**, **TransformationRules.m** and **GroupTheory.m**. Usage of each function is demonstrated in various examples, e.g. *Example...*.


## Some details. Structure of the repository

1. Package **TransformationRules.m** implements boosts, rotations, S duality and T duality for NS-NS fields - the Buscher rules.

A great example of utilizing boosts and T/S dualities is a powerful solution-generating technique (solutions of supergravity equations of motion), in which one starts with a simple solution (e.g. the [Schwarzschild black hole](https://en.wikipedia.org/wiki/Schwarzschild_metric)) and by performing a series of various transformations obtains something new (e.g. [D-branes](https://en.wikipedia.org/wiki/D-brane)). This solution-generating technique was used in http://arxiv.org/abs/hep-th/0105136 to construct the [fuzzballs](https://en.wikipedia.org/wiki/Fuzzball_(string_theory)).

In *Example.KerrToD1.nb* we demonstrate this solution-generating technique. We start with a rotating black hole in 4 dimensions (the [Kerr black hole](https://en.wikipedia.org/wiki/Rotating_black_hole)) and perform the following series of transformations: "add flat direction"->"boost"->"T duality"->"S duality", to obtain the black D1 brane. At the end we take the extremal static (no rotation) limit to check that the result is the well-known supersymmetric D1 brane.

2. Package **DiffGemetry.m** implements computation of connections (Christoffel symbols), Riemann and Ricci tensors, Ricci scalar and spin connections.

One simple example of using the package is *Example.AdS2xS2.EinsteinEqs.nb*, in which the Einstein equations are checked for AdS2, S2 and AdS2xS2.

Another example, *Example.KillingSpinors.IIB.NearHorizonNS5.nb*, in which we solve SUSY (Killing spinor) equations of type IIB supergravity in the NS-NS sector for one particular background - the near horizon NS5 brane.

3. Package **GroupTheory.m** contains some group-theoretical functionality, such as computing of adjoint represenation of Lie algebra, perfoming the Cartan-Weyl decomposition, tools needed to work with superalgebras, etc.

*Example.adjoint.su(2).nb*: we start with su(2) Lie algebra in the fundamenatal represenation and compute the corresponding adjoint represenation.

Another example, *Example.CartanWeyl.of.SO(5).nb*, shows how to perform the Cartan-Weyl decomposition for so(5) albegra (COMPLETE).

*Example.GradedYangBaxter.psu(1,1).Holom.nb* demonstrates an example of dealing with psu(1,1|2) Lie superalgebra. We solve the modified graded Yang-Baxter equation for this superalgebra.


## TODO: 

1. Add more detailed description in README file.
2. Add Sen-Hassan-Cvetic method using large matrices to perform a series of dualities in one rotation [arxiv:hep-th/9512127](http://arxiv.org/abs/hep-th/9512127)
3. Add more functions into **GroupTheory.m**
