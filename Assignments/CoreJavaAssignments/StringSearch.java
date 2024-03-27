package CoreJavaAssignments;

public class StringSearch extends AbstractSearch {
	@Override
    public boolean search(Object[] obj_list, Object obj) {
        if (!(obj instanceof String)) {
            return false;
        }
 
        String target = (String) obj;
 
        for (Object item : obj_list) {
            if (item instanceof String) {
                String value = (String) item;
                if (value.equals(target)) {
                    return true;
                }
            }
        }
 
        return false;
    }

}
