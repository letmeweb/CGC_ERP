<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
    function ShowTime()
    {
        var dt = new Date();
        document.write(dt.toTimeString());
        // var elem = document.getElementById("divElem");
        // elem.textContent = dt.toTimeString();
        window.setTimeout("ShowTime();", 5000);
    }
    
   
    
    
</script>
</head>

<body>
<script type="text/javascript">
    ShowTime();
</script>
<div id="myDiv"></div>
</body>
</html>