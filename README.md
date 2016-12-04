# StringTheoryTools

## FAQ, disclaimer.

### Why bother writing this code and not just use other available libs/frameworks?

I am not sure if there are any open source libs implementing the desired functionality, but even if there are, it is better to write my own code to get a better understanding of what is going on and eliminate possible errors.

Code from this repository was used in the following papers:
* Y. Chervonyi and O. Lunin, “Generalized lambda-deformations of AdS_p x S^p,” [Generalized lambda-deformations of AdSp x Sp](http://dx.doi.org/10.1016/j.nuclphysb.2016.10.014), [arXiv:1608.06641 [hep-th]](http://arxiv.org/abs/arXiv:1608.06641).
* Y. Chervonyi and O. Lunin, “Supergravity background of the lambda-deformed AdS_3 x S^3 supercoset,” [Nucl.Phys. B910 (2016) 685-711](http://dx.doi.org/10.1016/j.nuclphysb.2016.07.023), [arXiv:1606.00394 [hep-th]](http://arxiv.org/abs/arXiv:1606.00394).
* Y. Chervonyi, “Towards higher dimensional black rings,” [Phys.Rev. D92 (2015) 12, 124037](http://dx.doi.org/10.1103/PhysRevD.92.124037), [arXiv:1510.06041 [hep-th]](http://arxiv.org/abs/arXiv:1510.06041).
* Y. Chervonyi and O. Lunin, “Killing(-Yano) Tensors in String Theory,”  [JHEP 1509, 182 (2015)](http://dx.doi.org/10.1007/JHEP09(2015)182)  [arXiv:1505.06154 [hep-th]](http://arxiv.org/abs/arXiv:1505.06154).
* Y. Chervonyi and O. Lunin, “(Non)-Integrability of Geodesics in D-brane Backgrounds,” [JHEP  1402, 061 (2014)](http://dx.doi.org/10.1007/JHEP02(2014)061) [arXiv:1311.1521 [hep-th]](http://arxiv.org/abs/arXiv:1311.1521).

## What is going on in this repo?

This repository gives real examples of various mathematical tools (written in Mathematica) used in String theory/Supergravity such as [T duality](https://en.wikipedia.org/wiki/T-duality), [rotations](https://en.wikipedia.org/wiki/Rotation_matrix), [boosts](https://en.wikipedia.org/wiki/Lorentz_transformation#boost), some [differential geometry](https://en.wikipedia.org/wiki/Differential_geometry) and [group theory](https://en.wikipedia.org/wiki/Group_theory), etc. So far all the functions are collected in three packages **DiffGeometry**, **TransformationRules** and **GroupTheory** located in the [Packages](https://github.com/g3n1uss/StringTheoryTools/tree/master/Packages) folder. Usage of some of the functions is demonstrated in various examples located in the [Examples](https://github.com/g3n1uss/StringTheoryTools/tree/master/Examples) folder.


## Some details. Structure of the repository

1. Package [TransformationRules](https://github.com/g3n1uss/StringTheoryTools/blob/master/Packages/TransformationRules.m) implements boosts, rotations, S duality and T duality (the Buscher rules) for NS-NS fields.

   A great example of utilizing boosts and T/S dualities is a powerful solution-generating technique (solutions of supergravity equations of motion), in which one starts with a simple solution (e.g. the [Schwarzschild black hole](https://en.wikipedia.org/wiki/Schwarzschild_metric)) and by performing a series of various transformations obtains something new (e.g. [D-branes](https://en.wikipedia.org/wiki/D-brane)). This solution-generating technique was used in http://arxiv.org/abs/hep-th/0105136 to construct the [fuzzballs](https://en.wikipedia.org/wiki/Fuzzball_(string_theory)).

   In [GenerateD1braneFromKerr](https://github.com/g3n1uss/StringTheoryTools/blob/master/Examples/GenerateD1braneFromKerr.nb) we demonstrate this solution-generating technique. We start with a rotating black hole in 4 dimensions (the [Kerr black hole](https://en.wikipedia.org/wiki/Rotating_black_hole)) and perform the following series of transformations: "add flat direction"->"boost"->"T duality"->"S duality", to obtain the black D1 brane. At the end we take the extremal static (no rotation) limit to check that the result is the well-known supersymmetric D1 brane.

2. Package [DiffGeometry](https://github.com/g3n1uss/StringTheoryTools/blob/master/Packages/DiffGeometry.m) implements computation of connections (Christoffel symbols), Riemann and Ricci tensors, Ricci scalar and spin connections.

   One simple example of using the package is [AdS2xS2.EinsteinEqs](https://github.com/g3n1uss/StringTheoryTools/blob/master/Examples/AdS2xS2.EinsteinEqs.nb), in which the Einstein equations are checked for AdS2, S2 and AdS2xS2 geometries.

   Another example, [KillingSpinors.IIB.NearHorizonNS5](https://github.com/g3n1uss/StringTheoryTools/blob/master/Examples/KillingSpinors.IIB.NearHorizonNS5.nb), in which we solve SUSY (Killing spinor) equations of type IIB supergravity in the NS-NS sector for one particular background - the near horizon NS5 brane.

3. Package [GroupTheory](https://github.com/g3n1uss/StringTheoryTools/blob/master/Packages/GroupTheory.m) contains some group-theoretical functionality, such as computing of adjoint represenation of Lie algebra, perfoming the Cartan-Weyl decomposition, tools needed to work with superalgebras, etc.

   [adjoint.su(2)](https://github.com/g3n1uss/StringTheoryTools/blob/master/Examples/adjoint.of.su(2).nb): we start with su(2) Lie algebra in the fundamenatal represenation and compute the corresponding adjoint represenation.

   [GradedYangBaxter.psu(1,1).Holom](https://github.com/g3n1uss/StringTheoryTools/blob/master/Examples/GradedYangBaxter.psu(1%2C1).Holom.nb) demonstrates an example of dealing with psu(1,1|2) Lie superalgebra. We solve the modified graded Yang-Baxter equation for this superalgebra.


## TODO: 

1. Add more detailed description in README file.
2. Add Sen-Hassan-Cvetic method using large matrices to perform a series of dualities in one rotation [arxiv:hep-th/9512127](http://arxiv.org/abs/hep-th/9512127)
3. Add more functions into **GroupTheory**
