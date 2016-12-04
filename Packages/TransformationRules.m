(* ::Package:: *)

BeginPackage["TransformationRules`"]

Boost::usage = "Boost[matrix, time, boost, parameter] takes 'matrix' and boost it along 'boost' and 'time' with a boost parameter 'parameter' ";
Rotation::usage = "Rotation[matrix, a, b, parameter] takes 'matrix' and rotate it between 'a' and 'b' with a rotation parameter 'parameter'";
TdualGdown::usage = "TdualGdown[gdown, Bfield, y] performs T duality along 'y' and returns the T dual metric";
TdualB::usage = "TdualB[gdown, Bfield, y] performs T duality along 'y' and returns the T dual B field";
TdualDil::usage = "TdualDil[gdown, dilaton, y] performs T duality along 'y' and returns the T dual dilaton";


Begin["`Private`"]

(* Function performing a boost of the matrix 'Matr' along 'b' with a boost parameter 'param', time direction is 't'  *)

Boost[Matr_, t_, b_, param_] := 
  Module[{dim = Length[Matr], RotMatr, MatrBoosted}, 
   MatrBoosted = Matr; RotMatr = IdentityMatrix[dim]; 
   RotMatr[[t, t]] = Cosh[param]; RotMatr[[b, b]] = Cosh[param]; 
   RotMatr[[t, b]] = Sinh[param]; RotMatr[[b, t]] = Sinh[param]; 
   MatrBoosted = FullSimplify[RotMatr.Matr.RotMatr]; MatrBoosted];
(* Function performing a rotation of the matrix 'Matr' between 'a' and 'b' with a rotation parameter 'param' *)

Rotation[Matr_, a_, b_, param_] := 
  Module[{dim = Length[Matr], RotMatr, MatrBoosted}, 
   MatrBoosted = Matr; RotMatr = IdentityMatrix[dim]; 
   RotMatr[[a, a]] = Cos[param]; RotMatr[[b, b]] = Cos[param]; 
   RotMatr[[a, b]] = Sin[param]; RotMatr[[b, a]] = -Sin[param]; 
   MatrBoosted = FullSimplify[RotMatr.Matr.Transpose[RotMatr]]; 
   MatrBoosted];

(* A set of functions performing T duality along 'Td' *)

(* Busher rules for NS-NS fields from (140) in  arXiv:hep-th/0007170 *)
(* T duality of the metric *)

TdualGdown[gdown_, Bfield_, Td_] := 
  Module[{dim = Length[gdown], gdownT}, 
   gdownT = ConstantArray[0, {dim, dim}];
   gdownT[[Td, Td]] = 1/gdown[[Td, Td]];
   Do[If[ii != Td, gdownT[[Td, ii]] = Bfield[[ii, Td]]/gdown[[Td, Td]];
     gdownT[[ii, Td]] = Bfield[[ii, Td]]/gdown[[Td, Td]]], {ii, 1, 
     dim}];
   Do[If[ii != Td && jj != Td, 
     gdownT[[ii, jj]] = 
      gdown[[ii, 
        jj]] - (gdown[[ii, Td]] gdown[[jj, Td]] - 
          Bfield[[ii, Td]] Bfield[[jj, Td]])/gdown[[Td, Td]]], {ii, 1,
      dim}, {jj, 1, dim}]; FullSimplify[gdownT]];
(* T duality of the B field *)

TdualB[gdown_, Bfield_, Td_] := 
  Module[{dim = Length[gdown], BfieldT}, 
   BfieldT = ConstantArray[0, {dim, dim}];
   Do[If[ii != Td, BfieldT[[ii, Td]] = gdown[[ii, Td]]/gdown[[Td, Td]];
     BfieldT[[Td, ii]] = -gdown[[ii, Td]]/gdown[[Td, Td]]], {ii, 1, 
     dim}];
   Do[If[ii != Td && jj != Td, 
     BfieldT[[ii, jj]] = 
      Bfield[[ii, 
        jj]] + (-1) (Bfield[[ii, Td]] gdown[[jj, Td]] - 
           gdown[[ii, Td]] Bfield[[jj, Td]])/gdown[[Td, Td]]], {ii, 1,
      dim}, {jj, 1, dim}]; FullSimplify[BfieldT]];


(* T duality of the dilaton *)
(* Dil= Exp[2 Phi] *)

TdualDil[gdown_, Dil_, Td_] := 
  Module[{dim = Length[gdown], DilT = 0}, DilT = Dil/gdown[[Td, Td]]; 
   FullSimplify[DilT]];

End[]

EndPackage[]
