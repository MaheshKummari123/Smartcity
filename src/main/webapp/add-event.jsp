<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Add Event</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
body {
    background-color: #0f0f0f;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    font-family: Arial;
}

.card { border-radius: 22px; padding: 2px; }
.card2 { border-radius: 20px; }

.form {
    display: flex;
    flex-direction: column;
    gap: 12px;
    padding: 32px;
    background-color: #171717;
    border-radius: 20px;
    width: 520px;
}

#heading {
    text-align: center;
    color: white;
    font-size: 1.4em;
}

.field {
    display: flex;
    align-items: center;
    gap: 10px;
    padding: 12px;
    border-radius: 12px;
    background-color: #171717;
    box-shadow: inset 2px 5px 10px rgb(5,5,5);
}

.input-field {
    background: none;
    border: none;
    outline: none;
    width: 100%;
    color: #d3d3d3;
}

textarea { resize: none; min-height: 70px; }

.btn {
    display: flex;
    justify-content: center;
    margin-top: 15px;
}

button {
    padding: 10px 20px;
    border-radius: 8px;
    border: none;
    background-color: #252525;
    color: white;
    cursor: pointer;
}

button:hover { background: black; }

.reset:hover { background: red; }
</style>

</head>

<body>

<div class="card">
<div class="card2">

<form class="form" action="addEvent" method="post">

<p id="heading">Add Event</p>

<div class="field">
<input type="text" name="eventName" placeholder="Event Name" class="input-field">
</div>

<div class="field">
<textarea name="description" placeholder="Description" class="input-field"></textarea>
</div>

<div class="field">
<select name="eventType" class="input-field">
<option value="">Select Type</option>
<option value="festival">Festival</option>
<option value="concert">Concert</option>
<option value="sports">Sports</option>
<option value="exhibition">Exhibition</option>
</select>
</div>

<div class="field">
<input type="text" name="location" placeholder="Location" class="input-field">
</div>

<div class="field">
<input type="text" name="city" placeholder="City" class="input-field">
</div>

<div class="field">
<input type="date" name="eventDate" class="input-field">
</div>

<div class="field">
<input type="time" name="startTime" class="input-field">
</div>

<div class="field">
<input type="time" name="endTime" class="input-field">
</div>

<div class="field">
<input type="text" name="organizer" placeholder="Organizer Name" class="input-field">
</div>

<div class="field">
<input type="email" name="email" placeholder="Contact Email" class="input-field">
</div>

<div class="field">
<input type="text" name="price" placeholder="Ticket Price" class="input-field">
</div>

<div class="field">
<input type="text" name="imageUrl" placeholder="Image URL" class="input-field">
</div>

<div class="btn">
<button type="submit">Publish Event</button>
</div>

<button type="reset" class="reset">Cancel</button>

</form>

</div>
</div>

</body>
</html>