<!DOCTYPE html>
<html>
    <head>
        <title>Assignment 1</title>
        <link rel="stylesheet" type="text/css" href="main.css" />
    </head>
<body>
<?php
    $servername = "localhost";
    $username = 'cpsc_user';
    $password = 'pa55word';
    $dbname="Schedule_DB";
    
    //create connection
    $conn = new mysqli($servername, $username, $password, $dbname);
    
    //check connection
    if ($conn->connect_error) {
     die("Connection failed: " . $conn->connect_error);
    } 
    
    //create the query to get the categories
    $query = "SELECT semester FROM course";
    $result = $conn->query($query);
    
    //Create dropdown list
    ?>
    <h2>Select a Semester and Subject</h2>
    <form action ="" method="post">
    <select name ="semesterChosen">
         <option>Semester</option>
         <option>Fall</option>
         <option>Spring</option>
         <option>Summer</option>
        </select>
    <select name ="subjectChosen">
         <option>Subject</option>
         <option>CPSC</option>
         <option>MATH</option>
        </select>
        <input type ="submit" value = "Submit"/>
    </form>
        <?php
        
        
        if(isset($_POST['semesterChosen']))
        {
        $semesterChosen = $_POST['semesterChosen']; 
        $subjectChosen = $_POST['subjectChosen'];
        
        //dont have to specify which table every time
        //$query = "SELECT * FROM course 
        //WHERE course.semester = '$semesterChosen' 
        //AND coursesubject ='$subjectChosen'";
        
        //retrieve all classes
        $query = "SELECT * FROM course 
        WHERE semester = '$semesterChosen' 
        AND subject ='$subjectChosen'";
        $classes = $conn->query($query);

        //retrieve all instructors
        $query = "SELECT * FROM instructor";
        $instructors = $conn->query($query);
        
        //retrieve all rooms
        $query = "SELECT * FROM room";
        $rooms = $conn->query($query);
        
        //retrieve all schedules
        $query = "SELECT * FROM schedule";
        $schedule = $conn->query($query);
        
        echo "<br>";
 
        ?>
            <?php
            
            if ($classes->num_rows > 0) {
                // output data of each row
                while($row = $classes->fetch_assoc() and $row2 = $instructors->fetch_assoc() and $row3 = $rooms->fetch_assoc() and $row4 = $schedule->fetch_assoc()) {
                    ?>
                    <table>
                    <tr>
                        <td colspan='7' id="tdfirst"><?php echo $row["subject"]. " ".$row["courseNum"]; ?></td>
                    </tr>
                    <tr>
                        <td id="td1" colspan='7'><?php echo $row["courseName"]; ?> </td>
                    </tr>
                    <tr>
                        <td id="td1" colspan='7'><?php echo "Credits: 3"; ?></td>
                    </tr>
                    <tr>
                        <td id ="td2" colspan='7'><?php echo $row["description"]; ?> </td>
                    </tr>
                    <tr>
                        <th>CRN</th>
                        <th>Section</th>
                        <th>Day</th>
                        <th>Time</th>
                        <th>Location</th>
                        <th>Instructor</th>
                        <th>Begin/End <br> Dates</th>
                    
                    </tr>
                    <tr>
                        <th><?php echo $row["CRN"]; ?></th>
                        <td><?php echo $row["sectionID"]; ?></td>
                        
                        
                        
                        <?php
                        //Print the days and start and end time
                        $CRNCheck = $row["CRN"];
                        $newquery = "SELECT schedule.* FROM schedule WHERE schedule.courseScheduleID = '$CRNCheck'";
                        $result = $conn->query($newquery);
                        $row7 = $result->fetch_assoc();
                        ?>
                        <td><?php echo $row7["days"]?></td>
                        
                        <td><?php echo $row7["startTime"]. " - " . $row7["endTime"]; ?></td>
                        
                        <?php
                        //Print the room number and building
                        $check = $row["courseNum"];
                        $newquery = "SELECT room.* FROM room WHERE room.courseRoom = '$check'";
                        $result = $conn->query($newquery);
                        $row5 = $result->fetch_assoc();
                        ?>
                        <td><?php echo $row5["building"]. "-" . $row5["roomNum"]; ?></td>
                        
                        <?php
                        //Print the instructor and the start and end date
                        $newquery = "SELECT instructor.* FROM instructor WHERE instructor.classTaught = '$check'";
                        $result = $conn->query($newquery);
                        $row6 = $result->fetch_assoc();
                        ?>
                        <td><?php echo $row6["lastName"]. ", " . $row6["firstName"]. "<br>" .$row6["initial"]; ?></td>
                        <td><?php echo $row7["startDate"]. " - " . $row7["endDate"]; ?></td>
                    </tr>
                    </table>
                    <?php
                    echo "<br>" . "<br>" . "<br>";
                }
                }else {
                    echo "There is no classes for that subject on the selected semester.";
            } 
        }
$conn->close();
?>
</body>
</html>