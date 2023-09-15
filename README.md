# SWP391_SE1740NJ_Children_Care_System

This is Project from SWP391.

I. Code Rules
1. Model is package just inlcude object from Table (same attributes) e.g model/User.java
3. Change MSSQL name and Database name in DAO/DBContext.java
4. You can read description below to understand DAO file or read file DAO/DAOUser.java
5. DAO file includes functions get data from database
6. In every file DAO, must "extends DBContext", and copy code:
    PreparedStatement pstm;
    Connection cnn;
    ResultSet rs;

    public DAOUser() {
        connect();
    }

    public void connect() {
        cnn = super.connection;
    }
7. in try/catch must inlcude 2 catching:
        catch (SQLException e) {
            System.out.println("SQL <name_function>: " + e.getMessage());
            return //your_failure_value;
        } catch (Exception e) {
            System.out.println("<name_function>: " + e.getMessage());
            return //your_failure_value;
        }
