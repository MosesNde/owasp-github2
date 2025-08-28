         ManifestedShipmentLeg[] manifestedLegs
     )
     {
        var legsToBeManifested = legs.Where(l =>
                manifestedLegs.All(m => m.CarrierId != l.CarrierId)
             )
             .ToList();
         return