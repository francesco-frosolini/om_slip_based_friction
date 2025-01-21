within ABS.Single_Corner;

model DryFriction
  extends Interfaces.PartialGroundLongitudinalFriction;
  parameter Real u_s(min=0, max=1) = 0.85 "static friction coefficient";
  parameter Real u_d(min=0, max=1) = 0.65 "dynamic friction coefficient";
  final constant Real eps=1e10*Modelica.Constants.eps;
equation
  
  ux = if abs(slip)<eps then slip*u_s/eps else sign(slip)*(u_d);

  //slip=0 while ux<=u_s;
  
  
  annotation(
    Icon(graphics = {Line(points = {{0, 40}, {0, -40}}, thickness = 1), Line(origin = {30, 30}, points = {{-30, 0}, {20, 0}}, thickness = 1), Line(origin = {-30, -30}, points = {{30, 0}, {-20, 0}}, thickness = 1)}),
  Diagram,
  Documentation(info = "<html><head></head><body><span style=\"font-size: 12px; font-family: 'DejaVu Sans Mono';\">Friction force component using one flange for vertical load and a contact point connector for longitudinal friction force. The sign conventions utilized are denoted in the icon layer.</span><div><font face=\"DejaVu Sans Mono\"><br></font><div><div><font face=\"DejaVu Sans Mono\">It's assumed that the rolling body and the ground stay in contact (flange_b.s=0) and that the relationship between longitudinal friction and vertical load stays linear (fx=-ux*fz).</font></div></div><div><font face=\"DejaVu Sans Mono\"><br></font></div><div><div><span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">The two parameters u_s and u_d are respectively the static and dynamic friction coefficients. u_d must be smaller than u_s to have physical meaning. Slipping occurs when u&gt;u_s.<br></span></div></div></div></body></html>"));
  
end DryFriction;