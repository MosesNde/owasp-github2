         /// <param name="permission"></param>
         /// <returns></returns>
         [HttpPost("/Roles/{id:int}/Permissions")]
        [PermissionWithPermissionRangeAllRequired(PermissionAction.CanCreate, PermissionTarget.Permission)]
         [ProducesResponseType(StatusCodes.Status200OK)]
         [ProducesResponseType(typeof(BlogErrorResponse), StatusCodes.Status400BadRequest)]
         [ProducesResponseType(typeof(BlogErrorResponse), StatusCodes.Status409Conflict)]