public class Area {
	
    Double doubleArea = 0;
    Double doubleHeight = 0;
    Double doubleWidth = 0;
    
    public Area() {
        doubleHeight = 4;
		doubleWidth = 5;
    }
    
    public void calculateArea() {
        doubleArea = doubleHeight * doubleWidth;
        System.debug('Area = ');
        System.debug(doubleArea);
    }
}