within ABS.Single_Corner.Examples;

model ConstantSpeed
  extends Modelica.Icons.Example;
  Modelica.Mechanics.Translational.Components.Mass mass(m = wheel.m, s(fixed = true, start = 0), v(start = 0, fixed = true)) annotation(
    Placement(transformation(origin = {48, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J = 1.25, phi(start = 0, fixed = true), w(start = 0, fixed = true)) annotation(
    Placement(transformation(origin = {-42, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Translational.Sources.QuadraticSpeedDependentForce AeroDrag(f_nominal = -60, v_nominal = 30)  annotation(
    Placement(transformation(origin = {90, 0}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp(height = -55/wheel.R, startTime = 2, duration = 15, offset = 60/wheel.R)  annotation(
    Placement(transformation(origin = {-120, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque annotation(
    Placement(transformation(origin = {-78, 0}, extent = {{-10, -10}, {10, 10}})));
  Wheel wheel(R=0.3,m= 250) annotation(
    Placement(transformation(extent = {{-20, -20}, {20, 20}})));
  BurckhardtFriction burckhardtFriction annotation(
    Placement(transformation(origin = {0, -60}, extent = {{-20, -20}, {20, 20}})));
equation
  connect(mass.flange_b, AeroDrag.flange) annotation(
    Line(points = {{58, 0}, {80, 0}}, color = {0, 127, 0}));
  connect(torque.flange, inertia.flange_a) annotation(
    Line(points = {{-68, 0}, {-52, 0}}));
  connect(torque.tau, ramp.y) annotation(
    Line(points = {{-90, 0}, {-109, 0}}, color = {0, 0, 127}));
  connect(wheel.flangeT, mass.flange_a) annotation(
    Line(points = {{20, 0}, {38, 0}}, color = {0, 127, 0}));
  connect(wheel.flangeR, inertia.flange_b) annotation(
    Line(points = {{-20, 0}, {-32, 0}}));
  connect(wheel.contactPoint_a, burckhardtFriction.contactPoint_b) annotation(
    Line(points = {{0, -16}, {0, -44}}));
  annotation(
    experiment(StartTime = 0, StopTime = 300, Tolerance = 1e-9),
    Diagram);
end ConstantSpeed;