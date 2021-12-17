import java.io.*;
import java.sql.*;

public class DatabaseConn {
    
    public static void main (String args[]) throws Exception {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String url = "jdbc:mysql://localhost:3306/OscarInfo?useSSL=false";
        String user = "root";
        String pass = "root@123";
        Connection conn=null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, pass);
            Statement stt = conn.createStatement();
            int op;

            do {
                System.out.println();
                System.out.println("1.Inserting record");
                System.out.println("2.Updating record");
                System.out.println("3.deleting record");
                System.out.println("4.Selecting record");
                System.out.println("5.Exit");
                System.out.print("Option:");
                op = Integer.parseInt(br.readLine());
                switch(op) {
                    case 1:{
                        System.out.println("Inserting into Film table record: \nFilm name : Spider-Man");
                        String query = "insert into Film values(10,'Spider-Man',2010)";
                        int n = stt.executeUpdate(query);
                        System.out.println(n>0?"Successfully inserted the record":"insertion failed");
                        break;
                    }
                    case 2: {
                        System.out.println("Updating the film table record\nchanging the release year of spider_man movie");
                        String que = "update Film set release_year = 2012 where Film_ID=10";
                        int x = stt.executeUpdate(que);
                        System.out.println(x>0?"Successfully updated the record":"updation failed");
                        break;
                    }
                    case 3:{
                        System.out.println("Deleting the film table record\nFilm name : spider_man");
                        String que = "delete from Film where Film_ID=10";
                        int x = stt.executeUpdate(que);
                        System.out.println(x>0?"Successfully deleted the record":"deletion failed");
                        break;
                    }
                    case 4:{
                        System.out.println("Selecting the actor table records where actor is female and age<35");
                        String que = "select f.Film_name, a.Actor_fname, a.Actor_lname, f.release_year from Film f, Actor a, Film_cast fc where fc.Actor_ID=a.Actor_ID and fc.Film_ID=f.Film_ID;";
                        System.out.println("Film name\tFirst Name\tLast name\tPremiere year");
                        ResultSet rs = stt.executeQuery(que);
                        while(rs.next()){
                            System.out.println(rs.getString(1)+"\t"+rs.getString(2)+"\t"+rs.getString(3)+"\t"+rs.getInt(4));
                        }
                        //System.out.println(n>0?"Successfully updated the record":"updation failed");
                        break;
                    }

                }

            }while(op != 5);
        }
        catch(SQLException e) {
            System.out.println(e);
        }
        catch(ClassNotFoundException e) {
            System.out.println(e);
        }
        finally{
            conn.close();
            br.close();
        }
    }
}
