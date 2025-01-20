within ABS.Single_Corner.Interfaces;

partial model PartialSlipFriction "Base model for a friction force using a contact point connector"

  ContactPoint_b contactPoint_b annotation(
    Placement(transformation(origin = {-8, 94}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {0, 80}, extent = {{-20, -20}, {20, 20}})));

  Real ux = contactPoint_b.ux "friction coefficient for the reaction force";
  Real slip = contactPoint_b.slip;
  
equation
  

annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Icon(graphics = {Line(origin = {0, -10}, points = {{-78, 80}, {51, 80}}, color = {95, 127, 95}), Polygon(origin = {0, -10}, lineColor = {95, 127, 95}, fillColor = {95, 127, 95}, fillPattern = FillPattern.Solid, points = {{81, 80}, {51, 90}, {51, 70}, {81, 80}})}),
    Documentation(info = "<html><head></head><body><span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">Basic model for a friction force&nbsp;</span></body></html>"));
end PartialSlipFriction;