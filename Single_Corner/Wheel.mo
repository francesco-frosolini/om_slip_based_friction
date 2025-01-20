within ABS.Single_Corner;

model Wheel "mass-less slipping wheel" extends Modelica.Mechanics.Rotational.Interfaces.PartialElementaryRotationalToTranslational;
  parameter Boolean useDynLoad = false "Enables dynLoad input connector";
  Interfaces.ContactPoint_a contactPoint_a annotation(
    Placement(transformation(origin = {4, -88}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {0, -80}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealInput dynLoad if useDynLoad annotation(
    Placement(transformation(origin = {8, 58}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant noLoad(k=0) if not useDynLoad;
  parameter SI.Length R=1 "Wheel radius in meters";
  parameter SI.Mass m=100 "Used just to compute vertical load, fz=m*g+dynLoad. Inertia and mass must also be attached to the flanges.";
  final constant SI.Acceleration g=Modelica.Constants.g_n;
  final constant Real eps=1e8*Modelica.Constants.eps;
  protected Modelica.Blocks.Interfaces.RealInput internalDynLoad;
  
  SI.Velocity vT;
  SI.Velocity vP;
  SI.Velocity den;
  SI.AngularVelocity wR;
  Real slip=contactPoint_a.slip;
  Real ux=contactPoint_a.ux;
  SI.Force fz(min=0);
  SI.Force fx;
equation

  wR = der(flangeR.phi - internalSupportR.phi);
  vT = der(flangeT.s - internalSupportT.s);
  vT + vP - wR*R = 0; //sign convention: wR positive if rolling to the right, like in the std library

  //den for slip normalization
  den = max(abs(vT),abs(wR*R)); //smooth(0, if noEvent(abs(vT)>abs(wR*R)) then abs(vT) else abs(wR*R));

  //slip is positive if accelerating (second case, vP=wR*radius-vT > 0)
  slip = smooth(0,if noEvent(den>eps) then vP/den else vP/eps);
  
  //force and torque balance
  connect(internalDynLoad, dynLoad);
  connect(internalDynLoad, noLoad.y);
  fz = if useDynLoad then m*g+internalDynLoad else m*g;
  fx=-contactPoint_a.ux*fz;
  fx + flangeT.f = 0;
  flangeR.tau - fx*R = 0;
//  w=der(flangeR.phi);
//  v=der(flangeT.s);
//  flangeR.tau-fx*R=0;
//  flangeT.f+fx=0;
//  fx=-ux*fz;
//  fz = if useDynLoad then -m*g+dynLoad else -m*g;
//  //slip = if v<w*R and v>eps then (w*R-v)/(w*R) else if w*R<v and w*R<eps then (w*R-v)/v else 0;
//  slip = (w*R - v) / noEvent(max({abs(v), abs(w*R), eps}));
//  //when still --> ill conditioned
//  //if accelerating and not still then v-wR/v else if braking and not still v-wR/wR else (still)=0
  
  

annotation(
    Icon(graphics = {Ellipse(fillColor = {192, 191, 188}, fillPattern = FillPattern.Sphere, extent = {{-80, 80}, {80, -80}}), Ellipse(fillColor = {154, 153, 150},fillPattern = FillPattern.Solid, extent = {{-60, 60}, {60, -60}})}));
end Wheel;
