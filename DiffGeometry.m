(* ::Package:: *)

BeginPackage["DiffGeometry`"]

CrisSymb::usage = "Conns[gdown] returns Christoffel symbols with first upper index, gdown - covariant metric tensor";
Riemann::usage = "Riemann[connect] returns Riemann tensor with first upper index, connect - Christoffel symbols with first upper index";
Ricci::usage = "Ricci[Riemann] returns scalar curvature and Ricci tensor, Riemann - Riemann tensor with first upper index";
x::usage = "Coordinates should be defined globally "
Begin["`Private`"]

CrisSymb[gdown_]:=Module[{ii, jj, kk, ll, dimension = Length[gdown], gder, crisdown, 
    connect, gup = FullSimplify[Inverse[gdown]]},
   gder = ConstantArray[0, {dimension, dimension, dimension}]; 
   crisdown = ConstantArray[0, {dimension, dimension, dimension}];
   connect = ConstantArray[0, {dimension, dimension, dimension}];
   (* derivatives of gdown*)
   
   Do[gder[[jj, kk, ii]] = D[gdown[[jj, kk]], x[ii]], {ii, 1, 
     dimension}, {jj, 1, dimension}, {kk, 1, dimension}];
   (* connections with lower indices *)
   
   Do[crisdown[[ii, jj, kk]] = 
     Simplify[
      gder[[ii, jj, kk]] + gder[[kk, ii, jj]] - 
       gder[[jj, kk, ii]]], {ii, 1, dimension}, {jj, 1, 
     dimension}, {kk, 1, dimension}];
   (* connections with first upper index *)
   
   connect = 1/2 Simplify[gup.crisdown]; connect];

(* Riemann tensor, first index is upper *)

Riemann[connect_] := 
  Module[{ga, al, be, rho, dimension = Length[connect], Riem}, 
   Riem = ConstantArray[
     0, {dimension, dimension, dimension, dimension}];
   Do[Riem[[ga, al, be, rho]] = 
     D[connect[[ga, al, rho]], x[be]] - 
      D[connect[[ga, al, be]], x[rho]] + 
      Sum[connect[[eps, al, rho]] connect[[ga, be, eps]], {eps, 1, 
        dimension}] - 
      Sum[connect[[eps, al, be]] connect[[ga, rho, eps]], {eps, 1, 
        dimension}], {ga, 1, dimension}, {al, 1, dimension}, {be, 1, 
     dimension}, {rho, 1, dimension}]; Simplify[Riem]];

Ricci[Riemann_, gup_] := 
  Module[{kk, ii, jj, dimension = Length[Riemann], Ric, Curv},
   Ric = ConstantArray[0, {dimension, dimension}];
   (*Calculating Ricci tensor*)
   Do[Ric[[ii, jj]] = 
     Simplify[
      Sum[Riemann[[kk, ii, kk, jj]], {kk, 1, dimension}]], {ii, 1, 
     dimension}, {jj, 1, dimension}];
   (* calculating curvature *)
   
   Curv = Simplify[
     Sum[Ric[[ii, jj]]*gup[[ii, jj]], {ii, 1, dimension}, {jj, 1, 
       dimension}]]; {Curv, Ric}];

End[]

EndPackage[]



