within ABS.Single_Corner.Interfaces;

partial model PartialSlipFriction "Partial model of a force acting at the contact point (accelerates the contact point)"

  ContactPoint_b contactPoint_b annotation(
    Placement(transformation(origin = {-8, 94}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {0, 80}, extent = {{-20, -20}, {20, 20}})));

  Real ux = contactPoint_b.ux "longitudinal friction coefficient";
  Real slip = contactPoint_b.slip;
  
equation
  

annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true));
  annotation(
    Icon(graphics = {Line(origin = {0, -10},points = {{-78, 80}, {51, 80}}, color = {95, 127, 95}), Polygon(origin = {0, -10},lineColor = {95, 127, 95}, fillColor = {95, 127, 95}, fillPattern = FillPattern.Solid, points = {{81, 80}, {51, 90}, {51, 70}, {81, 80}})}));
end PartialSlipFriction;
