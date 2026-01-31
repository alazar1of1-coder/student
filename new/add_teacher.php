<?php
require_once 'db.php';
require_once 'functions.php';
redirectIfNotLoggedIn();
checkRole(['admin']);

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $full_name = sanitizeInput($_POST['full_name']);
    $username = sanitizeInput($_POST['username']);
    $email = sanitizeInput($_POST['email']);
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
    $department = sanitizeInput($_POST['department']);
    
    // Start transaction
    $conn->begin_transaction();
    
    try {
        // Insert into users table
        $stmt = $conn->prepare("INSERT INTO users (username, password, role, full_name, email) VALUES (?, ?, 'teacher', ?, ?)");
        $stmt->bind_param("ssss", $username, $password, $full_name, $email);
        $stmt->execute();
        $user_id = $stmt->insert_id;
        
        // Insert into teachers table
        $stmt = $conn->prepare("INSERT INTO teachers (user_id, department) VALUES (?, ?)");
        $stmt->bind_param("is", $user_id, $department);
        $stmt->execute();
        
        $conn->commit();
        $success = "Teacher added successfully!";
    } catch (Exception $e) {
        $conn->rollback();
        $error = "Error adding teacher: " . $e->getMessage();
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Add Teacher</title>
    <link rel="stylesheet" href="stayle.css">
</head>
<body>
    <div class="container">
        <h2>Add New Teacher</h2>
        <a href="admin_dashboard.php">← Back to Dashboard</a>
        
        <?php if (isset($success)): ?>
            <div class="success"><?php echo $success; ?></div>
        <?php endif; ?>
        
        <?php if (isset($error)): ?>
            <div class="error"><?php echo $error; ?></div>
        <?php endif; ?>
        
        <form method="POST" action="">
            <div class="form-group">
                <label>Full Name:</label>
                <input type="text" name="full_name" required>
            </div>
            
            <div class="form-group">
                <label>Username:</label>
                <input type="text" name="username" required>
            </div>
            
            <div class="form-group">
                <label>Email:</label>
                <input type="email" name="email" required>
            </div>
            
            <div class="form-group">
                <label>Password:</label>
                <input type="password" name="password" required>
            </div>
            
            <div class="form-group">
                <label>Department:</label>
                <input type="text" name="department" required>
            </div>
            
            <button type="submit">Add Teacher</button>
        </form>

        <hr>

        <h2>Existing Teachers</h2>

        <?php
        // Fetch existing teachers
        $sql = "
            SELECT 
                teachers.id AS teacher_id,
                users.full_name,
                users.username,
                users.email,
                teachers.department
            FROM teachers
            INNER JOIN users ON teachers.user_id = users.id
            ORDER BY teachers.id DESC
        ";

        $result = $conn->query($sql);

        if ($result && $result->num_rows > 0):
        ?>
            <table border="1" cellpadding="10" cellspacing="0">
                <tr>
                    <th>ID</th>
                    <th>Full Name</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Department</th>
                    <th>Action</th>
                </tr>

                <?php while ($row = $result->fetch_assoc()): ?>
                    <tr>
                        <td><?php echo $row['teacher_id']; ?></td>
                        <td><?php echo $row['full_name']; ?></td>
                        <td><?php echo $row['username']; ?></td>
                        <td><?php echo $row['email']; ?></td>
                        <td><?php echo $row['department']; ?></td>
                        <td>
                            <a href="edit_teacher.php?id=<?php echo $row['teacher_id']; ?>">Edit</a> |
                            <a href="delete_teacher.php?id=<?php echo $row['teacher_id']; ?>" onclick="return confirm('Delete this teacher?')">Delete</a>
                        </td>
                    </tr>
                <?php endwhile; ?>

            </table>

        <?php else: ?>
            <p>No teachers found.</p>
        <?php endif; ?>

    </div>
</body>
</html>
