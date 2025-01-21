within ABS.Single_Corner;

model Wheel extends Modelica.Mechanics.Rotational.Interfaces.PartialElementaryRotationalToTranslational;
  parameter Boolean useDynLoad = false "Enables dynLoad input connector";
  Interfaces.ContactPoint_a contactPoint_a annotation(
    Placement(transformation(origin = {4, -88}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {0, -80}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealInput dynLoad if useDynLoad annotation(
    Placement(transformation(origin = {8, 58}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant constLoad(k=m*g) if not useDynLoad;
  parameter SI.Length R=1 "Wheel radius in meters";
  parameter SI.Mass m=100 "Used just to compute vertical load, fz=m*g if useDynLoad=False. A mass (and inertia) must also be attached to the flange.";
  final constant SI.Acceleration g=Modelica.Constants.g_n;
  final constant Real eps=1e8*Modelica.Constants.eps;
  
  SI.Velocity vT;
  SI.Velocity vP;
  SI.AngularVelocity wR;
  SI.Velocity den;
  SI.Force fx=contactPoint_a.f;
  Modelica.Mechanics.Translational.Interfaces.Flange_a flangeL annotation(
    Placement(transformation(origin = {-68, -70}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-80, -60}, extent = {{-10, -10}, {10, 10}})));
  protected Modelica.Blocks.Interfaces.RealInput internalDynLoad;

equation

  wR = der(flangeR.phi - internalSupportR.phi);
  vT = der(flangeT.s - internalSupportT.s); 
  vT + vP - wR*R = 0; //sign convention: wR positive if rolling in the positive direction (rotating clockwise), like in the std library
//--> slip is positive if accelerating (second case, vP=wR*radius-vT > 0)

  //den for slip normalization
  den = max(abs(vT),abs(wR*R));

  contactPoint_a.slip = smooth(0,if noEvent(den>eps) then vP/den else vP/eps);
  
  //force and torque balance
  connect(internalDynLoad, dynLoad);
  connect(internalDynLoad, constLoad.y);
  flangeL.f = internalDynLoad;
  fx + flangeT.f = 0;
  flangeR.tau - fx*R = 0;
  

annotation(
    Icon(graphics = {Ellipse(fillColor = {192, 191, 188}, fillPattern = FillPattern.Sphere, extent = {{-80, 80}, {80, -80}}), Ellipse(fillColor = {154, 153, 150}, fillPattern = FillPattern.Solid, extent = {{-60, 60}, {60, -60}}), Line(origin = {0, 40}, points = {{-100, -120}, {-100, -80}}, thickness = 1, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 6), Line(origin = {-20, -80}, points = {{20, 0}, {-40, 0}}, color = {95, 127, 95}, thickness = 1, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 10)}),
  Documentation(info = "<html><head></head><body>Wheel component with connectors for the rotational and translational flanges to drive the wheel, a vertical<div><p style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">This is a 1-dim. rotational component with</p><ul style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\"><li>connectors for the flanges used to transform rotational into translational motion</li><li>optional supports/housings for those connectors</li><li>a ContactPoint connector for longitudinal slip</li><li>a Flange connector for the vertical load</li><li>an optional RealInput for dynamical vertical load</li></ul><p style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">The vertical load is computed as m*g if useDynLoad is false, otherwise fz=m*g+dynLoad.</p><p style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">The slip is equal to (slipping speed) vP = wR*R-vT (wheel speed - body speed) normalized by the biggest between wR*R and vT, so it is always true that -1&lt;=slip&lt;=1.</p><p style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">The slip is positive when fx is positive, i.e. when the vehicle is accelerating, and viceversa.</p></div></body></html>"));
end Wheel;