 
 public class GraphGenerator : MonoBehaviour {
 
     [SerializeField] Tilemap tilemap;
     [HideInInspector] public Dictionary<Vector2Int, Node> nodes = new Dictionary<Vector2Int, Node>();
 
     void OnDrawGizmos(){
        GenerateGraph();
         foreach(Node node in nodes.Values){
             Gizmos.color = Color.green;
             Gizmos.DrawSphere(node.position,  0.2f);
//          foreach(Node n in node.neighbours){
//              Gizmos.color = Color.grey;
//              Gizmos.DrawLine(node.position, n.position);
//          }
         }

        // foreach(Vector2Int c in nodes.Keys){
        // Gizmos.color = Color.red;
        // Gizmos.DrawSphere(new Vector3(c.x, c.y, 0f), 0.2f);
        // }
     }
 
    void Start(){
        GenerateGraph();
     }
 
     void GenerateGraph(){

         BoundsInt bounds = tilemap.cellBounds;
         TileBase[] tiles = tilemap.GetTilesBlock(bounds);
 
         GenerateNodes(bounds, tiles);
         FilterNodes();
         GenerateEdges(bounds);
     }
 
     void FilterNodes(){