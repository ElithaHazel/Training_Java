package CoreJavaAssignments;

public class IntegerSearch extends AbstractSearch{
	@Override
    public boolean search(Object[] obj_list, Object obj) {
        if (!(obj instanceof Integer)) {
            return false;
        }
 
        Integer target = (Integer) obj;
 
        for (Object item : obj_list) {
            if (item instanceof Integer) {
                Integer value = (Integer) item;
                if (value.equals(target)) {
                    return true;
                }
            }
        }
 
        return false;
    }
}
