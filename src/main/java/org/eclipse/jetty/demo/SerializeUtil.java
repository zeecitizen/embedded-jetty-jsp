package org.eclipse.jetty.demo;

import java.io.*;
import java.util.Arrays;
import java.util.Hashtable;
import java.util.List;

/**
 * Created by zeesh on 8/27/2016.
 */
public class SerializeUtil {

    private static final String fileName = "db.ser";

    public static void writeToFile(Hashtable table)
    {
        //serialize the table
        try (
                OutputStream file = new FileOutputStream(fileName);
                OutputStream buffer = new BufferedOutputStream(file);
                ObjectOutput output = new ObjectOutputStream(buffer);
        ){
            output.writeObject(table);
        }
        catch(IOException ex){
            System.out.println("Cannot perform output.");
            ex.printStackTrace();
        }

    }

    public static Hashtable readFromFile()
    {
        //deserialize the file
        try(
                InputStream file = new FileInputStream(fileName);
                InputStream buffer = new BufferedInputStream(file);
                ObjectInput input = new ObjectInputStream (buffer);
        ){
            //deserialize the List
            return (Hashtable)input.readObject();
        }
        catch(ClassNotFoundException ex){
            System.out.println("Cannot perform input. Class not found.");
            ex.printStackTrace();
            return null;
        }
        catch(IOException ex){
            System.out.println("Cannot perform input.");
            ex.printStackTrace();
            return null;
        }
    }
}
