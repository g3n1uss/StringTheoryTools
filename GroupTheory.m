(* ::Package:: *)

BeginPackage["GroupTheory`"]

adjoint::usage="adjoint[generators] returns generators in the adjoint represenation computed from scructure constants. First index numerates generators";
Commutator::usage="Commutator[A,B] returns a commutator computed as AB-BA";
GetCartanSub::usage="GetCartanSub[generators] returns splits the generators into the Cartan subgroup and the offdiagonal generators";
GradeMtr::usage="GradeMtr[matrix] returns even and odd pieces of the supermatrix";
GradedCommutator::usage="GradedCommutator[A,B] computes the supercommutator";


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

   (* solve the equations *)
   (* to do so at first reshape eqsStrcConst into a suitable for Solve form - List:  
   {eq1,eq2, eq3,...} *)    
   strcConstsSubs = 
    Part[Solve[
     FullSimplify[
      ArrayReshape[
       ArrayFlatten[eqsStrcConst], {1, Apply[Times, Dimensions[eqsStrcConst]]}]] == 0, 
      Part[ArrayReshape[
       Table[cc[i, j, k], {i, 1, dim}, {j, 1, dim}, {k, 1, dim}], {1, dim*dim*dim}], 1]], 1];
   (* here Apply[Times, Dimensions[eqsStrcConst]] calculates the number of equations *)

   (* now we have sctructure constants in form of substitution list *)
   (* read off the adjoint from the structure constants *)
   adj = ConstantArray[0, {dim, dim, dim}];
   Do[adj[[i, j, k]] = cc[i, j, k] /. strcConstsSubs, {i, 1, dim}, {j, 1, dim}, {k, 1, dim}];
   (* normalize on unity *)
   Do[adj[[i]]=adj[[i]]/(Sqrt[Tr[adj[[i]].adj[[i]]]]),{i, 1, dim}];
 adj];

(* commutator *)
Commutator[X_, Y_] := X.Y - Y.X;

(* compute Cartan subalgebra *)
GetCartanSub[generators_] := 
  Module[{CartanSubGens, RestGens, cartLen1, cartLen2, pickGen, 
    commsWithCartan},
   (* pick first element and call it an element of the Cartan subalgebra *)
     CartanSubGens = {First[generators]};
   (* the rest of generators is not in the Cartan subalgebra at this point *)
   RestGens = Rest[generators];
   (* now let's check all the commutators of each element in the rest with elements in the Cartan subalgebra at this moment, if all the commutators vanish - we found another element of the Cartan subalgebra *)
   
   cartLen1 = Length[CartanSubGens];
   cartLen2 = 0;
   (* loop until we cannot extract anything *)
   
   While[cartLen1 != cartLen2, cartLen1 = Length[CartanSubGens];
    (* pick an element from the rest *)
    
    For[jj = 1, jj <= Length[RestGens], jj++,
     pickGen = RestGens[[jj]];
     (* compute commutators with all generators from the Cartan subgalgebra *)
     
     commsWithCartan = 
      ConstantArray[0, ArrayFlatten[{Length[CartanSubGens], Dimensions[pickGen]}, 1]];
     Do[commsWithCartan[[ii]] = 
       FullSimplify[Commutator[pickGen, CartanSubGens[[ii]]]], {ii, 1, Length[CartanSubGens]}];

     (* if all the commutators vanish - we found another element of the Cartan subalgebra, so append this element to the Cartan list and remove from the rest of generators *)
     
     If[commsWithCartan == ConstantArray[0, ArrayFlatten[{Length[CartanSubGens], Dimensions[pickGen]}, 1]], AppendTo[CartanSubGens, pickGen]; 
      RestGens = Delete[RestGens, jj]; Break[]]];
    cartLen2 = Length[CartanSubGens]]; 
{CartanSubGens, RestGens}];

(* =================================== *)
(* several functions for superalgebras *)
(* =================================== *)

(* grade the supermatrix *)
GradeMtr[Mtr_] := 
  Module[{dim = Length[Mtr], AA, BB, CC, DD}, 
   If[Mod[dim, 2] == 0, AA = Mtr[[1 ;; dim/2, 1 ;; dim/2]]; 
    BB = Mtr[[1 ;; dim/2, dim/2 + 1 ;; dim]]; 
    CC = Mtr[[dim/2 + 1 ;; dim, 1 ;; dim/2]]; 
    DD = Mtr[[dim/2 + 1 ;; dim, dim/2 + 1 ;; dim]], 
    Print["Matrix cannot be graded"]]; {AA, BB, CC, DD}];

(* supercommutator *)
GradedCommutator[X_, Y_] := 
  Module[{dim = Length[X], gradedComm, AA, BB, CC, DD, EE, FF, GG, 
    HH}, If[Mod[dim, 2] == 0, {AA, BB, CC, DD} = 
     GradeMtr[X]; {EE, FF, GG, HH} = GradeMtr[Y]; 
    gradedComm = 
     ArrayFlatten[{{AA.EE + BB.GG - EE.AA + FF.CC, 
        AA.FF + BB.HH - EE.BB - FF.DD}, {CC.EE + DD.GG - GG.AA - 
         HH.CC, CC.FF + DD.HH + GG.BB - HH.DD}}]]; gradedComm];

End[]

EndPackage[]



