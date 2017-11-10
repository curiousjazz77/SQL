package project1;

import java.sql.*;
import javax.swing.JOptionPane;


public class StudentQuery2 {
    public static void main(String[] args) throws ClassNotFoundException,
    SQLException{
        

        //Load the driver class
        try {
        Class.forName("oracle.jdbc.OracleDriver");
        }
        catch (ClassNotFoundException e){
            System.out.println(e);
        }

        //Data
        Connection conn;
        //db, user, and pass omitted for this code. 
        String db = "*";
        String user = "*";
        String pass = "*";
        String grade;
        int countPerGrade;
        int total =0; 
        String id;
        ResultSet r;
        int incrementA =0;
        int incrementB =0;
        int incrementC =0;
        int incrementD =0;
        int incrementF =0;

        //Connection Initiation
        conn = DriverManager.getConnection(db,
        user, pass);

        //System prompt and statement creation
        PreparedStatement st = conn.prepareStatement("SELECT Grade, COUNT(*) FROM GRADING WHERE StudentID= ? GROUP BY Grade");
        System.out.println("Please input the seven-digit StudentID " +
        "to generate how many of each grade they received.");

        //User Prompt for ID Number
        
            id =
            JOptionPane.showInputDialog("Enter 7-digit student ID:");

            if ( id.length() == 7) {
                System.out.println("You input student ID: " + id + '.');
                System.out.println( "Student " + id + ":\n----------------");
                st.setString(1, id);
                r = st.executeQuery();
                
        //Display results of query

                while(r.next()){
                    grade = r.getString(1);
                    countPerGrade = r.getInt(2);
                    total+= countPerGrade;
                    
                    if (grade.equals("A")){
                    incrementA++;
                }
                            if (grade.equals("A")){
                            incrementA++;
                            }
                            else if (grade.equals("B")){
                            incrementB++;
                            }
                            else if (grade.equals("C")){
                            incrementC++;
                            }
                            else if (grade.equals("D")){
                            incrementD++;
                            }
                            else {
                            incrementF++;
                            }
                            
                
                        }
                }
    System.out.println("A's: " + incrementA);
    System.out.println("B's: " + incrementB);
    System.out.println("C's: " + incrementC);
    System.out.println("D's: " + incrementD);
    System.out.println("F's: " + incrementF);
    System.out.println("Total grades: " + total);
        conn.close();
        
    
}
    }
    
    
