     include History::Addon::Backup
 
     default_scope ->{ where(route: "member/login") }
   end
 
   class Mypage