import java.io.File;  // Import the File class
import java.io.FileNotFoundException;  // Import this class to handle errors
import java.util.Scanner; // Import the Scanner class to read text files

public class PigLatin {
    
    public void tester() {
        // String[] lines = loadStrings("words.txt");
        String[] lines = new String[8]; 
        try{
            File myFile = new File("words.txt");
            Scanner myReader = new Scanner(myFile);
            int counter = 0;
            while (myReader.hasNextLine()) {
                String data = myReader.nextLine();
                lines[counter] = data;
                counter++;
            }
            myReader.close();
        }
        catch (FileNotFoundException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
	    System.out.println("there are " + lines.length + " lines");
	    for (int i = 0 ; i < lines.length; i++) {
	        System.out.println(pigLatin(lines[i]));
	    }
    }
    public int findFirstVowel(String sWord) {
      if (sWord.length()>0)
        for (int i = 0; i< sWord.length(); i++)
          if (sWord.charAt(i) == 'a'|| sWord.charAt(i) == 'e' || sWord.charAt(i) == 'i' || sWord.charAt(i) == 'o'|| sWord.charAt(i) == 'u')
            return i;
      return -1;
    }
  

    public String pigLatin(String sWord) {
       if (sWord.substring(0,2).equals("qu")) {
          return sWord.substring(2) + "qu" + "ay";
        }
       else if (sWord.length()> 0)
         if (sWord.charAt(0) == 'a' || sWord.charAt(0) == 'e' || sWord.charAt(0) == 'i' || sWord.charAt(0) == 'o' || sWord.charAt(0) == 'u')
          return sWord + "way";
      
      for (int i = 0; i < sWord.length(); i++)
        if (findFirstVowel(sWord) == i)
          return sWord.substring(i, sWord.length()) + sWord.substring(0,i) + "ay";
      
      if (findFirstVowel(sWord)== -1){
        return sWord + "ay";
      }

        
      else {
        return "ERROR!";
      }
    }
}
