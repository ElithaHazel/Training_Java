package collectionsandgenericsassignment;

public class FriendFinder {

	public static void main(String[] args) {
		//
        FriendshipCriteria<String, Integer> friend1 = new FriendshipCriteria<>("Naveen", 26);
        FriendshipCriteria<String, Integer> friend2 = new FriendshipCriteria<>("Martin", 50);

        // Compare friends based on age
        if (friend1.getAttribute().compareTo(friend2.getAttribute()) > 0) {
            System.out.println(friend1.getName() + " is older than " + friend2.getName()+".");
        } else {
            System.out.println(friend1.getName() + " is younger than " + friend2.getName()+".");
        }

        FriendshipCriteria<String, String> locationFriend1 = new FriendshipCriteria<>("Satish", "Hyderabad");
        FriendshipCriteria<String, String> locationFriend2 = new FriendshipCriteria<>("Daniel", "Sydney");

        // Compare friends based on location
        if (locationFriend1.getAttribute().compareTo(locationFriend2.getAttribute()) == 0) {
            System.out.println(locationFriend1.getName() + " and " + locationFriend2.getName() + " are in the same location.");
        } else {
            System.out.println(locationFriend1.getName() + " and " + locationFriend2.getName() + " are in different locations.");
        }
    }

}
