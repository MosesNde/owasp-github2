                 iceCracksRenderers[0].material
             );
 
             foreach (Rigidbody rb in myRBs) {
                 temporaryPositions.Add(PositionFix.RealToOffset(rb.transform.position));
                 temporaryRotations.Add(rb.transform.rotation);