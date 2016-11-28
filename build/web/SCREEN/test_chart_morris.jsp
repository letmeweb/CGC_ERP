<!DOCTYPE html>
<html lang="en">
    <head>        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">            
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
    </head>
    <body>
        <div id="line-example"></div>
    </body>
    <script>
        $.ajax({
            type: 'POST',
            url: "sales.json",
            dataType: "json",
            async: false,
            contentType: "application/json; charset=utf-8",
            success: function(json) {
                Morris.Line({
                    element: 'line-example',
                    data: $.parseJSON(json),
                    xkey: 'year',
                    ykeys: ['value'],
                    labels: ['Value']
                });
            }
        });
    </script>
</html>