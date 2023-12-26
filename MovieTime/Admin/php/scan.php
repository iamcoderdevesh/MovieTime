<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Scan</title>
   <link rel="stylesheet" href="../Css/scan.css">
   <style>
      main {
         display: flex;
         justify-content: center;
         align-items: center;
      }

      #reader {
         width: 600px;
      }

      #result {
         text-align: center;
         font-size: 1.5rem;
      }
   </style>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/html5-qrcode/2.3.4/html5-qrcode.min.js"
      integrity="sha512-k/KAe4Yff9EUdYI5/IAHlwUswqeipP+Cp5qnrsUjTPCgl51La2/JhyyjNciztD7mWNKLSXci48m7cctATKfLlQ=="
      crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>

<body>

   <main>
      <div id="reader"></div>
      <div id="result"></div>
   </main>

   <script>
      const scanner = new Html5QrcodeScanner('reader', {
         qrbox: {
            width: 250,
            height: 250,
         },
         fps: 20,
      });
      scanner.render(success, error);
      function success(result) {
         document.getElementById('result').innerHTML = `
<p>Check whether ticket is valid or not</p>
<form method="POST" name="form" action="validateticket.php">
        <input type="text" placeholder="Enter Unique ID" name="UniqueId" value="${result}">
        <input type="submit" value="Check" id="submit">
    </form>
`;
         scanner.clear();
         document.getElementById('reader').remove();
      }
      function error(err) {
         console.error(err);
      }
   </script>

</body>

</html>