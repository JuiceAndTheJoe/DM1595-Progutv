// Import some external libraries
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;

// Declare a new class, which inherits functionality from the parent class MonoBehaviour
public class SphereControlScript : MonoBehaviour
{
    // Object variables are declared here!
    // if this was Python, it would look something like
    // def __init__(self):
    // self.forceFactor = 1.0

    public float forceFactor = 1.0f;

    // Add a new private integer member variable to count pickups
    private int pickupCounter;

    public int getPickupCounter(){
    return pickupCounter;
}

    void OnTriggerEnter(Collider other){
    // Tasks: 
    // Check so that the collision happened with a pickup (tagged 'Pickups') 
    // (and not for example the walls).
    // If you collided with a pickup, increase your score variable, and then print 
    // it to the terminal. (using the Debug.Log function)
    if (other.CompareTag("Pickups"))
    {
        pickupCounter++;
        Debug.Log("Pickup collected! Total pickups: " + getPickupCounter());
    }
    }
    // Start is called before the first frame update 
    void Start()
    {
        pickupCounter = 0;
    }

    // Update is called once per frame

    void Update()
    {
        // Because this script runs on the PlayerSphere, the following line
        // will fetch the Rigidbody component from the PlayerSphere.
        // RigidBody can of course be changed to something else, but right
        // now, we actually need it!
        Rigidbody rigidBody = GetComponent<Rigidbody>();

        // This now uses the new Input System directly reading from keyboard/gamepad
        // We use Keyboard and Gamepad classes to read input directly
        Vector2 movementInput = Vector2.zero;
        
        // Read keyboard input
        if (Keyboard.current != null)
        {
            if (Keyboard.current.wKey.isPressed || Keyboard.current.upArrowKey.isPressed)
                movementInput.y += 10f;
            if (Keyboard.current.sKey.isPressed || Keyboard.current.downArrowKey.isPressed)
                movementInput.y -= 10f;
            if (Keyboard.current.aKey.isPressed || Keyboard.current.leftArrowKey.isPressed)
                movementInput.x -= 10f;
            if (Keyboard.current.dKey.isPressed || Keyboard.current.rightArrowKey.isPressed)
                movementInput.x += 10f;
        }
        
        // Read gamepad input if available
        if (Gamepad.current != null)
        {
            Vector2 gamepadInput = Gamepad.current.leftStick.ReadValue();
            movementInput += gamepadInput;
        }
        
        float xDir = movementInput.x;
        float zDir = movementInput.y;

        // We create a new force vector from the inputs above: 
        Vector3 force = new Vector3(xDir, 0, zDir);

        // And we add a constant force to the rigidBody, which is a component
        // of the sphere, hence, pushing it around!
        rigidBody.AddForce(force, ForceMode.Force);
    }
}