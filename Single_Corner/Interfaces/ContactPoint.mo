within ABS.Single_Corner.Interfaces;

connector ContactPoint "One dimensional contact point between two rolling surfaces"
  flow SI.Force f "Contact force coefficient";
  Real slip(min=-1,max=1) "Normalized slipping speed (=body speed - ground speed) of the contact point, positive when accelerating, negative when braking.";annotation(
    Documentation(info = "<html><head></head><body><p style=\"font-family: 'DejaVu Sans Mono';\"><span style=\"font-size: 12px;\">This is a connector for a 1D contact </span>point. It has no icon definition and is only used by inheritance from flange connectors to define different icons.</p><p style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">The following variables are defined in this connector:</p><blockquote style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\"><p>slip: <b>Normalized</b> slipping velocity of the contact point [adim].</p><p>f: Friction force with the same positive axis as the slipping velocity [adim].</p></blockquote></body></html>"));
end ContactPoint;