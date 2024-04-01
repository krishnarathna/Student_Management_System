<%@ page import="DbConnection.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%
String rollNoStr = request.getParameter("RollNo");
int rollNo = Integer.parseInt(rollNoStr);
String[] subjects = new String[]{"S1", "S2", "S3", "S4", "S5", "S6", "S7"};
String[] marks = new String[subjects.length];

// Retrieve marks for each subject
for (int i = 0; i < subjects.length; i++) {
    marks[i] = request.getParameter(subjects[i]);
}

try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement pst = con.prepareStatement("INSERT INTO student_result (rollNo, S1, S2, S3, S4, S5, S6, S7) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
    
    // Set parameters
    pst.setInt(1, rollNo);
    for (int i = 0; i < subjects.length; i++) {
        pst.setString(i + 2, marks[i]);
    }
    
    int rowsInserted = pst.executeUpdate();
    if (rowsInserted > 0) {
        // Insertion successful
        response.sendRedirect("adminHome.jsp");
    } else {
        // Handle insertion failure
        String errorMessage = "Failed to insert data into the database.";
        request.setAttribute("errorMessage", errorMessage);
    }
} catch (SQLException e) {
    // Handle SQL exception
    String errorMessage = "Database error: " + e.getMessage();
    request.setAttribute("errorMessage", errorMessage);
} catch (NumberFormatException e) {
    // Handle parsing error for rollNo
    String errorMessage = "Invalid roll number format.";
    request.setAttribute("errorMessage", errorMessage);
}
%>
