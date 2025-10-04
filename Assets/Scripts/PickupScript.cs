using UnityEngine;

public class PickupScript : MonoBehaviour
{
    void OnTriggerEnter(Collider other){
    //This message will appear in the console in the bottom of the Unity editor!
    Debug.Log("Something entered!" + other.ToString() + " at time: " + Time.time.ToString());

    //Single out only collisions with the player..
    if (other.gameObject.tag == "Player"){
        // .. so we know we are dealing with a trigger from the Player sphere!
        // Task: Move the Pickup to a random location inside the play area.

        //(1) create a new Vector3 with a new random location (preferebly reachable!)
        Vector3 newPosition = new Vector3(Random.Range(-4f, 4f), 0.5f, Random.Range(-4f, 4f));
        //(2) set the position of the pickup (this actual object) transform to
            // your newly created vector. Unleash your inner google skills!
            transform.position = newPosition;

    }
  }
}
