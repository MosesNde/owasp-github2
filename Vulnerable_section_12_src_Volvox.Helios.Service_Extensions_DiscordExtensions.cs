         {
             return guilds.Where(g => ids.Any(i => i == g.Id)).ToList();
         }
     }
 }