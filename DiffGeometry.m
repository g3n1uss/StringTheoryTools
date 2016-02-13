(* ::Package:: *)

BeginPackage["DiffGeometry`"]

CrisSymb::usage = "Conns[gdown] returns Christoffel symbols with first upper index, gdown - covariant metric tensor";
Riemann::usage = "Riemann[connect] returns Riemann tensor with first upper index, connect - Christoffel symbols with first upper index";
Ricci::usage = "Ricci[Riemann] returns scalar curvature and Ricci tensor, Riemann - Riemann tensor with first upper index";
SpinConn::usage = "SpinConn[Frames, timeposition, assumptions] retunrs spin connections, Frames - frames with first upper Lorentz index and second lower and spacetime index; timeposition - position of the time direction; assumptions - assumptions for simplifications "
x::usage = "Coordinates should be defined globally, see examples "
Begin["`Private`"]

(* =========================================== *)

(* calculate Christoffel symbols, first index is upper, last two are lower *)

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

(* =========================================== *)

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

(* =========================================== *)

(* Ricci tensor *)

Ricci[Riemann_, gup_] := 
  Module[{kk, ii, jj, dimension = Length[Riemann], Ric, Curv},
   Ric = ConstantArray[0, {dimension, dimension}];
   (*Calculating Ricci tensor*)
   Do[Ric[[ii, jj]] = 
     Simplify[
      Sum[Riemann[[kk, ii, kk, jj]], {kk, 1, dimension}]], {ii, 1, 
     dimension}, {jj, 1, dimension}];

(* calculating curvature, Ricci scalar *)
    Curv = Simplify[
     Sum[Ric[[ii, jj]]*gup[[ii, jj]], {ii, 1, dimension}, {jj, 1, 
       dimension}]]; {Curv, Ric}];

(* =========================================== *)

(* calculate spin connections *)
(*input:frames with first upper Lorentz index and second lower and spacetime index; tpos - position of the time direction; assumps - some assumptions for simplifications *)

SpinConn[Frames_, tpos_, assumps_] := 
  Module[{dim = Length[Frames], Omega, gup, gdown, eta, mu, nu, mm, 
    nn, aa, bb, rho, sig, ee}, eta = IdentityMatrix[dim];
   gdown = ConstantArray[0, {dim, dim}];
   Omega = ConstantArray[0, {dim, dim, dim}]; eta[[tpos, tpos]] = -1;
   Do[gdown[[mu, nu]] = 
     Simplify[
      Sum[Frames[[mm, mu]] eta[[mm, nn]] Frames[[nn, nu]], {mm, 1, 
        dim}, {nn, 1, dim}], assumps], {mu, 1, dim}, {nu, 1, dim}];
   gup = Simplify[Inverse[gdown], assumps];
   Print["gup is done"];
   Do[Omega[[mu, aa, bb]] = 
     Sum[(Frames.gup)[[aa, 
         nu]] (D[Frames[[bb, nu]], x[mu]] - 
          D[Frames[[bb, mu]], x[nu]]), {nu, 1, dim}] - 
      Sum[(Frames.gup)[[bb, 
         nu]] (D[Frames[[aa, nu]], x[mu]] - 
          D[Frames[[aa, mu]], x[nu]]), {nu, 1, dim}] - 
      Sum[(Frames.gup)[[aa, rho]] (Frames.gup)[[bb, 
         sig]] (D[Frames[[ee, sig]], x[rho]] - 
          D[Frames[[ee, rho]], x[sig]]) (eta.Frames)[[ee, mu]], {rho, 
        1, dim}, {sig, 1, dim}, {ee, 1, dim}], {mu, 1, dim}, {aa, 1, 
     dim}, {bb, 1, dim}]; {gdown, gup, 1/2 Omega}];

(* =========================================== *)


End[]

EndPackage[]



