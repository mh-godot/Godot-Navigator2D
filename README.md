# Godot-Navigator2D

Current Godot version: Godot 3.1 beta 1

The purpose of this addon is to create a node which automatically navigates to a given position within a Navigation2D node.

See: 

To use it, do the following:
1) Clone this repository into your project under an addons folder in your resources
2) Go to Project Settings -> Plugins (at the top) -> Find Navigator2D and switch it to active
3) In your scene where you have a Navigation2D node, add a Navigator2D node as a child of the node you want to move in the Navigation2D.
4) On the Navigator2D node, set the NodePath to be equal to your Navigation2D node.
5) Go into the script attached to the Navigator2D node and ensure the values that are exported are set to the values you want; things like Speed, whether or not it looks at its target (i.e. rotates to face the target), or whether or not it optimizes the path it creates are variables; feel free to update them to whatever you want. (I'm not sure why these aren't exporting correctly; I will update the plugin when I figure it out, or feel free to create a PR and I'll accept it.)
6) When you want to navigate to a particular position, call $Navigator2D.navigate_to(position). The position should be any node that's somewhere in your Navigation2D polygon. Make sure you're attached to the "on_destination_reached" signal; the signal relays to your function the node which was navigating (so the parent of the Navigator2D), as well as the node that was being navigated to. This is useful in case you have scripts on either or both of those nodes and when you've reached your destination, you have to do something specific.
7) Pay close attention to the NavigationStopEpsilon; this value will determine at what distance from your destination node it's acceptable to stop moving.
8) This does not take into account physics, nor any sort of artificial intelligence, of any kind; it only navigates.
