within ABS;

model FourCornersWithLoads
  import ABS.Single_Corner.RoadTypes;
  
  parameter SI.Mass wheelMass;
  parameter SI.Length wheelRadius;
  parameter SI.Inertia wheelInertia;
  parameter RoadTypes.RoadType road=RoadTypes.RoadType.wetAsphalt;
  
  Single_Corner.SingleCornerWithLoad rearL(wheelMass=wheelMass, wheelInertia=wheelInertia, road=road, wheelR=wheelRadius) annotation(
    Placement(transformation(origin = {-40, 10}, extent = {{-10, -10}, {10, 10}})));
  Single_Corner.SingleCornerWithLoad rearR(wheelMass=wheelMass, wheelInertia=wheelInertia, road=road, wheelR=wheelRadius) annotation(
    Placement(transformation(origin = {-40, -30}, extent = {{-10, -10}, {10, 10}})));
  Single_Corner.SingleCornerWithLoad frontL(wheelMass=wheelMass, wheelInertia=wheelInertia, road=road, wheelR=wheelRadius) annotation(
    Placement(transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}})));
  Single_Corner.SingleCornerWithLoad frontR(wheelMass=wheelMass, wheelInertia=wheelInertia, road=road, wheelR=wheelRadius) annotation(
    Placement(transformation(origin = {30, -30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput rearLoad annotation(
    Placement(transformation(origin = {-40, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {-34, 34}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput frontLoad annotation(
    Placement(transformation(origin = {30, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {46, 34}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flangeR annotation(
    Placement(transformation(origin = {-90, -10}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_b flangeT annotation(
    Placement(transformation(origin = {90, -10}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {98, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Gain gain(k = 0.5)  annotation(
    Placement(transformation(origin = {-40, 46}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
  Modelica.Blocks.Math.Gain gain1(k = 0.5) annotation(
    Placement(transformation(origin = {30, 46}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
equation
  connect(frontL.flange_T, flangeT) annotation(
    Line(points = {{40, 10}, {70, 10}, {70, -10}, {90, -10}}, color = {0, 127, 0}));
  connect(frontR.flange_T, flangeT) annotation(
    Line(points = {{40, -30}, {70, -30}, {70, -10}, {90, -10}}, color = {0, 127, 0}));
  connect(rearL.flange_T, flangeT) annotation(
    Line(points = {{-30, 10}, {4, 10}, {4, -10}, {90, -10}}, color = {0, 127, 0}));
  connect(rearR.flange_T, flangeT) annotation(
    Line(points = {{-30, -30}, {4, -30}, {4, -10}, {90, -10}}, color = {0, 127, 0}));
  connect(frontL.flange_R, flangeR) annotation(
    Line(points = {{20, 10}, {12, 10}, {12, -6}, {-58, -6}, {-58, -10}, {-90, -10}}));
  connect(rearL.flange_R, flangeR) annotation(
    Line(points = {{-50, 10}, {-58, 10}, {-58, -10}, {-90, -10}}));
  connect(rearR.flange_R, flangeR) annotation(
    Line(points = {{-50, -30}, {-58, -30}, {-58, -10}, {-90, -10}}));
  connect(frontR.flange_R, flangeR) annotation(
    Line(points = {{20, -30}, {12, -30}, {12, -6}, {-58, -6}, {-58, -10}, {-90, -10}}));
  connect(rearLoad, gain.u) annotation(
    Line(points = {{-40, 70}, {-40, 53}}, color = {0, 0, 127}));
  connect(gain.y, rearL.carLoad) annotation(
    Line(points = {{-40, 39}, {-40, 20}}, color = {0, 0, 127}));
  connect(gain.y, rearR.carLoad) annotation(
    Line(points = {{-40, 39}, {-40, 24}, {-22, 24}, {-22, -14}, {-40, -14}, {-40, -20}}, color = {0, 0, 127}));
  connect(frontLoad, gain1.u) annotation(
    Line(points = {{30, 70}, {30, 53}}, color = {0, 0, 127}));
  connect(gain1.y, frontL.carLoad) annotation(
    Line(points = {{30, 39}, {30, 20}}, color = {0, 0, 127}));
  connect(gain1.y, frontR.carLoad) annotation(
    Line(points = {{30, 39}, {30, 24}, {46, 24}, {46, -14}, {30, -14}, {30, -20}}, color = {0, 0, 127}));
  annotation(
    Icon(graphics = {Ellipse(origin = {-30, 10}, fillColor = {192, 191, 188}, fillPattern = FillPattern.Sphere, extent = {{-20, 20}, {20, -20}}), Ellipse(origin = {-30, 10}, fillColor = {154, 153, 150}, fillPattern = FillPattern.Solid, extent = {{-12, 12}, {12, -12}}), Rectangle(origin = {0, -33}, fillColor = {222, 221, 218}, fillPattern = FillPattern.Forward, extent = {{-70, 3}, {70, -3}}), Ellipse(origin = {-40, -10}, fillColor = {192, 191, 188}, fillPattern = FillPattern.Sphere, extent = {{-20, 20}, {20, -20}}), Ellipse(origin = {-40, -10}, fillColor = {154, 153, 150}, fillPattern = FillPattern.Solid, extent = {{-12, 12}, {12, -12}}), Ellipse(origin = {50, 10}, fillColor = {192, 191, 188}, fillPattern = FillPattern.Sphere, extent = {{-20, 20}, {20, -20}}), Ellipse(origin = {50, 10}, fillColor = {154, 153, 150}, fillPattern = FillPattern.Solid, extent = {{-12, 12}, {12, -12}}), Ellipse(origin = {40, -10}, fillColor = {192, 191, 188}, fillPattern = FillPattern.Sphere, extent = {{-20, 20}, {20, -20}}), Ellipse(origin = {40, -10}, fillColor = {154, 153, 150}, fillPattern = FillPattern.Solid, extent = {{-12, 12}, {12, -12}})}),
  experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002));
end FourCornersWithLoads;