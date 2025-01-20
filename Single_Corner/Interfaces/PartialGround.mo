within ABS.Single_Corner.Interfaces;

partial model PartialGround "Base model for a longitudinal friction force using a contact point and a vertical flange connector"

  ContactPoint_b contactPoint_b annotation(
    Placement(transformation(origin = {-8, 94}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {0, 80}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b annotation(
    Placement(transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}})));
    
  SI.Force fx = contactPoint_b.f "longitudinal friction (reaction) force";
  SI.Force fz = flange_b.f "load force";
  Real ux "friction force coefficient";
  Real slip = contactPoint_b.slip;
equation
  flange_b.s=0 "solid ground, the rolling body stays attached";
  fx=-ux*fz;

annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Icon(graphics = {Line(origin = {0, -10}, points = {{-78, 80}, {51, 80}}, color = {95, 127, 95}), Polygon(origin = {0, -10}, lineColor = {95, 127, 95}, fillColor = {95, 127, 95}, fillPattern = FillPattern.Solid, points = {{81, 80}, {51, 90}, {51, 70}, {81, 80}}), Line(origin = {0, 100}, points = {{-20, 0}, {20, 0}}, thickness = 1, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 6), Line(origin = {0, 100}, points = {{-100, -120}, {-100, -80}}, thickness = 1, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 6)}),
    Documentation(info = "<html><head></head><body><span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">Basic model for a friction force&nbsp;</span></body></html>"));
end PartialGround;