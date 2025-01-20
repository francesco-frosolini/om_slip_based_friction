within ABS.Single_Corner.Examples;

model Overbraking
  extends Modelica.Icons.Example;
  Wheel wheel(R = 0.3, m = 400) annotation(
    Placement(transformation(origin = {28, 0}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J = 12.5, phi(start = 0, fixed = true)) annotation(
    Placement(transformation(origin = {-12, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Translational.Components.Mass mass(m = wheel.m, s(fixed = true), v(fixed=true, start=30)) annotation(
    Placement(transformation(origin = {70, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp(height = -30/wheel.R, duration = 3.5, startTime = 5, offset = 30/wheel.R) annotation(
    Placement(transformation(origin = {-82, -2}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Rotational.Sources.Speed speed(f_crit = 10) annotation(
    Placement(transformation(origin = {-44, 0}, extent = {{-10, -10}, {10, 10}})));
  BurckhardtFriction burckhardtFriction annotation(
    Placement(transformation(origin = {26, -48}, extent = {{-20, -20}, {20, 20}})));
equation
  connect(wheel.flangeR, inertia.flange_b) annotation(
    Line(points = {{8, 0}, {-2, 0}}));
  connect(mass.flange_a, wheel.flangeT) annotation(
    Line(points = {{60, 0}, {48, 0}}, color = {0, 127, 0}));
  connect(inertia.flange_a, speed.flange) annotation(
    Line(points = {{-22, 0}, {-34, 0}}));
  connect(speed.w_ref, ramp.y) annotation(
    Line(points = {{-56, 0}, {-63.5, 0}, {-63.5, -2}, {-71, -2}}, color = {0, 0, 127}));
  connect(wheel.contactPoint_a, burckhardtFriction.contactPoint_b) annotation(
    Line(points = {{28, -16}, {28, -23}, {26, -23}, {26, -32}}));
  annotation(
    experiment(StopTime = 10, Tolerance = 1e-9),
    Diagram);
end Overbraking;