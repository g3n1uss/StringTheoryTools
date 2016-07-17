(* ::Package:: *)

BeginPackage["GroupTheory`"]

adjoint::usage="adjoint[generators] returns the ajoint represenation of generators from scructure constants. First index numerates generators"

Begin["`Private`"]


(* adjoint of Lie algebra *)
adjoint[generators_] := 
  Module[{dim = Length[generators], eqsStrcConst, cc, strcConstsSubs, 
    adj},
   (* equations on structure constants *)
   eqsStrcConst = ConstantArray[0, {dim, dim}];
   Do[eqsStrcConst[[i, j]] = 
     generators[[i]].generators[[j]] - 
      generators[[j]].generators[[i]] - 
      Sum[cc[i, j, k] generators[[k]], {k, 1, dim}], {i, 1, dim}, {j, 
     1, dim}];
   (* solve the equations, 
   to do so reshape eqsStrcConst as a vector {eq1,eq2,
   eq3,...} suitable for Solve *)
   (* (Times@@@{Dimensions[
   eqsStrcConst]})[[1]] calculates the number of equations *)
   
   strcConstsSubs = 
    Solve[FullSimplify[
        ArrayReshape[
          ArrayFlatten[
           eqsStrcConst], {1, (Times @@@ {Dimensions[
                eqsStrcConst]})[[1]]}][[1]]] == 0, 
      ArrayReshape[
        Table[cc[i, j, k], {i, 1, dim}, {j, 1, dim}, {k, 1, dim}], {1,
          dim*dim*dim}][[1]]][[1]];
   (* we got a substitution list *)
   (* read off adjoint *)
   
   adj = ConstantArray[0, {dim, dim, dim}];
   Do[adj[[i, j, k]] = cc[i, j, k] /. strcConstsSubs, {i, 1, dim}, {j,
      1, dim}, {k, 1, dim}];
   (* normalize on unity *)
   Do[adj[[i]]=adj[[i]]/(Sqrt[Tr[adj[[i]].adj[[i]]]]),{i, 1, dim}];
 adj];
End[]

EndPackage[]



