<%@page import = "DbConnection.ConnectionProvider" %>
<%@page import = "java.sql.*" %>
<%
String rollNoStr = request.getParameter("RollNo");
int rollNo = Integer.parseInt(rollNoStr);
String course = request.getParameter("Course");
String branch = request.getParameter("Branch");
String name = request.getParameter("Name");
String fatherName = request.getParameter("FatherName");
String gender = request.getParameter("Gender");

try {
    Connection con = DbConnection.ConnectionProvider.getCon();
    String query = "INSERT INTO student_details (rollNo, course, branch, name, fatherName, gender) VALUES (?, ?, ?, ?, ?, ?)";
    PreparedStatement preparedStatement = con.prepareStatement(query);
    preparedStatement.setInt(1, rollNo);
    preparedStatement.setString(2, course);
    preparedStatement.setString(3, branch);
    preparedStatement.setString(4, name);
    preparedStatement.setString(5, fatherName);
    preparedStatement.setString(6, gender);
    
    int rowsInserted = preparedStatement.executeUpdate();
    if (rowsInserted > 0) {
        // Insertion successful
        response.sendRedirect("adminHome.jsp");
    } else {
    	    // Handle insertion failure
    	    String errorMessage = "Failed to insert data into the database. Please try again later.";
    	    request.setAttribute("errorMessage", errorMessage);
    }
    
} catch (SQLException e) {
    // Handle SQL exception
    e.printStackTrace(); // Log or handle the exception appropriately
} catch (NumberFormatException e) {
    // Handle parsing error for rollNo
    e.printStackTrace(); // Log or handle the exception appropriately
}


%>