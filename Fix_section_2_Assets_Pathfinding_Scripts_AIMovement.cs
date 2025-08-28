 using UnityEngine;
 using TMPro;
 
     public enum MVSTATE {IDLE, WALK, JUMPHOR, JUMPUP, JUMPDOWN}
 
     [SerializeField] Pathfinder pathfinder;
    [SerializeField] float speedX, speedY;
     [SerializeField] Transform player, groundCheck;
     [SerializeField] LayerMask groundLayer;
     [SerializeField] TMP_Text stateText;
 
     private int curWayPoint = 0;
     private Vector2 target, current;
     private Vector2 velocity;
     private MVSTATE mvState = MVSTATE.IDLE;
     private AISTATE state = AISTATE.FOLLOW;
     private Rigidbody2D rb;
    private bool grounded, pathUpdated;
 
     void Start(){
        pathfinder = GetComponent<Pathfinder>();
        pathfinder.OnPathUpdate = () => curWayPoint = -1;
        pathfinder.target = player;
         rb = GetComponent<Rigidbody2D>();
     }
 
     void Update(){
        grounded = Physics2D.OverlapBox(groundCheck.position, groundCheck.localScale, 0f, groundLayer);
         velocity = rb.velocity;
         StateHandle();
         rb.velocity = velocity;
     }
 
     void StateHandle(){
         switch(state){
             case AISTATE.FOLLOW:
                FollowStateHandle();
                 break;
         }
     }
     }
 
     void JumpUpHandler(){
         Vector2 del = target - current;
 
         if(grounded){
             if(del.y > 0f){
                if(Mathf.Abs(del.x) <= 1.2f){
                     velocity.x = del.x < 0f? speedX : -speedX;
                 }else {
                     velocity.y = Mathf.Sqrt(-2.8f * del.y * Physics2D.gravity.y);
             }else{
                 velocity.x = del.x > 0f? speedX : -speedX;
             }
        }else if(Mathf.Abs(del.x)<1.5f){
            if(del.y < -0.1f) velocity.x = del.x > 0f? speedX : -speedX;
            else velocity.x = 0f;
         }
     }
 
     void JumpDownHandler(){
         Vector2 del = target - current;
 
         if(!grounded) return;
     }
 
     void JumpHorizontalHandler(){
         Vector2 del = target - current;
         if(grounded) {
             velocity.x = Mathf.Sqrt(Mathf.Abs(del.x) * Physics2D.gravity.y * -0.5f);
     }
 
     void WalkStateHandler(){
         if(!grounded) return;
 
         Vector2 del = target - current;
     }
 
     bool _NoWayCheck(){
        if(pathfinder.path is null || curWayPoint >= (pathfinder.path.Count-1)){
             mvState = MVSTATE.IDLE;
             return true;
         }
         return false;
     }
 
    void _DetermineNextState (){
        curWayPoint++;
         if(_NoWayCheck()) return;
 
        Node cur = pathfinder.path[curWayPoint];
        target = pathfinder.path[curWayPoint+1].position; current = transform.position;
        Vector2 _del = target - cur.position;
 
        if(Mathf.Abs(_del.y) < .1f){
            if(_del.x > 0f){
                mvState = (cur.type & (uint)NodeType.REDGE) > 0 ? MVSTATE.JUMPHOR : MVSTATE.WALK ;
            }else{
                mvState = (cur.type & (uint)NodeType.LEDGE) > 0 ? MVSTATE.JUMPHOR : MVSTATE.WALK ;
            }
        } else if(_del.y > 0f){
            mvState = MVSTATE.JUMPUP;
        } else {
            mvState = Mathf.Abs(_del.x) < 1.1f ? MVSTATE.WALK : MVSTATE.JUMPDOWN;
        }
    }
 
    void _AdjustToTarget (){
        // first check for overshoot state
        if((curWayPoint+2)<pathfinder.path.Count){
            Node trg = pathfinder.path[curWayPoint+1], ntrg = pathfinder.path[curWayPoint+2];
            Vector2 _dl = ntrg.position-trg.position;
            if(Mathf.Abs(_dl.y)<0.1f){
                float _min, _max;
                if(trg.position.x > ntrg.position.x){
                    _min = ntrg.position.x;
                    _max = trg.position.x;
                 }else{
                    _min = trg.position.x;
                    _max = ntrg.position.x;
                 }

                if(current.x > _min && current.x < _max)
                    _DetermineNextState();
                else if(Mathf.Abs(ntrg.position.x - current.x) < 0.6f*Mathf.Abs(trg.position.x - current.x))
                    _DetermineNextState();
             }
        }else{
            mvState = MVSTATE.WALK;
        }
    }

    void PathStateCheck(){
        if(_NoWayCheck()) {
            pathfinder.UpdatePath();
            Debug.Log(curWayPoint);
            return;
        }
        if(curWayPoint < 0) {
            _DetermineNextState();
            return;
        }

        target = pathfinder.path[curWayPoint+1].position; current = transform.position;
        Vector2 del = target-current;
 
        if(Mathf.Abs(del.y) < .1f && Mathf.Abs(del.x) < 0.1f){
            if(pathfinder.updateReady){
                pathfinder.UpdatePath();
            }
             _DetermineNextState();
        } else if ( Mathf.Abs(del.y) < 1f && Mathf.Abs(del.x) < 1f)
             _AdjustToTarget();
         else if (mvState == MVSTATE.IDLE) mvState = MVSTATE.WALK;
     }
 
 
     void OnDrawGizmos(){
         Gizmos.color = Color.red;