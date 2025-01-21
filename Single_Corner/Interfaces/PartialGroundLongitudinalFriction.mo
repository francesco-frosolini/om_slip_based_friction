within ABS.Single_Corner.Interfaces;

partial model PartialGroundLongitudinalFriction "Base model for a longitudinal friction force using a contact point and a vertical flange connector"
  ContactPoint_b contactPoint_b annotation(
    Placement(transformation(origin = {-8, 94}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {0, 80}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b annotation(
    Placement(transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}})));
  SI.Force fx = contactPoint_b.f "longitudinal friction (reaction) force";
  SI.Force fz = flange_b.f "load force";
  Real ux "friction force coefficient";
  Real slip = contactPoint_b.slip;
equation
  flange_b.s = 0;
  fx = -ux*fz;
  annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Icon(graphics = {Line(origin = {0, 100}, points = {{-100, -80}, {-100, -120}}, color = {0, 127, 0}, thickness = 1, arrow = {Arrow.Filled, Arrow.None}, arrowSize = 6), Line(points = {{0, 60}, {0, -60}}, arrow = {Arrow.Filled, Arrow.None}), Line(points = {{60, 0}, {-60, 0}}, arrow = {Arrow.Filled, Arrow.None}), Text(origin = {-10, 55}, extent = {{-10, 5}, {10, -5}}, textString = "ux"), Text(origin = {50, -10}, extent = {{-10, 10}, {10, -10}}, textString = "slip"), Line(origin = {-84, -40}, points = {{-10, 0}, {20, 0}}, color = {0, 127, 0}), Line(origin = {-69, -45}, points = {{5, 5}, {-5, -5}, {-5, -5}}, color = {0, 127, 0}), Line(origin = {-99, -45}, points = {{5, 5}, {-5, -5}, {-5, -5}}, color = {0, 127, 0}), Line(origin = {-89, -45}, points = {{5, 5}, {-5, -5}, {-5, -5}}, color = {0, 127, 0}), Line(origin = {-79, -45}, points = {{5, 5}, {-5, -5}, {-5, -5}}, color = {0, 127, 0}), Line(origin = {-80, -25}, points = {{0, 15}, {0, -15}}, color = {0, 127, 0}), Line(origin = {20, 80}, points = {{-20, 0}, {30, 0}}, color = {95, 127, 95}, thickness = 1, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 10)}),
    Documentation(info = "<html><head></head><body><span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">Base model for a friction force component using one flange for vertical load and a contact point connector for longitudinal friction force. The sign conventions utilized are denoted in the icon layer for clarity.</span><div><font face=\"DejaVu Sans Mono\"><br></font><div><font face=\"DejaVu Sans Mono\">It's assumed that the rolling body and the ground stay in contact (flange_b.s=0) and that the relationship between longitudinal friction and vertical load stays linear (fx=-ux*fz).</font></div><div><font face=\"DejaVu Sans Mono\"><br></font><div><span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">Child models must define the behaviour of the friction coefficient ux and slip through a single equation, i.e. slip=0 (ux=any) for an ideal \"pure rolling without slipping\" friction model</span></div></div></div></body></html>"));
end PartialGroundLongitudinalFriction;