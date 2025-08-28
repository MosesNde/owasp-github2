 
 public class GraphGenerator : MonoBehaviour {
 
    public static GraphGenerator instance = null;

     [SerializeField] Tilemap tilemap;
     [HideInInspector] public Dictionary<Vector2Int, Node> nodes = new Dictionary<Vector2Int, Node>();
 
     void OnDrawGizmos(){
        //GenerateGraph();
         foreach(Node node in nodes.Values){
             Gizmos.color = Color.green;
             Gizmos.DrawSphere(node.position,  0.2f);
            foreach(Node n in node.neighbours){
                Gizmos.color = Color.grey;
                Gizmos.DrawLine(node.position, n.position);
            }
         }
     }
 
    void Awake(){
        if(instance == null){
            instance = this;
            GenerateGraph();
        }
     }
 
     void GenerateGraph(){
         BoundsInt bounds = tilemap.cellBounds;
         TileBase[] tiles = tilemap.GetTilesBlock(bounds);
 
         GenerateNodes(bounds, tiles);
         FilterNodes();
         GenerateEdges(bounds);
        Debug.Log("Graph generated");
     }
 
     void FilterNodes(){