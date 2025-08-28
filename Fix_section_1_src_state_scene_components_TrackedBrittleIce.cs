                 iceCracksRenderers[0].material
             );
 
            temporaryPositions.Clear();
             foreach (Rigidbody rb in myRBs) {
                 temporaryPositions.Add(PositionFix.RealToOffset(rb.transform.position));
                 temporaryRotations.Add(rb.transform.rotation);